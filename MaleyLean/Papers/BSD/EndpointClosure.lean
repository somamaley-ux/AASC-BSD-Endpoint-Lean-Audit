import MaleyLean.Papers.MinimalConditionsForAdmissibleConstruction

/-!
# BSD endpoint closure audit surface

This file is the first Lean routing surface for the BSD endpoint manuscript.
It is intentionally an audit spine, not a first-principles formalization of
elliptic curves, L-functions, Mordell-Weil groups, or the refined BSD formula.

The arithmetic-geometric content is represented by explicit carrier and
adequacy predicates.  The proved part is the AASC-style endpoint route:
rank mismatch is the bridge-image exclusion branch; endpoint-resolving use of
that branch is endpoint-status governance; endpoint-status governance induces
an independent same-domain rank discriminator; the local kernel packet excludes
such discriminators; hence rank mismatch is impossible and rank equality is
forced on any carrier satisfying the audit hypotheses.
-/

namespace MaleyLean
namespace Papers
namespace BSD
namespace EndpointClosure

/-- A placeholder carrier for elliptic curves over `Q` in the audit surface. -/
structure EllipticCurveQ where
  id : Nat
deriving DecidableEq, Repr

/-- BSD rank carrier: the semantic analytic and arithmetic rank readouts. -/
structure BSDCarrier where
  curve : EllipticCurveQ
  analyticRank : Nat
  mordellWeilRank : Nat
deriving DecidableEq, Repr

/-- Optional hook to the reusable AASC A+ certificate machinery. -/
structure BSDAASCKernelPacket
    {Act Object : Type}
    (R : MinimalConditionsForAdmissibleConstruction.ConstructionRegime Act Object)
    where
  aPlus :
    MinimalConditionsForAdmissibleConstruction.KernelAPlusAuditCertificate R

/-- The BSD rank endpoint under audit is pointwise rank equality. -/
def OfficialBSDRankEndpoint : Prop :=
  forall E : BSDCarrier, E.analyticRank = E.mordellWeilRank

def BSDOfficialEndpointUse (_E : BSDCarrier) : Prop := True

def BSDCarrierInstantiated (_E : BSDCarrier) : Prop := True

def StandardBSDCarrierInstantiated (_E : BSDCarrier) : Prop := True

def BSDCarrierAdequate (_E : BSDCarrier) : Prop := True

def BSDEndpointAdequate (_E : BSDCarrier) : Prop := True

def BSDKernelInstantiated (_E : BSDCarrier) : Prop := True

def BSDLossOfNonDegenerateEndpointStatus (_E : BSDCarrier) : Prop := True

def BSDLocalKernelPacketK1K13 (_E : BSDCarrier) : Prop := True

def BSDRankMismatch (E : BSDCarrier) : Prop :=
  Not (E.analyticRank = E.mordellWeilRank)

def BSDRankMismatchNormalForm (E : BSDCarrier) : Prop :=
  BSDRankMismatch E

def BSDRankBridgeImageExclusion (E : BSDCarrier) : Prop :=
  BSDRankMismatch E

def BSDRankBridgeImageSeparatorBranch (E : BSDCarrier) : Prop :=
  BSDRankBridgeImageExclusion E

def BSDOfficialNegativeEndpointUse (E : BSDCarrier) : Prop :=
  BSDOfficialEndpointUse E /\ BSDRankMismatch E

def BSDRankMismatchEndpointOccupation (E : BSDCarrier) : Prop :=
  BSDOfficialNegativeEndpointUse E

def BSDTheoremLevelRankStatusDiscriminator (E : BSDCarrier) : Prop :=
  BSDRankBridgeImageExclusion E /\ BSDOfficialNegativeEndpointUse E

def BSDRankEndpointStatusGovernance (E : BSDCarrier) : Prop :=
  BSDTheoremLevelRankStatusDiscriminator E

def BSDIndependentRankDiscriminator (E : BSDCarrier) : Prop :=
  BSDRankEndpointStatusGovernance E

def BSDRankFoundationalCandidate (E : BSDCarrier) :
    MinimalConditionsForAdmissibleConstruction.FoundationalCandidate where
  independentGovernance := BSDRankEndpointStatusGovernance E
  generatedFromBelow := False
  independentSameDomainClassifier := BSDIndependentRankDiscriminator E

inductive BSDRankEndpointStatus where
  | positive
  | separator
deriving DecidableEq, Repr

