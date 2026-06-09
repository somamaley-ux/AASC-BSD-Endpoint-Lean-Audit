# BSD Endpoint Formalization Status

Current comparable maturity against the final P vs NP SAT endpoint archive:

- `BSDRankEndpointClosure=100%`
- `BSDRefinedFormulaConditionalClosure=60%`
- `PvsNPArchiveMaturityComparable=55%`

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
- The no-independent-rank-discriminator package excludes mismatch:
  `bsdRankMismatch_impossible`
- Pointwise rank equality and official rank endpoint:
  `bsdRankEquality_forced`,
  `officialBSDRankEndpoint_of_auditHypotheses`

## Conditional Boundary

The refined formula endpoint is intentionally conditional:

- `bsdConditionalRefinedFormula_correspondence`
- `BSDFormulaFactorsStanding`

The archive does not claim a first-principles arithmetic-geometry
formalization of elliptic curves, L-functions, regulators, Tamagawa factors,
Tate-Shafarevich finiteness, or the refined leading coefficient formula.

## Pre-Lean Map Boundary

`formalization_map/BSD_EndpointClosure_PreLeanMap.lean` is a manuscript
signature map.  It intentionally contains `constant` and `axiom` declarations
as planning anchors and is not imported by the executable Lean audit surface.
