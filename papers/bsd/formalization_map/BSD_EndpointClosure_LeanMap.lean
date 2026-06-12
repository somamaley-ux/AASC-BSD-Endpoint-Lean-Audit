/-
Lean-facing formalization map for the BSD endpoint closure manuscript.
The declarations below are signatures/anchors only. They record the stabilized
manuscript theorem surface for a later routing audit; this file is not presented
as a completed machine-checked proof of the arithmetic geometry background.
-/

namespace BSD.EndpointClosure

constant EllipticCurveQ : Type
constant LFunction : EllipticCurveQ -> Type
constant MordellWeilGroup : EllipticCurveQ -> Type
constant BSDLawfulEquivalence : EllipticCurveQ -> Type

structure BSDCarrier where
  curve : EllipticCurveQ
  Lfunction : LFunction curve
  MWGroup : MordellWeilGroup curve
  lawfulEquiv : BSDLawfulEquivalence curve

constant analyticRank : BSDCarrier -> Nat
constant mordellWeilRank : BSDCarrier -> Nat

constant BSDRankEndpointUnderAudit : Prop
constant BSDOfficialEndpointUse : BSDCarrier -> Prop
constant BSDOfficialNegativeEndpointUse : BSDCarrier -> Prop
constant BSDCarrierInstantiated : BSDCarrier -> Prop
constant StandardBSDCarrierInstantiated : BSDCarrier -> Prop
constant BSDCarrierAdequate : BSDCarrier -> Prop
constant BSDEndpointAdequate : BSDCarrier -> Prop
constant NonDegenerateBSDRankRegime : BSDCarrier -> Prop
constant BSDKernelInstantiated : BSDCarrier -> Prop
constant BSDLossOfNonDegenerateEndpointStatus : BSDCarrier -> Prop
constant BSDLocalKernelPacketK1K13 : BSDCarrier -> Prop

constant BSDAnalyticStanding : BSDCarrier -> Nat -> Prop
constant BSDRankReadout : BSDCarrier -> Nat -> Prop
constant BSDRankMismatch : BSDCarrier -> Prop
constant BSDRankMismatchNormalForm : BSDCarrier -> Prop
constant BSDRankBridgeImageExclusion : BSDCarrier -> Prop
constant BSDRankBridgeObject : BSDCarrier -> Nat -> Prop
constant BSDRankBridgeObjectComplete : BSDCarrier -> Nat -> Prop
constant BSDRankEq : BSDCarrier -> Prop
constant BSDReductioCountercase : BSDCarrier -> Prop
constant BSDLocalMismatchCountercase : BSDCarrier -> Prop
constant BSDEndpointCounterforce : BSDCarrier -> Prop
constant BSDLocalBridgeImageExclusion : BSDCarrier -> Prop
constant BSDRankRolesTotalUnique : BSDCarrier -> Prop
constant BSDRankMismatchNotCoequalEndpointRole : BSDCarrier -> Prop
constant BSDTheoremLevelRankStatusDiscriminator : BSDCarrier -> Prop
constant BSDRankEndpointStatusGovernance : BSDCarrier -> Prop
constant BSDATSUseClassification : BSDCarrier -> Prop
constant BSDIndependentRankDiscriminator : BSDCarrier -> Prop
constant OfficialBSDRankEndpoint : Prop

constant BSDFormulaFactorsStanding : BSDCarrier -> Prop
constant BSDFormula : BSDCarrier -> Prop
constant ConditionalRefinedBSDEndpoint : BSDCarrier -> Prop
constant BSDFormulaMismatch : BSDCarrier -> Prop
constant BSDFormulaEndpointStatusGovernance : BSDCarrier -> Prop
constant BSDIndependentFormulaDiscriminator : BSDCarrier -> Prop
constant BSDOfficialFormulaEndpointUse : BSDCarrier -> Prop
constant BSDOfficialFormulaNegativeEndpointUse : BSDCarrier -> Prop

inductive BSDRankMismatchUseKind where
  | proofSupportObservation
  | endpointResolvingMismatchTheorem
  | endpointResolvingNonGovernance
  | carrierChangingMismatchClaim

axiom bsdEndpointUnderAudit_pointwiseUse
    {E : BSDCarrier} :
    BSDRankEndpointUnderAudit -> BSDOfficialEndpointUse E