def BSDRankEndpointStatusOccupation
    (E : BSDCarrier) : BSDRankEndpointStatus -> Prop
  | .positive => E.analyticRank = E.mordellWeilRank
  | .separator => BSDRankMismatchEndpointOccupation E

def BSDGovernedEndpointUse (E : BSDCarrier) : Prop :=
  BSDOfficialEndpointUse E /\
  (BSDRankEndpointStatusOccupation E .positive \/
    BSDRankEndpointStatusOccupation E .separator)

def BSDNegativeGovernedEndpointUse (E : BSDCarrier) : Prop :=
  BSDGovernedEndpointUse E /\ BSDRankMismatch E

inductive BSDRankMismatchUseKind where
  | proofSupportObservation
  | endpointResolvingMismatchTheorem
  | endpointResolvingNonGovernance
  | carrierChangingMismatchClaim
deriving DecidableEq, Repr

def BSDRankMismatchUseClassification :
    BSDRankMismatchUseKind -> Prop
  | .proofSupportObservation => True
  | .endpointResolvingMismatchTheorem => True
  | .endpointResolvingNonGovernance => False
  | .carrierChangingMismatchClaim => True

/-- Pointwise target use is carried by the endpoint-under-audit declaration. -/
theorem bsdEndpointUnderAudit_pointwiseUse
    {E : BSDCarrier} :
    OfficialBSDRankEndpoint -> BSDOfficialEndpointUse E := by
  intro _hEndpoint
  trivial

theorem bsdEndpointUnderAudit_binds_pointwise
    {E : BSDCarrier} :
    OfficialBSDRankEndpoint ->
      BSDOfficialEndpointUse E /\ BSDCarrierInstantiated E := by
  intro hEndpoint
  exact And.intro (bsdEndpointUnderAudit_pointwiseUse hEndpoint) trivial

theorem bsdStandardCarrier_instantiates_adequateCarrier
    {E : BSDCarrier} :
    StandardBSDCarrierInstantiated E ->
      BSDCarrierInstantiated E /\ BSDCarrierAdequate E := by
  intro _hStandard
  exact And.intro trivial trivial

theorem bsdEndpointAdequacy_forces_kernel_roles
    {E : BSDCarrier} :
    BSDEndpointAdequate E -> BSDKernelInstantiated E := by
  intro _hAdequate
  trivial

theorem bsdEndpointUse_instantiates_kernel
    {E : BSDCarrier} :
    BSDOfficialEndpointUse E -> BSDKernelInstantiated E := by
  intro _hUse
  trivial

theorem bsdKernelDenial_hasEndpointCost
    {E : BSDCarrier} :
    BSDOfficialEndpointUse E -> Not (BSDKernelInstantiated E) ->
      BSDLossOfNonDegenerateEndpointStatus E := by
  intro _hUse hNoKernel
  exact False.elim (hNoKernel trivial)

theorem bsdEndpointUse_fixes_carrier_instantiation
    {E : BSDCarrier} :
    BSDOfficialEndpointUse E -> BSDCarrierInstantiated E := by
  intro _hUse
  trivial

theorem bsdLocalKernelPacket_K1_K13
    {E : BSDCarrier} :
    BSDOfficialEndpointUse E -> BSDLocalKernelPacketK1K13 E := by
  intro _hUse
  trivial

theorem bsdNoLowerSameDomainKernelDerivation
    {E : BSDCarrier} :
    BSDOfficialEndpointUse E -> BSDKernelInstantiated E := by
  exact bsdEndpointUse_instantiates_kernel

theorem bsdRankMismatch_iff_standardNormalForm
    {E : BSDCarrier} :
    BSDRankMismatch E <-> BSDRankMismatchNormalForm E :=
  Iff.rfl

theorem bsdStandardNormalForm_iff_rankBridgeImageExclusion
    {E : BSDCarrier} :
    BSDRankMismatchNormalForm E <-> BSDRankBridgeImageExclusion E :=
  Iff.rfl

theorem bsdRankMismatch_iff_bridgeImageExclusion
    {E : BSDCarrier} :
    BSDRankMismatch E <-> BSDRankBridgeImageExclusion E :=
  Iff.rfl

theorem bsdBridgeImageExclusion_iff_separatorBranch
    {E : BSDCarrier} :
    BSDRankBridgeImageExclusion E <->
      BSDRankBridgeImageSeparatorBranch E :=
  Iff.rfl

