/-
Lean-facing formalization map for the BSD endpoint closure manuscript.
The declarations below are signatures/anchors only. They record the stabilized
manuscript theorem surface for a later routing audit; this file is not presented
as a completed machine-checked proof of the arithmetic geometry background.
-/

namespace BSD.EndpointClosure

axiom EllipticCurveQ : Type
axiom LFunction : EllipticCurveQ -> Type
axiom MordellWeilGroup : EllipticCurveQ -> Type
axiom BSDLawfulEquivalence : EllipticCurveQ -> Type

structure BSDCarrier where
  curve : EllipticCurveQ
  Lfunction : LFunction curve
  MWGroup : MordellWeilGroup curve
  lawfulEquiv : BSDLawfulEquivalence curve

axiom analyticRank : BSDCarrier -> Nat
axiom mordellWeilRank : BSDCarrier -> Nat

axiom BSDRankEndpointUnderAudit : Prop
axiom BSDOfficialEndpointUse : BSDCarrier -> Prop
axiom BSDOfficialNegativeEndpointUse : BSDCarrier -> Prop
axiom BSDCarrierInstantiated : BSDCarrier -> Prop
axiom StandardBSDCarrierInstantiated : BSDCarrier -> Prop
axiom BSDCarrierAdequate : BSDCarrier -> Prop
axiom BSDEndpointAdequate : BSDCarrier -> Prop
axiom BSDKernelInstantiated : BSDCarrier -> Prop
axiom BSDLossOfNonDegenerateEndpointStatus : BSDCarrier -> Prop
axiom BSDLocalKernelPacketK1K13 : BSDCarrier -> Prop

axiom BSDAnalyticStanding : BSDCarrier -> Nat -> Prop
axiom BSDRankReadout : BSDCarrier -> Nat -> Prop
axiom BSDRankMismatch : BSDCarrier -> Prop
axiom BSDRankMismatchNormalForm : BSDCarrier -> Prop
axiom BSDRankBridgeImageExclusion : BSDCarrier -> Prop
axiom BSDRankBridgeImageSeparatorBranch : BSDCarrier -> Prop
axiom BSDRankMismatchEndpointOccupation : BSDCarrier -> Prop
axiom BSDGovernedEndpointUse : BSDCarrier -> Prop
axiom BSDNegativeGovernedEndpointUse : BSDCarrier -> Prop
axiom BSDTheoremLevelRankStatusDiscriminator : BSDCarrier -> Prop
axiom BSDRankEndpointStatusGovernance : BSDCarrier -> Prop
axiom BSDIndependentRankDiscriminator : BSDCarrier -> Prop
axiom OfficialBSDRankEndpoint : Prop

inductive BSDRankEndpointStatus where
  | positive
  | separator

axiom BSDRankEndpointStatusOccupation :
  BSDCarrier -> BSDRankEndpointStatus -> Prop

axiom BSDFormulaFactorsStanding : BSDCarrier -> Prop
axiom BSDFormula : BSDCarrier -> Prop
axiom ConditionalRefinedBSDEndpoint : BSDCarrier -> Prop
axiom BSDRefinedFormulaConditionalContext : BSDCarrier -> Prop

inductive BSDRankMismatchUseKind where
  | proofSupportObservation
  | endpointResolvingMismatchTheorem
  | endpointResolvingNonGovernance
  | carrierChangingMismatchClaim

axiom BSDRankMismatchUseClassification :
  BSDRankMismatchUseKind -> Prop

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

axiom bsdEndpointAdequacy_forces_kernel_roles
    {E : BSDCarrier} :
    BSDEndpointAdequate E -> BSDKernelInstantiated E

axiom bsdEndpointUse_instantiates_kernel
    {E : BSDCarrier} :
    BSDOfficialEndpointUse E -> BSDKernelInstantiated E

axiom bsdKernelDenial_hasEndpointCost
    {E : BSDCarrier} :
    BSDOfficialEndpointUse E -> Not (BSDKernelInstantiated E) ->
      BSDLossOfNonDegenerateEndpointStatus E

axiom bsdEndpointUse_fixes_carrier_instantiation
    {E : BSDCarrier} :
    BSDOfficialEndpointUse E -> BSDCarrierInstantiated E

axiom bsdLocalKernelPacket_K1_K13
    {E : BSDCarrier} :
    BSDOfficialEndpointUse E -> BSDLocalKernelPacketK1K13 E

axiom bsdNoLowerSameDomainKernelDerivation
    {E : BSDCarrier} :
    BSDOfficialEndpointUse E -> BSDKernelInstantiated E

axiom bsdRankMismatch_iff_standardNormalForm
    {E : BSDCarrier} :
    BSDRankMismatch E <-> BSDRankMismatchNormalForm E

axiom bsdStandardNormalForm_iff_rankBridgeImageExclusion
    {E : BSDCarrier} :
    BSDRankMismatchNormalForm E <-> BSDRankBridgeImageExclusion E

axiom bsdRankMismatch_iff_bridgeImageExclusion
    {E : BSDCarrier} :
    BSDRankMismatch E <-> BSDRankBridgeImageExclusion E

axiom bsdBridgeImageExclusion_endpointUsed_theoremLevelDiscriminator
    {E : BSDCarrier} :
    BSDRankBridgeImageExclusion E -> BSDOfficialNegativeEndpointUse E ->
      BSDTheoremLevelRankStatusDiscriminator E

axiom bsdGovernedEndpointUse_bivalent
    {E : BSDCarrier} :
    BSDGovernedEndpointUse E ->
      BSDRankEndpointStatusOccupation E BSDRankEndpointStatus.positive \/
        BSDRankEndpointStatusOccupation E BSDRankEndpointStatus.separator

axiom bsdNegativeGovernedEndpointUse_has_separatorStatus
    {E : BSDCarrier} :
    BSDNegativeGovernedEndpointUse E ->
      BSDRankEndpointStatusOccupation E BSDRankEndpointStatus.separator

axiom bsdRankBridgeImageSeparatorBranch_of_negativeGovernedEndpointUse
    {E : BSDCarrier} :
    BSDNegativeGovernedEndpointUse E ->
      BSDRankBridgeImageSeparatorBranch E

axiom bsdRankMismatch_pointwiseNegativeBranch
    {E : BSDCarrier} :
    BSDRankEndpointUnderAudit -> BSDCarrierInstantiated E ->
      BSDRankMismatch E -> BSDOfficialNegativeEndpointUse E

axiom bsdEndpointResolvingNonGovernance_hiddenFifthCase_impossible :
    Not (BSDRankMismatchUseClassification
      BSDRankMismatchUseKind.endpointResolvingNonGovernance)

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

axiom refinedBSDEndpoint_formulaFactorsStanding
    {E : BSDCarrier} :
    ConditionalRefinedBSDEndpoint E -> BSDFormulaFactorsStanding E

axiom refinedBSDEndpoint_formula
    {E : BSDCarrier} :
    ConditionalRefinedBSDEndpoint E -> BSDFormula E

axiom refinedBSDEndpoint_context_iff
    {E : BSDCarrier} :
    ConditionalRefinedBSDEndpoint E <->
      BSDRefinedFormulaConditionalContext E

axiom bsdRefinedFormulaEndpoint_remains_conditional
    {E : BSDCarrier} :
    BSDRefinedFormulaConditionalContext E ->
      ConditionalRefinedBSDEndpoint E

end BSD.EndpointClosure
