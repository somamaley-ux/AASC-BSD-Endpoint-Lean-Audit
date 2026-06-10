# AASC BSD Endpoint Lean Audit

Standalone Lean 4 archive for the AASC-first Birch and Swinnerton-Dyer rank
endpoint proof spine in:

`BSD Endpoint Closure AASC`

This repository separates the BSD endpoint audit surface from the larger mixed
AASC working checkout. It contains the reusable AASC support spine, the BSD
rank-endpoint Lean audit module, focused axiom checks, the pre-Lean
formalization map, and the manuscript-facing PDF/source snapshot.

## Current Status

The strongest truthful claim for this archive is:

- `MaleyLean.Papers.BSD.AuditRunners` builds in a standalone Lake project.
- The reusable AASC foundation layer used by the route is included in the same
  repository: bivalence/nondegenerate reasoning, minimal conditions/A+
  support, and the nondegenerate kernel/admissibility anchor.
- The BSD rank endpoint route is mechanized at the proof-spine level:
  rank mismatch is routed to bridge-image exclusion; endpoint-resolving
  mismatch use becomes theorem-level rank-status governance; governance induces
  an independent same-domain rank discriminator; the audit hypotheses exclude
  such discriminators; therefore pointwise rank equality is forced.
- The BSD audit now includes an explicit status ledger and audit-runner
  registry:
  `MaleyLean.Papers.BSD.StatusLedger` and
  `MaleyLean.Papers.BSD.AuditRunners`.
  The status ledger also checks that obligation titles, Lean anchors, source
  evidence, progress summaries, and boundary percentages are populated.
- The BSD audit also includes a truth-boundary ledger:
  `MaleyLean.Papers.BSD.TruthBoundary`, which records which parts are closed
  in the Lean proof spine and which parts remain semantic or arithmetic
  standing. The truth-boundary ledger checks its item catalog, row counts,
  Lean anchors, and explanatory boundary text.
- Current recorded progress is
  `BSDRankEndpointClosure=100%`,
  `BSDRefinedFormulaBridgeBoundary=100%`, and
  `BSDReferenceArchiveMaturityComparable=93%`.
- The final internal endpoint is `OfficialBSDRankEndpoint`, stated as
  pointwise equality of the represented analytic and Mordell-Weil rank
  readouts on the explicit BSD carrier.
- The refined BSD formula layer is represented as an explicit
  bridge/factor-standing boundary through a structured
  `BSDFormulaFactorStandingPacket`; this archive does not claim a
  first-principles arithmetic construction of the leading coefficient formula,
  Tate-Shafarevich group finiteness, regulators, Tamagawa factors, torsion,
  analytic continuation, or functional equations.
- The seven focused BSD/AASC audit files run, including the truth-boundary
  check and the combined full-stack
  AASC/BSD check, and the focused BSD checks report
  no axioms for the audited BSD closeout anchors.
- The aggregate audit also parses the manuscript signature map in
  `formalization_map/BSD_EndpointClosure_PreLeanMap.lean` outside the audited
  proof surface, so stale theorem handles are caught without treating that map
  as an axiom-free proof. The aggregate audit also checks that this pre-Lean
  signature map is not imported by the active Lean audit surface.

This archive should be read as an AASC endpoint-structure audit for the BSD
rank endpoint, not as a full arithmetic-geometry library. Elliptic curves,
L-functions, analytic rank, and Mordell-Weil rank are represented by explicit
carrier fields and endpoint predicates so the AASC closure route can be audited
without importing a large external arithmetic formalization.

## Verification

Use:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/check-bsd-endpoint-audit.ps1
```

GitHub also runs this audit on push, pull request, and manual dispatch through
`.github/workflows/audit.yml`.
The latest pushed `main` workflow run is expected to pass before each release.

To create a local zip archive from exactly the tracked repository files:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/package-bsd-release.ps1
```

The package and checksum are written under `dist/`, which is intentionally not
tracked.

The audit runner:

- prints the Lean toolchain;
- prints the pinned mathlib manifest revision;
- scans the active Lean audit surface for live `axiom`, `sorry`, `admit`, or
  `unsafe` declarations;
- builds `MaleyLean.Papers.BSD.AuditRunners`;
- runs seven focused AASC/BSD audit files, including the BSD closure, status
  ledger, truth-boundary ledger, audit-runner, and full-stack AASC/BSD axiom
  checks;
- checks that the pre-Lean manuscript signature map is not imported by the
  active Lean audit surface;
- parses the pre-Lean manuscript signature map outside the active axiom-free
  audit surface.

Pinned environment:

- Lean toolchain: `leanprover/lean4:v4.28.0`
- mathlib revision: `8f9d9cff6bd728b17a24e163c9402775d9e6a365`

## Main Lean Anchors

The BSD proof-spine objects are in:

- `MaleyLean/Papers/BSD/EndpointClosure.lean`

Key carrier and endpoint anchors:

- `EllipticCurveQ`
- `BSDCarrier`
- `OfficialBSDRankEndpoint`
- `BSDRankEndpointAuditHypotheses`
- `BSDRankEndpointAASCContext`
- `BSDRefinedFormulaConditionalContext`
- `BSDFormulaFactorStandingPacket`
- `BSDFormulaFactorsStanding`
- `ConditionalRefinedBSDEndpoint`

Key BSD rank route anchors:

