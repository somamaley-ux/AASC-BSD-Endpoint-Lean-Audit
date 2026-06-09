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
- Current recorded progress is
  `BSDRankEndpointClosure=100%`,
  `BSDRefinedFormulaConditionalClosure=60%`, and
  `PvsNPArchiveMaturityComparable=75%`.
- The final internal endpoint is `OfficialBSDRankEndpoint`, stated as
  pointwise equality of the represented analytic and Mordell-Weil rank
  readouts on the explicit BSD carrier.
- The refined BSD formula layer is represented only conditionally through
  `BSDFormulaFactorsStanding`; this archive does not claim a first-principles
  formalization of the leading coefficient formula, Tate-Shafarevich group
  finiteness, regulators, Tamagawa factors, or the analytic continuation and
  functional equation of L-functions.
- The five focused BSD/AASC audit files run, and the focused BSD checks report
  no axioms for the audited BSD closeout anchors.

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

The audit runner:

- prints the Lean toolchain;
- prints the pinned mathlib manifest revision;
- scans the active Lean audit surface for live `axiom`, `sorry`, `admit`, or
  `unsafe` declarations;
- builds `MaleyLean.Papers.BSD.AuditRunners`;
- runs five focused AASC/BSD audit files, including the BSD closure, status
  ledger, and audit-runner axiom checks.

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
- `bsdConditionalRefinedFormula_correspondence`

## Scope Boundary

The proof architecture is AASC-internal at the endpoint-structure level. The
archive does not formalize the full classical BSD theorem or the arithmetic
geometry required to construct analytic rank, Mordell-Weil rank, the BSD
leading coefficient formula, or the standard literature surrounding elliptic
curves over `Q`.

The rank endpoint and refined formula endpoint are deliberately separated:

- the rank endpoint route is the closed audit spine in Lean;
- the refined formula endpoint is conditional on the additional formula-factor
  standing represented by `BSDFormulaFactorsStanding`.

`formalization_map/BSD_EndpointClosure_PreLeanMap.lean` is a pre-Lean
manuscript signature map. It intentionally contains planning `constant` and
`axiom` declarations and is not imported by the executable audit surface.

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

## Reading Order

Start with:

- `papers/bsd/PROJECT_LEDGER.md`
- `MaleyLean/Papers/BSD/BSDFormalizationStatus.md`
- `formalization_map/BSD_EndpointClosure_PreLeanMap.lean`
- `scripts/check-bsd-endpoint-audit.ps1`
- `MaleyLean/Papers/BSD/EndpointClosure.lean`
- `MaleyLean/Papers/BSD/StatusLedger.lean`
- `MaleyLean/Papers/BSD/AuditRunners.lean`
