# BSD Audit Handoff

This file is the short audit path for the standalone BSD endpoint archive.

## Current Status

- `BSDRankEndpointClosure=100%`
- `BSDRefinedFormulaConditionalClosure=82%`
- `PvsNPArchiveMaturityComparable=90%`

The rank endpoint is the closed Lean proof-spine target.  The refined formula
endpoint is intentionally conditional on explicit formula-factor standing.

## Verification Commands

```powershell
lake build MaleyLean.Papers.BSD.AuditRunners
powershell -ExecutionPolicy Bypass -File scripts/check-bsd-endpoint-audit.ps1
```

The aggregate script checks for live `axiom`, `sorry`, `admit`, or `unsafe`
declarations in the active BSD audit surface, builds the BSD audit runner, and
runs the focused axiom-print audit files.

To create a local handoff zip and checksum from exactly the tracked files:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/package-bsd-release.ps1
```

## Rank Endpoint Chain

The main rank endpoint route is in:

- `MaleyLean/Papers/BSD/EndpointClosure.lean`

The shortest theorem chain for audit is:

- `bsdRankMismatchOccupation_nonoptional`
- `bsdGovernedEndpointUse_bivalent`
- `bsdNegativeGovernedEndpointUse_has_separatorStatus`
- `bsdRankBridgeImageSeparatorBranch_of_negativeGovernedEndpointUse`
- `bsdRankBridgeImageSeparatorBranch_theoremLevelDiscriminator`
- `bsdOfficialNegativeEndpointUse_endpointStatusGovernance`
- `bsdMismatch_independentRankDiscriminator`
- `bsdNoIndependentRankDiscriminator_of_foundationalNoClassifier`
- `bsdRankMismatch_impossible`
- `bsdRankEquality_forced`
- `officialBSDRankEndpoint_of_auditHypotheses`
- `officialBSDRankEndpoint_of_foundationalNoClassifier`
- `officialBSDRankEndpoint_of_aascContext`
- `bsdRankEndpointAASCContext_closes_rankEndpoint`

The final theorem has the same shape as the P vs NP SAT archive: once the
fixed BSD endpoint use, carrier standing, kernel standing, and AASC
no-independent-classifier closure are packaged in `BSDRankEndpointAASCContext`,
the official rank endpoint follows.

## Refined Formula Boundary

The refined formula layer is not claimed unconditionally.  The audited guard is:

- `BSDFormulaFactorStandingPacket`
- `BSDRefinedFormulaConditionalContext`
- `refinedBSDEndpoint_context_iff`
- `bsdRefinedFormulaEndpoint_remains_conditional`

This means the archive records the exact conditional boundary, but does not
formalize analytic continuation, functional equation, leading coefficient,
regulator, Tamagawa, torsion, or Tate-Shafarevich standing from first
principles.

## Truth Boundary

The archive has an explicit Lean truth-boundary ledger:

- `MaleyLean/Papers/BSD/TruthBoundary.lean`
- `Checks/Axiom/BSDTruthBoundaryAxiomCheck.lean`
- `bsdTruthBoundaryLedgerComplete_holds`

That ledger separates:

- closed Lean proof-spine claims;
- semantic carrier abstraction;
- external arithmetic-geometry standing;
- manuscript PDF snapshot status.

## Manuscript Snapshot

The latest source-level manuscript snapshot is:

- `papers/bsd/main.tex`

The bundled PDF is:

- `papers/bsd/BSD_Endpoint_Closure_AASC.pdf`

The PDF was built before the latest Lean-name alignment for the refined formula
guard.  Regenerate it in a LaTeX-enabled environment before treating the PDF as
the latest source render.