- `BSDRankMismatch`
- `BSDRankMismatchNormalForm`
- `BSDRankBridgeImageExclusion`
- `BSDRankBridgeImageSeparatorBranch`
- `BSDRankMismatchEndpointOccupation`
- `BSDRankEndpointStatus`
- `BSDRankEndpointStatusOccupation`
- `BSDGovernedEndpointUse`
- `BSDNegativeGovernedEndpointUse`
- `BSDOfficialNegativeEndpointUse`
- `BSDTheoremLevelRankStatusDiscriminator`
- `BSDRankEndpointStatusGovernance`
- `BSDIndependentRankDiscriminator`
- `BSDRankFoundationalCandidate`
- `bsdRankMismatch_iff_standardNormalForm`
- `bsdStandardNormalForm_iff_rankBridgeImageExclusion`
- `bsdRankMismatch_iff_bridgeImageExclusion`
- `bsdBridgeImageExclusion_iff_separatorBranch`
- `bsdRankMismatch_iff_bridgeImageSeparatorBranch`
- `bsdRankMismatchOccupation_exhaustion`
- `bsdRankMismatchOccupation_nonoptional`
- `bsdGovernedEndpointUse_bivalent`
- `bsdNegativeGovernedEndpointUse_has_separatorStatus`
- `bsdRankBridgeImageSeparatorBranch_of_negativeGovernedEndpointUse`
- `bsdRankBridgeImageSeparatorBranch_theoremLevelDiscriminator`
- `bsdOfficialNegativeEndpointUse_endpointStatusGovernance`
- `bsdEndpointResolvingMismatchTheorem_is_endpointStatusGovernance`
- `bsdRankFoundationalCandidate_classifier_iff`
- `bsdNoIndependentRankDiscriminator_of_foundationalNoClassifier`
- `bsdRankEndpointAuditHypotheses_of_foundationalNoClassifier`
- `bsdBridgeImageExclusion_endpointUsed_theoremLevelDiscriminator`
- `bsdEndpointResolvingNonGovernance_hiddenFifthCase_impossible`
- `bsdMismatch_endpointGovernance`
- `bsdMismatch_independentRankDiscriminator`
- `bsdRankMismatch_impossible`
- `bsdRankEquality_forced`
- `officialBSDRankEndpoint_of_auditHypotheses`
- `officialBSDRankEndpoint_of_foundationalNoClassifier`
- `officialBSDRankEndpoint_of_aascContext`
- `bsdRankEndpointAASCContext_closes_rankEndpoint`
- `bsdFormulaFactorsStanding_of_packet`
- `bsdFormulaFactorStandingPacket_components`
- `refinedBSDEndpoint_context_iff`
- `bsdConditionalRefinedFormula_correspondence`
- `conditionalRefinedBSDEndpoint_of_context`
- `bsdRefinedFormulaEndpoint_remains_conditional`
- `bsdTruthBoundaryLedgerComplete_holds`

## Scope Boundary

The proof architecture is AASC-internal at the endpoint-structure level. The
archive does not formalize the full classical BSD theorem or the arithmetic
geometry required to construct analytic rank, Mordell-Weil rank, the BSD
leading coefficient formula, or the standard literature surrounding elliptic
curves over `Q`.

The rank endpoint and refined formula bridge boundary are deliberately
separated:

- the rank endpoint route is the closed audit spine in Lean;
- the refined formula layer is the explicit AASC bridge/factor-standing
  boundary represented by `BSDFormulaFactorStandingPacket`, not an unfinished
  analytic-construction percentage.

`formalization_map/BSD_EndpointClosure_PreLeanMap.lean` is a pre-Lean
manuscript signature map. It intentionally contains planning `axiom`
declarations and is not imported by the executable audit surface.
The aggregate audit enforces that non-import boundary before parsing the map
separately.

## Repository Layout

- `MaleyLean/Papers/BSD/` - BSD endpoint proof spine.
- `MaleyLean/Papers/MinimalConditionsForAdmissibleConstruction/` - A+ support
  spine reused by the BSD route.
- `MaleyLean/Papers/BivalenceNonDegenerateReasoning/` - bivalence support
  spine reused by the AASC route.
- `MaleyLean/Papers/NonDegenerateConstructionAndKernelOfAdmissibility.lean` -
  kernel/admissibility support anchor.
- `Checks/Axiom/` - focused Lean axiom-print entry points.
- `formalization_map/` - manuscript-to-Lean pre-formalization map.
- `papers/bsd/` - manuscript-facing source/PDF snapshot.
- `scripts/` - verification scripts.
- `dist/` - ignored local release packages created by the packaging script.
- `GITHUB_RELEASE.md` - suggested release title and notes.
- `AUDIT_HANDOFF.md` - short theorem-chain and truth-boundary handoff.

## Reading Order

Start with:

- `papers/bsd/PROJECT_LEDGER.md`
- `AUDIT_HANDOFF.md`
- `MaleyLean/Papers/BSD/BSDFormalizationStatus.md`
- `formalization_map/BSD_EndpointClosure_PreLeanMap.lean`
- `scripts/check-bsd-endpoint-audit.ps1`
- `GITHUB_RELEASE.md`
- `MaleyLean/Papers/BSD/EndpointClosure.lean`
- `MaleyLean/Papers/BSD/StatusLedger.lean`
- `MaleyLean/Papers/BSD/AuditRunners.lean`