axiom bsdEndpointUnderAudit_binds_pointwise
    {E : BSDCarrier} :
    BSDRankEndpointUnderAudit ->
      BSDOfficialEndpointUse E /\ BSDCarrierInstantiated E

axiom bsdStandardCarrier_instantiates_adequateCarrier
    {E : BSDCarrier} :
    StandardBSDCarrierInstantiated E ->
      BSDCarrierInstantiated E /\ BSDCarrierAdequate E

axiom bsdRankRoles_total_unique_on_adequateCarrier
    {E : BSDCarrier} :
    BSDCarrierAdequate E -> BSDRankRolesTotalUnique E

axiom bsdEndpointAdequacy_forces_kernel_roles
    {E : BSDCarrier} :
    BSDEndpointAdequate E -> BSDKernelInstantiated E

axiom bsdKernelGovernance_forced_by_nondegenerateRegime
    {E : BSDCarrier} :
    NonDegenerateBSDRankRegime E -> BSDKernelInstantiated E

axiom bsdEndpointUse_instantiates_kernel
    {E : BSDCarrier} :
    BSDOfficialEndpointUse E -> BSDKernelInstantiated E

axiom bsdKernelDenial_hasEndpointCost
    {E : BSDCarrier} :
    NonDegenerateBSDRankRegime E -> Not (BSDKernelInstantiated E) ->
      BSDLossOfNonDegenerateEndpointStatus E

axiom bsdEndpointUse_fixes_carrier_instantiation
    {E : BSDCarrier} :
    BSDOfficialEndpointUse E -> BSDCarrierInstantiated E

axiom bsdLocalKernelPacket_K1_K13
    {E : BSDCarrier} :
    NonDegenerateBSDRankRegime E -> BSDLocalKernelPacketK1K13 E

constant BSDMismatchGovernancePermissiveWeakening : BSDCarrier -> Prop
constant BSDNoStrictSameCarrierWeakening : BSDCarrier -> Prop

axiom bsdNoLowerSameDomainKernelDerivation
    {E : BSDCarrier} :
    BSDOfficialEndpointUse E -> BSDKernelInstantiated E

axiom bsdNoStrictSameCarrierWeakening_permitsMismatchGovernance
    {E : BSDCarrier} :
    BSDMismatchGovernancePermissiveWeakening E -> BSDNoStrictSameCarrierWeakening E

axiom bsdRankMismatch_iff_standardNormalForm
    {E : BSDCarrier} :
    BSDRankMismatch E <-> BSDRankMismatchNormalForm E

axiom bsdStandardNormalForm_iff_rankBridgeImageExclusion
    {E : BSDCarrier} :
    BSDRankMismatchNormalForm E <-> BSDRankBridgeImageExclusion E

axiom bsdRankMismatch_iff_bridgeImageExclusion
    {E : BSDCarrier} :
    BSDRankMismatch E <-> BSDRankBridgeImageExclusion E

axiom bsdRankBridgeObject_nonCircular
    {E : BSDCarrier} {n : Nat} :
    BSDRankBridgeObject E n -> BSDCarrierAdequate E

axiom bsdRankBridgeObjectComplete_commonRankValue
    {E : BSDCarrier} {n : Nat} :
    BSDRankBridgeObjectComplete E n -> BSDRankEq E

axiom bsdFixedValueBridgeFailure_bridgeImageExclusion
    {E : BSDCarrier} {n m : Nat} :
    BSDRankBridgeObject E n -> BSDAnalyticStanding E n -> BSDRankReadout E m ->
      Not (n = m) -> BSDRankBridgeImageExclusion E

axiom bsdBridgeImageExclusion_endpointUsed_theoremLevelDiscriminator
    {E : BSDCarrier} :
    BSDRankBridgeImageExclusion E -> BSDOfficialNegativeEndpointUse E ->
      BSDTheoremLevelRankStatusDiscriminator E

axiom bsdReductioCountercase_localCountercase
    {E : BSDCarrier} :
    BSDCarrierAdequate E -> BSDReductioCountercase E -> BSDLocalMismatchCountercase E

axiom bsdLocalCountercase_endpointCounterforce
    {E : BSDCarrier} :
    BSDLocalMismatchCountercase E -> BSDEndpointCounterforce E

