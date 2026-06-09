$ErrorActionPreference = "Stop"

Write-Host "Lean toolchain:"
Get-Content lean-toolchain

Write-Host "Mathlib manifest revision:"
$manifest = Get-Content lake-manifest.json -Raw | ConvertFrom-Json
$mathlib = $manifest.packages | Where-Object { $_.name -eq "mathlib" } | Select-Object -First 1
Write-Host $mathlib.rev

lake build MaleyLean.Papers.BSD.EndpointClosure
lake env lean Checks\Axiom\BSDEndpointClosureAxiomCheck.lean

Write-Host "BSD endpoint audit completed."