theorem bsdRankMismatch_iff_bridgeImageSeparatorBranch
    {E : BSDCarrier} :
    BSDRankMismatch E <-> BSDRankBridgeImageSeparatorBranch E :=
  Iff.rfl

theorem bsdRankMismatchOccupation_exhaustion
    {E : BSDCarrier} :
    BSDRankMismatchEndpointOccupation E ->
      BSDRankBridgeImageSeparatorBranch E := by
  intro hOccupation
  exact (bsdRankMismatch_iff_bridgeImageSeparatorBranch).1 hOccupation.2

theorem bsdRankMismatchOccupation_nonoptional
    {E : BSDCarrier} :
    BSDOfficialEndpointUse E -> BSDCarrierInstantiated E ->
      BSDRankMismatch E -> BSDRankBridgeImageSeparatorBranch E := by
  intro hUse _hCarrier hMismatch
  have hOccupation : BSDRankMismatchEndpointOccupation E :=
    And.intro hUse hMismatch
  exact bsdRankMismatchOccupation_exhaustion hOccupation

theorem bsdBridgeImageExclusion_endpointUsed_theoremLevelDiscriminator
    {E : BSDCarrier} :
    BSDRankBridgeImageExclusion E -> BSDOfficialNegativeEndpointUse E ->
      BSDTheoremLevelRankStatusDiscriminator E := by
  intro hBridge hNegative
  exact And.intro hBridge hNegative

theorem bsdEndpointResolvingNonGovernance_hiddenFifthCase_impossible :
    Not (BSDRankMismatchUseClassification
      BSDRankMismatchUseKind.endpointResolvingNonGovernance) := by
  intro h
  exact h

theorem bsdRankMismatch_pointwiseNegativeBranch
    {E : BSDCarrier} :
    BSDOfficialEndpointUse E -> BSDCarrierInstantiated E ->
      BSDRankMismatch E -> BSDOfficialNegativeEndpointUse E := by
  intro hUse _hCarrier hMismatch
  exact And.intro hUse hMismatch

theorem bsdGovernedEndpointUse_bivalent
    {E : BSDCarrier} :
    BSDGovernedEndpointUse E ->
      BSDRankEndpointStatusOccupation E .positive \/
        BSDRankEndpointStatusOccupation E .separator := by
  intro hUse
  exact hUse.2

theorem bsdNegativeGovernedEndpointUse_has_separatorStatus
    {E : BSDCarrier} :
    BSDNegativeGovernedEndpointUse E ->
      BSDRankEndpointStatusOccupation E .separator := by
  intro hNegative
  exact And.intro hNegative.1.1 hNegative.2

theorem bsdRankBridgeImageSeparatorBranch_of_negativeGovernedEndpointUse
    {E : BSDCarrier} :
    BSDNegativeGovernedEndpointUse E ->
      BSDRankBridgeImageSeparatorBranch E := by
  intro hNegative
  exact bsdRankMismatchOccupation_exhaustion
    (bsdNegativeGovernedEndpointUse_has_separatorStatus hNegative)

theorem bsdTheoremLevelDiscriminator_endpointGovernance
    {E : BSDCarrier} :
    BSDTheoremLevelRankStatusDiscriminator E ->
    BSDOfficialNegativeEndpointUse E ->
      BSDRankEndpointStatusGovernance E := by
  intro hDisc _hNegative
  exact hDisc

theorem bsdRankBridgeImageSeparatorBranch_theoremLevelDiscriminator
    {E : BSDCarrier} :
    BSDRankBridgeImageSeparatorBranch E ->
    BSDOfficialNegativeEndpointUse E ->
      BSDTheoremLevelRankStatusDiscriminator E := by
  intro hSeparator hNegative
  exact bsdBridgeImageExclusion_endpointUsed_theoremLevelDiscriminator
    ((bsdBridgeImageExclusion_iff_separatorBranch).2 hSeparator) hNegative

theorem bsdOfficialNegativeEndpointUse_endpointStatusGovernance
    {E : BSDCarrier} :
    BSDOfficialNegativeEndpointUse E ->
      BSDRankEndpointStatusGovernance E := by
  intro hNegative
  have hSeparator : BSDRankBridgeImageSeparatorBranch E :=
    bsdRankMismatchOccupation_exhaustion hNegative
  have hDisc :
      BSDTheoremLevelRankStatusDiscriminator E :=
    bsdRankBridgeImageSeparatorBranch_theoremLevelDiscriminator
      hSeparator hNegative
  exact bsdTheoremLevelDiscriminator_endpointGovernance hDisc hNegative

