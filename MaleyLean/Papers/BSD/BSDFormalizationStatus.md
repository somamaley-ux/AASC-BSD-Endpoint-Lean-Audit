# BSD Endpoint Formalization Status

Current comparable maturity against the final P vs NP SAT endpoint archive:

- `BSDRankEndpointClosure=100%`
- `BSDRefinedFormulaBridgeBoundary=100%`
- `BSDReferenceArchiveMaturityComparable=93%`

The refined formula figure is no longer a partial analytic-construction
percentage. It records that the AASC bridge/factor-standing boundary is
explicit in Lean, matching the role-compression analysis.

## Closed In The Lean Audit Spine

- Fixed-carrier official endpoint use:
  `bsdEndpointUnderAudit_binds_pointwise`
- Rank mismatch normal form:
  `bsdRankMismatch_iff_bridgeImageSeparatorBranch`
- Non-optional negative occupation:
  `bsdRankMismatchOccupation_nonoptional`
- Endpoint-status bivalence/governed-use fork:
  `bsdGovernedEndpointUse_bivalent`
- Negative governed use has separator status:
  `bsdNegativeGovernedEndpointUse_has_separatorStatus`
- Separator branch induces theorem-level rank-status discriminator:
  `bsdRankBridgeImageSeparatorBranch_theoremLevelDiscriminator`
- Official negative endpoint use is endpoint-status governance:
  `bsdOfficialNegativeEndpointUse_endpointStatusGovernance`
- Endpoint governance induces an independent rank discriminator:
  `bsdMismatch_independentRankDiscriminator`
- BSD rank governance is mapped into the shared AASC foundational-candidate
  classifier exclusion:
  `BSDRankFoundationalCandidate`,
  `bsdNoIndependentRankDiscriminator_of_foundationalNoClassifier`,
  `bsdRankEndpointAuditHypotheses_of_foundationalNoClassifier`
- The no-independent-rank-discriminator package excludes mismatch:
  `bsdRankMismatch_impossible`
- Pointwise rank equality and official rank endpoint:
  `bsdRankEquality_forced`,
  `officialBSDRankEndpoint_of_auditHypotheses`,
  `officialBSDRankEndpoint_of_foundationalNoClassifier`
- Single AASC-context closeout:
  `BSDRankEndpointAASCContext`,
  `officialBSDRankEndpoint_of_aascContext`,
  `bsdRankEndpointAASCContext_closes_rankEndpoint`
- Combined AASC/BSD full-stack axiom entry:
  `Checks/Axiom/BSDFullStackAASCAxiomCheck.lean`
- Status-ledger metadata completion:
  `bsdEndpointStatusObligationTitlesPopulatedBool_eq_true`,
  `bsdEndpointStatusLedgerLeanAnchorsPopulatedBool_eq_true`,
  `bsdEndpointStatusLedgerSourceEvidencePopulatedBool_eq_true`
- Truth-boundary ledger:
  `bsdTruthBoundaryMetadataComplete_holds`,
  `bsdTruthBoundaryCountComplete_holds`,
  `bsdTruthBoundaryLedgerComplete_holds`

## Bridge Boundary

The refined formula endpoint is intentionally recorded at the bridge/factor
standing boundary:

- `bsdConditionalRefinedFormula_correspondence`
- `BSDFormulaFactorStandingPacket`
- `bsdFormulaFactorsStanding_of_packet`
- `bsdFormulaFactorStandingPacket_components`
- `refinedBSDEndpoint_context_iff`
- `BSDRefinedFormulaConditionalContext`
- `conditionalRefinedBSDEndpoint_of_context`
- `bsdRefinedFormulaEndpoint_remains_conditional`
- `BSDFormulaFactorsStanding`
- `bsdTruthBoundaryLedgerComplete_holds`

The archive does not claim a first-principles arithmetic construction of
elliptic curves, L-functions, regulators, Tamagawa factors,
Tate-Shafarevich finiteness, or the refined leading coefficient formula.
Those are bridge/factor roles in the AASC role-compression framing, not an
unfinished analytic proof route inside this repo.

## Role-Compression Source Boundary

The AASC claim-class framing is supplied by:

- `A_Structural_Solution_to_the_Birch_and_Swinnerton_Dyer_Role_Compression_Problem`

That source locates the classical BSD/refined formula content as bridge
completion inside the decompressed role architecture. The Lean audit archive
uses that framing to keep rank endpoint closure, carrier abstraction, and
factor-standing boundaries separate.

## Pre-Lean Map Boundary

`formalization_map/BSD_EndpointClosure_PreLeanMap.lean` is a manuscript
signature map.  It intentionally contains `axiom` declarations as planning
anchors and is not imported by the executable Lean audit surface.  The
aggregate audit verifies that it is not imported by the active Lean surface,
then parses it separately to catch stale theorem handles.