axiom bsdLocalCounterforce_bridgeImageExclusion
    {E : BSDCarrier} :
    BSDCarrierAdequate E -> BSDEndpointCounterforce E -> BSDRankMismatch E ->
      BSDLocalBridgeImageExclusion E

axiom bsdLocalBridgeImageExclusion_independentDiscriminator
    {E : BSDCarrier} :
    BSDLocalBridgeImageExclusion E -> BSDIndependentRankDiscriminator E

axiom bsdLocalMismatchCountercase_contradiction
    {E : BSDCarrier} :
    BSDOfficialEndpointUse E -> BSDCarrierAdequate E -> BSDRankMismatch E ->
      BSDReductioCountercase E -> False

axiom bsdRankEquality_forced_by_localReductio
    {E : BSDCarrier} :
    BSDOfficialEndpointUse E -> BSDCarrierAdequate E -> BSDRankEq E

axiom bsdATSClassifiesMismatchUse
    {E : BSDCarrier} :
    BSDRankMismatch E -> BSDATSUseClassification E

axiom bsdUEAPBoundForNegativeRankReport
    {E : BSDCarrier} :
    BSDOfficialNegativeEndpointUse E -> BSDRankEndpointStatusGovernance E

axiom bsdRankMismatch_pointwiseNegativeBranch
    {E : BSDCarrier} :
    BSDRankEndpointUnderAudit -> BSDCarrierInstantiated E ->
      BSDRankMismatch E -> BSDOfficialNegativeEndpointUse E

axiom bsdRankMismatch_notLawfulCoequalEndpointRole
    {E : BSDCarrier} :
    BSDRankMismatch E -> BSDRankMismatchNotCoequalEndpointRole E

axiom bsdEndpointResolvingNonGovernance_hiddenFifthCase_impossible :
    Not BSDRankMismatchUseKind.endpointResolvingNonGovernance

axiom bsdTheoremLevelDiscriminator_endpointGovernance
    {E : BSDCarrier} :
    BSDTheoremLevelRankStatusDiscriminator E ->
    BSDOfficialNegativeEndpointUse E ->
      BSDRankEndpointStatusGovernance E

axiom bsdEndpointGovernance_independentRankDiscriminator
    {E : BSDCarrier} :
    BSDRankEndpointStatusGovernance E -> BSDIndependentRankDiscriminator E

axiom bsdKernel_noIndependentRankDiscriminator
    {E : BSDCarrier} :
    BSDKernelInstantiated E -> Not (BSDIndependentRankDiscriminator E)

axiom bsdRankMismatch_impossible
    {E : BSDCarrier} :
    BSDRankEndpointUnderAudit -> BSDCarrierInstantiated E ->
      Not (BSDRankMismatch E)

axiom bsdRankEquality_forced
    {E : BSDCarrier} :
    BSDRankEndpointUnderAudit ->
      analyticRank E = mordellWeilRank E

axiom bsdRankEndpoint_officialCorrespondence :
    (forall E : BSDCarrier, analyticRank E = mordellWeilRank E) ->
      OfficialBSDRankEndpoint

axiom bsdConditionalRefinedFormula_correspondence
    {E : BSDCarrier} :
    BSDFormulaFactorsStanding E -> BSDFormula E ->
      ConditionalRefinedBSDEndpoint E

axiom bsdFormulaMismatch_endpointGovernance
    {E : BSDCarrier} :
    BSDOfficialFormulaNegativeEndpointUse E -> BSDFormulaEndpointStatusGovernance E

axiom bsdFormulaMismatch_independentDiscriminator
    {E : BSDCarrier} :
    BSDFormulaMismatch E -> BSDOfficialFormulaNegativeEndpointUse E ->
      BSDIndependentFormulaDiscriminator E

axiom bsdNoIndependentFormulaDiscriminator
    {E : BSDCarrier} :
    BSDKernelInstantiated E -> Not (BSDIndependentFormulaDiscriminator E)

axiom bsdConditionalRefinedFormula_forced
    {E : BSDCarrier} :
    BSDFormulaFactorsStanding E -> BSDOfficialFormulaEndpointUse E -> BSDFormula E

end BSD.EndpointClosure