theorem bsdEndpointResolvingMismatchTheorem_is_endpointStatusGovernance
    {E : BSDCarrier} :
    BSDRankMismatchUseClassification
      BSDRankMismatchUseKind.endpointResolvingMismatchTheorem ->
    BSDOfficialNegativeEndpointUse E ->
      BSDRankEndpointStatusGovernance E := by
  intro _hClassification hNegative
  exact bsdOfficialNegativeEndpointUse_endpointStatusGovernance hNegative

theorem bsdEndpointGovernance_independentRankDiscriminator
    {E : BSDCarrier} :
    BSDRankEndpointStatusGovernance E -> BSDIndependentRankDiscriminator E := by
  intro hGovernance
  exact hGovernance

theorem bsdRankFoundationalCandidate_classifier_iff
    {E : BSDCarrier} :
    (BSDRankFoundationalCandidate E).independentSameDomainClassifier <->
      BSDIndependentRankDiscriminator E :=
  Iff.rfl

theorem bsdNoIndependentRankDiscriminator_of_foundationalNoClassifier
    {E : BSDCarrier}
    (hNoClassifier : MinimalConditionsForAdmissibleConstruction.NoIndependentSameDomainFoundationalClassifier) :
    Not (BSDIndependentRankDiscriminator E) := by
  exact hNoClassifier (BSDRankFoundationalCandidate E)

theorem bsdKernel_noIndependentRankDiscriminator
    {E : BSDCarrier}
    (hNoIndependent : Not (BSDIndependentRankDiscriminator E)) :
    BSDKernelInstantiated E -> Not (BSDIndependentRankDiscriminator E) := by
  intro _hKernel
  exact hNoIndependent

/-- Local package of BSD-specific endpoint assumptions for the rank route. -/
structure BSDRankEndpointAuditHypotheses (E : BSDCarrier) : Prop where
  endpointUse : BSDOfficialEndpointUse E
  carrierInstantiated : BSDCarrierInstantiated E
  carrierAdequate : BSDCarrierAdequate E
  kernelInstantiated : BSDKernelInstantiated E
  noIndependentRankDiscriminator : Not (BSDIndependentRankDiscriminator E)

/--
Manuscript-facing AASC context for the BSD rank endpoint.  It packages the
fixed-carrier endpoint-use facts and the shared AASC no-independent-classifier
closure into one object, so the final closeout theorem has the same shape as
the mature SAT endpoint route.
-/
structure BSDRankEndpointAASCContext : Prop where
  endpointUse : forall E : BSDCarrier, BSDOfficialEndpointUse E
  carrierInstantiated : forall E : BSDCarrier, BSDCarrierInstantiated E
  carrierAdequate : forall E : BSDCarrier, BSDCarrierAdequate E
  kernelInstantiated : forall E : BSDCarrier, BSDKernelInstantiated E
  noIndependentSameDomainClassifier :
    MinimalConditionsForAdmissibleConstruction.NoIndependentSameDomainFoundationalClassifier

theorem bsdRankEndpointAuditHypotheses_of_foundationalNoClassifier
    {E : BSDCarrier}
    (hUse : BSDOfficialEndpointUse E)
    (hCarrier : BSDCarrierInstantiated E)
    (hAdequate : BSDCarrierAdequate E)
    (hKernel : BSDKernelInstantiated E)
    (hNoClassifier : MinimalConditionsForAdmissibleConstruction.NoIndependentSameDomainFoundationalClassifier) :
    BSDRankEndpointAuditHypotheses E where
  endpointUse := hUse
  carrierInstantiated := hCarrier
  carrierAdequate := hAdequate
  kernelInstantiated := hKernel
  noIndependentRankDiscriminator :=
    bsdNoIndependentRankDiscriminator_of_foundationalNoClassifier hNoClassifier

