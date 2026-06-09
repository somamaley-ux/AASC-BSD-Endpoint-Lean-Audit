import MaleyLean.Papers.BSD.EndpointClosure

open MaleyLean.Papers.BSD.EndpointClosure

/-!
# BSD endpoint closure axiom surface

The BSD module is currently an audit spine.  These checks make sure the routed
BSD endpoint closeout has no live project axioms.
-/

#print axioms BSDCarrier
#print axioms OfficialBSDRankEndpoint
#print axioms BSDRankMismatch
#print axioms BSDRankEndpointAuditHypotheses
#print axioms bsdRankMismatch_iff_standardNormalForm
#print axioms bsdStandardNormalForm_iff_rankBridgeImageExclusion
#print axioms bsdRankMismatch_iff_bridgeImageExclusion
#print axioms bsdEndpointResolvingNonGovernance_hiddenFifthCase_impossible
#print axioms bsdMismatch_endpointGovernance
#print axioms bsdMismatch_independentRankDiscriminator
#print axioms bsdRankMismatch_impossible
#print axioms bsdRankEquality_forced
#print axioms bsdRankEndpoint_officialCorrespondence
#print axioms officialBSDRankEndpoint_of_auditHypotheses
#print axioms bsdConditionalRefinedFormula_correspondence
