Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$prohibitedPattern = "^\s*(axiom|unsafe)\b|\b(sorry|admit)\b"
$scanRoots = @(
    "MaleyLean",
    "Checks/Axiom"
)

$auditFiles = @(
    "Checks/Axiom/MinimalConditionsForAdmissibleConstructionAxiomCheck.lean",
    "Checks/Axiom/NonDegenerateConstructionAndKernelOfAdmissibilityAxiomCheck.lean",
    "Checks/Axiom/BSDEndpointClosureAxiomCheck.lean",
    "Checks/Axiom/BSDEndpointStatusLedgerAxiomCheck.lean",
    "Checks/Axiom/BSDTruthBoundaryAxiomCheck.lean",
    "Checks/Axiom/BSDEndpointAuditRunnersAxiomCheck.lean",
    "Checks/Axiom/BSDFullStackAASCAxiomCheck.lean"
)

$signatureMapFile = "formalization_map/BSD_EndpointClosure_PreLeanMap.lean"

if ($auditFiles.Count -ne 7) {
    throw "Expected 7 focused BSD audit files, found $($auditFiles.Count)."
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

if (-not (Test-Path -LiteralPath $signatureMapFile -PathType Leaf)) {
    throw "Missing BSD manuscript signature map: $signatureMapFile"
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

$rgCommand = Get-Command rg -ErrorAction SilentlyContinue
if ($null -ne $rgCommand) {
    $rgArgs = @(
        "-n",
        "--glob",
        "*.lean",
        $prohibitedPattern
    ) + $scanRoots

    $prohibitedMatches = & rg @rgArgs
    if ($LASTEXITCODE -eq 0) {
        $prohibitedMatches | ForEach-Object { Write-Host $_ }
        throw "Prohibited Lean incomplete-proof token or escape found in active BSD audit surface."
    }
    if ($LASTEXITCODE -ne 1) {
        throw "Prohibited-token scan failed with exit code $LASTEXITCODE."
    }
} else {
    Write-Host "ripgrep not found; using PowerShell fallback scan."
    $prohibitedMatches = @(foreach ($scanRoot in $scanRoots) {
        Get-ChildItem -LiteralPath $scanRoot -Recurse -File -Filter "*.lean" |
            Select-String -Pattern $prohibitedPattern |
            ForEach-Object { "$($_.Path):$($_.LineNumber):$($_.Line)" }
    })
    if ($prohibitedMatches.Count -ne 0) {
        $prohibitedMatches | ForEach-Object { Write-Host $_ }
        throw "Prohibited Lean incomplete-proof token or escape found in active BSD audit surface."
    }
}
Write-Host "No live axiom/sorry/admit/unsafe declarations found in active BSD audit surface."

lake build MaleyLean.Papers.BSD.AuditRunners
if ($LASTEXITCODE -ne 0) {
    throw "BSD endpoint Lean build failed with exit code $LASTEXITCODE."
}

foreach ($auditFile in $auditFiles) {
    lake env lean $auditFile
    if ($LASTEXITCODE -ne 0) {
        throw "BSD audit file failed: $auditFile"
    }
}

Write-Host "Checking manuscript signature map parses outside the audit surface:"
Write-Host $signatureMapFile
lake env lean $signatureMapFile
if ($LASTEXITCODE -ne 0) {
    throw "BSD manuscript signature map failed to parse: $signatureMapFile"
}

Write-Host "BSD endpoint audit completed."