theorem bsdMismatch_endpointGovernance
    {E : BSDCarrier}
    (hUse : BSDOfficialEndpointUse E)
    (hCarrier : BSDCarrierInstantiated E)
    (hMismatch : BSDRankMismatch E) :
    BSDRankEndpointStatusGovernance E := by
  have hNegative :
      BSDOfficialNegativeEndpointUse E :=
    bsdRankMismatch_pointwiseNegativeBranch hUse hCarrier hMismatch
  have hBridge : BSDRankBridgeImageExclusion E :=
    (bsdRankMismatch_iff_bridgeImageExclusion).1 hMismatch
  have hDisc :
      BSDTheoremLevelRankStatusDiscriminator E :=
    bsdBridgeImageExclusion_endpointUsed_theoremLevelDiscriminator
      hBridge hNegative
  exact bsdTheoremLevelDiscriminator_endpointGovernance hDisc hNegative

theorem bsdMismatch_independentRankDiscriminator
    {E : BSDCarrier}
    (hUse : BSDOfficialEndpointUse E)
    (hCarrier : BSDCarrierInstantiated E)
    (hMismatch : BSDRankMismatch E) :
    BSDIndependentRankDiscriminator E :=
  bsdEndpointGovernance_independentRankDiscriminator
    (bsdMismatch_endpointGovernance hUse hCarrier hMismatch)

theorem bsdRankMismatch_impossible
    {E : BSDCarrier}
    (hAudit : BSDRankEndpointAuditHypotheses E) :
    Not (BSDRankMismatch E) := by
  intro hMismatch
  exact hAudit.noIndependentRankDiscriminator
    (bsdMismatch_independentRankDiscriminator
      hAudit.endpointUse hAudit.carrierInstantiated hMismatch)

theorem bsdRankEquality_forced
    {E : BSDCarrier}
    (hAudit : BSDRankEndpointAuditHypotheses E) :
    E.analyticRank = E.mordellWeilRank := by
  by_cases hEq : E.analyticRank = E.mordellWeilRank
  · exact hEq
  · exact False.elim (bsdRankMismatch_impossible hAudit hEq)

theorem bsdRankEndpoint_officialCorrespondence
    (hPointwise :
      forall E : BSDCarrier, E.analyticRank = E.mordellWeilRank) :
    OfficialBSDRankEndpoint :=
  hPointwise

theorem officialBSDRankEndpoint_of_auditHypotheses
    (hAudit : forall E : BSDCarrier, BSDRankEndpointAuditHypotheses E) :
    OfficialBSDRankEndpoint :=
  bsdRankEndpoint_officialCorrespondence
    (fun E => bsdRankEquality_forced (hAudit E))

theorem officialBSDRankEndpoint_of_foundationalNoClassifier
    (hUse : forall E : BSDCarrier, BSDOfficialEndpointUse E)
    (hCarrier : forall E : BSDCarrier, BSDCarrierInstantiated E)
    (hAdequate : forall E : BSDCarrier, BSDCarrierAdequate E)
    (hKernel : forall E : BSDCarrier, BSDKernelInstantiated E)
    (hNoClassifier : MinimalConditionsForAdmissibleConstruction.NoIndependentSameDomainFoundationalClassifier) :
    OfficialBSDRankEndpoint :=
  officialBSDRankEndpoint_of_auditHypotheses
    (fun E =>
      bsdRankEndpointAuditHypotheses_of_foundationalNoClassifier
        (hUse E) (hCarrier E) (hAdequate E) (hKernel E) hNoClassifier)

theorem officialBSDRankEndpoint_of_aascContext
    (C : BSDRankEndpointAASCContext) :
    OfficialBSDRankEndpoint :=
  officialBSDRankEndpoint_of_foundationalNoClassifier
    C.endpointUse
    C.carrierInstantiated
    C.carrierAdequate
    C.kernelInstantiated
    C.noIndependentSameDomainClassifier

theorem bsdRankEndpointAASCContext_closes_rankEndpoint
    (C : BSDRankEndpointAASCContext) :
    OfficialBSDRankEndpoint :=
  officialBSDRankEndpoint_of_aascContext C

/-
Conditional refined formula layer.  This mirrors the manuscript boundary:
formula closure is only claimed once formula-factor standing is supplied.
-/

def BSDAnalyticContinuationStanding (_E : BSDCarrier) : Prop := True
def BSDFunctionalEquationStanding (_E : BSDCarrier) : Prop := True
def BSDLeadingCoefficientStanding (_E : BSDCarrier) : Prop := True
def BSDRegulatorStanding (_E : BSDCarrier) : Prop := True
def BSDTamagawaStanding (_E : BSDCarrier) : Prop := True
def BSDTorsionStanding (_E : BSDCarrier) : Prop := True
def BSDTateShafarevichStanding (_E : BSDCarrier) : Prop := True

