Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$prohibitedPattern = "^\s*(axiom|unsafe)\b|\b(sorry|admit)\b"
$scanRoots = @(
    "MaleyLean",
    "Checks\Axiom"
)

$auditFiles = @(
    "Checks\Axiom\MinimalConditionsForAdmissibleConstructionAxiomCheck.lean",
    "Checks\Axiom\NonDegenerateConstructionAndKernelOfAdmissibilityAxiomCheck.lean",
    "Checks\Axiom\BSDEndpointClosureAxiomCheck.lean",
    "Checks\Axiom\BSDEndpointStatusLedgerAxiomCheck.lean",
    "Checks\Axiom\BSDEndpointAuditRunnersAxiomCheck.lean"
)

if ($auditFiles.Count -ne 5) {
    throw "Expected 5 focused BSD audit files, found $($auditFiles.Count)."
}

$uniqueAuditFiles = $auditFiles | Select-Object -Unique
if ($uniqueAuditFiles.Count -ne $auditFiles.Count) {
    throw "BSD audit file list contains duplicates."
}

foreach ($auditFile in $auditFiles) {
    if (-not (Test-Path -LiteralPath $auditFile -PathType Leaf)) {
        throw "Missing BSD audit file: $auditFile"
    }
}

Write-Host "Lean toolchain:"
Get-Content -LiteralPath "lean-toolchain"

Write-Host "Mathlib manifest revision:"
$manifest = Get-Content -LiteralPath "lake-manifest.json" -Raw | ConvertFrom-Json
$mathlib = $manifest.packages | Where-Object { $_.name -eq "mathlib" } | Select-Object -First 1
if ($null -eq $mathlib) {
    throw "Could not locate mathlib in lake-manifest.json."
}
Write-Host $mathlib.rev

$rgArgs = @(
    "-n",
    "--glob",
    "*.lean",
    $prohibitedPattern
) + $scanRoots

$prohibitedMatches = & rg @rgArgs
if ($LASTEXITCODE -eq 0) {
    $prohibitedMatches | ForEach-Object { Write-Host $_ }
    throw "Prohibited Lean placeholder or escape found in active BSD audit surface."
}
if ($LASTEXITCODE -ne 1) {
    throw "Prohibited-token scan failed with exit code $LASTEXITCODE."
}
Write-Host "No live axiom/sorry/admit/unsafe declarations found in active BSD audit surface."

lake build MaleyLean.Papers.BSD.AuditRunners
foreach ($auditFile in $auditFiles) {
    lake env lean $auditFile
}

Write-Host "BSD endpoint audit completed."