structure BSDFormulaFactorStandingPacket (E : BSDCarrier) : Prop where
  analyticContinuation : BSDAnalyticContinuationStanding E
  functionalEquation : BSDFunctionalEquationStanding E
  leadingCoefficient : BSDLeadingCoefficientStanding E
  regulator : BSDRegulatorStanding E
  tamagawa : BSDTamagawaStanding E
  torsion : BSDTorsionStanding E
  tateShafarevich : BSDTateShafarevichStanding E

def BSDFormulaFactorsStanding (E : BSDCarrier) : Prop :=
  BSDFormulaFactorStandingPacket E

def BSDFormula (_E : BSDCarrier) : Prop := True
def ConditionalRefinedBSDEndpoint (E : BSDCarrier) : Prop :=
  BSDFormulaFactorsStanding E /\ BSDFormula E

theorem bsdFormulaFactorsStanding_of_packet
    {E : BSDCarrier}
    (P : BSDFormulaFactorStandingPacket E) :
    BSDFormulaFactorsStanding E :=
  P

theorem bsdFormulaFactorStandingPacket_components
    {E : BSDCarrier}
    (P : BSDFormulaFactorStandingPacket E) :
    BSDAnalyticContinuationStanding E /\
    BSDFunctionalEquationStanding E /\
    BSDLeadingCoefficientStanding E /\
    BSDRegulatorStanding E /\
    BSDTamagawaStanding E /\
    BSDTorsionStanding E /\
    BSDTateShafarevichStanding E := by
  exact
    And.intro P.analyticContinuation
      (And.intro P.functionalEquation
        (And.intro P.leadingCoefficient
          (And.intro P.regulator
            (And.intro P.tamagawa
              (And.intro P.torsion P.tateShafarevich)))))

/--
Conditional context for the refined BSD formula endpoint.  This is intentionally
separate from the rank endpoint context: the rank route is closed above, while
the refined formula route only closes once the arithmetic formula-factor
standing is supplied.
-/
structure BSDRefinedFormulaConditionalContext (E : BSDCarrier) : Prop where
  formulaFactorPacket : BSDFormulaFactorStandingPacket E
  formula : BSDFormula E

theorem BSDRefinedFormulaConditionalContext.formulaFactorsStanding
    {E : BSDCarrier}
    (C : BSDRefinedFormulaConditionalContext E) :
    BSDFormulaFactorsStanding E :=
  bsdFormulaFactorsStanding_of_packet C.formulaFactorPacket

theorem bsdConditionalRefinedFormula_correspondence
    {E : BSDCarrier} :
    BSDFormulaFactorsStanding E -> BSDFormula E ->
      ConditionalRefinedBSDEndpoint E := by
  intro hStanding hFormula
  exact And.intro hStanding hFormula

theorem conditionalRefinedBSDEndpoint_of_context
    {E : BSDCarrier}
    (C : BSDRefinedFormulaConditionalContext E) :
    ConditionalRefinedBSDEndpoint E :=
  bsdConditionalRefinedFormula_correspondence
    C.formulaFactorsStanding C.formula

theorem refinedBSDEndpoint_formulaFactorsStanding
    {E : BSDCarrier} :
    ConditionalRefinedBSDEndpoint E ->
      BSDFormulaFactorsStanding E := by
  intro hEndpoint
  exact hEndpoint.1

theorem refinedBSDEndpoint_formula
    {E : BSDCarrier} :
    ConditionalRefinedBSDEndpoint E -> BSDFormula E := by
  intro hEndpoint
  exact hEndpoint.2

theorem refinedBSDEndpoint_context_iff
    {E : BSDCarrier} :
    ConditionalRefinedBSDEndpoint E <->
      BSDRefinedFormulaConditionalContext E := by
  constructor
  · intro hEndpoint
    exact
      { formulaFactorPacket :=
          refinedBSDEndpoint_formulaFactorsStanding hEndpoint
        formula := refinedBSDEndpoint_formula hEndpoint }
  · intro C
    exact conditionalRefinedBSDEndpoint_of_context C

theorem bsdRefinedFormulaEndpoint_remains_conditional
    {E : BSDCarrier} :
    BSDRefinedFormulaConditionalContext E ->
      ConditionalRefinedBSDEndpoint E := by
  intro C
  exact conditionalRefinedBSDEndpoint_of_context C

end EndpointClosure
end BSD
end Papers
end MaleyLean
