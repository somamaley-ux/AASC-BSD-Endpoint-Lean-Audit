import MaleyLean.Papers.BSD.StatusLedger

/-!
# BSD truth-boundary ledger

This file records the distinction between the closed AASC endpoint proof spine
and the intentionally abstract arithmetic-geometry standing used by the BSD
archive.  It is an audit aid: it does not add arithmetic content, and it does
not convert the refined formula layer into a first-principles formalization.
-/

namespace MaleyLean
namespace Papers
namespace BSD

/-- Classification labels for the BSD archive truth boundary. -/
inductive BSDTruthBoundaryKind where
  | leanClosedProofSpine
  | semanticCarrierAbstraction
  | structuralRoleCompressionBoundary
  | externalArithmeticGeometryStanding
  | manuscriptSnapshotBoundary
deriving DecidableEq, Repr

def BSDTruthBoundaryKind.label : BSDTruthBoundaryKind -> String
  | .leanClosedProofSpine => "closed in the Lean proof spine"
  | .semanticCarrierAbstraction => "semantic carrier abstraction"
  | .structuralRoleCompressionBoundary =>
      "structural AASC role-compression boundary"
  | .externalArithmeticGeometryStanding =>
      "external arithmetic-geometry standing"
  | .manuscriptSnapshotBoundary => "manuscript snapshot boundary"

/-- Named truth-boundary items that should remain visible to auditors. -/
inductive BSDTruthBoundaryItem where
  | carrierAndRankReadouts
  | roleCompressionArchitecture
  | rankEndpointRoute
  | aascClassifierExclusion
  | weakeningResistance
  | refinedFormulaFactorStanding
  | refinedFormulaGuardExact
  | manuscriptPdfSnapshot
deriving DecidableEq, Repr

def BSDTruthBoundaryItem.title : BSDTruthBoundaryItem -> String
  | .carrierAndRankReadouts =>
      "BSD carrier and rank readouts are semantic audit carriers"
  | .roleCompressionArchitecture =>
      "BSD role-compression paper supplies the AASC claim-class architecture"
  | .rankEndpointRoute =>
      "Rank endpoint route is closed in the AASC proof spine"
  | .aascClassifierExclusion =>
      "Independent same-domain classifier exclusion is supplied by AASC"
  | .weakeningResistance =>
      "Weakening-resistance patch records the K5/K6/K11/K13 same-carrier hardening"
  | .refinedFormulaFactorStanding =>
      "Refined formula factors are an explicit bridge/factor-standing boundary"
  | .refinedFormulaGuardExact =>
      "Refined formula endpoint has an exact conditional guard"
  | .manuscriptPdfSnapshot =>
      "Bundled manuscript PDF is refreshed from the Codex handoff render"

def bsdTruthBoundaryItemCatalog : List BSDTruthBoundaryItem :=
  [ .carrierAndRankReadouts
  , .roleCompressionArchitecture
  , .rankEndpointRoute
  , .aascClassifierExclusion
  , .weakeningResistance
  , .refinedFormulaFactorStanding
  , .refinedFormulaGuardExact
  , .manuscriptPdfSnapshot ]

def bsdTruthBoundaryItemTitles : List String :=
  bsdTruthBoundaryItemCatalog.map BSDTruthBoundaryItem.title

def bsdTruthBoundaryItemTitlesPopulatedBool : Bool :=
  bsdTruthBoundaryItemTitles.all (fun title => !title.isEmpty)

/-- One audited truth-boundary row. -/
structure BSDTruthBoundaryRow where
  item : BSDTruthBoundaryItem
  kind : BSDTruthBoundaryKind
  leanAnchor : String
  truthBoundary : String
  declared : Bool
deriving DecidableEq

def bsdTruthBoundaryRows : List BSDTruthBoundaryRow :=
  [ { item := .carrierAndRankReadouts
      kind := .semanticCarrierAbstraction
      leanAnchor := "BSDCarrier"
      truthBoundary := "elliptic curves, L-functions, and rank readouts are represented by audit carriers, not formalized from first principles"
      declared := true }
  , { item := .roleCompressionArchitecture
      kind := .structuralRoleCompressionBoundary
      leanAnchor := "A_Structural_Solution_to_the_Birch_and_Swinnerton_Dyer_Role_Compression_Problem"
      truthBoundary := "role-compression paper fixes the AASC proof class: structural endpoint closure locates bridge completion rather than constructing BSD analytically"
      declared := true }
  , { item := .rankEndpointRoute
      kind := .leanClosedProofSpine
      leanAnchor := "bsdRankEndpointAASCContext_closes_rankEndpoint"
      truthBoundary := "rank mismatch exclusion and pointwise rank equality close inside the AASC endpoint spine"
      declared := true }
  , { item := .aascClassifierExclusion
      kind := .leanClosedProofSpine
      leanAnchor := "bsdNoIndependentRankDiscriminator_of_foundationalNoClassifier"
      truthBoundary := "BSD rank discriminator exclusion is routed through the shared AASC same-domain classifier closure"
      declared := true }
  , { item := .weakeningResistance
      kind := .leanClosedProofSpine
      leanAnchor := "bsdNoStrictSameCarrierWeakeningPermitsMismatchGovernance"
      truthBoundary := "strict same-carrier BSD weakening is audited as endpoint-equivalent, support-level, carrier-shifting, lawful coequal-targeted, or second-governing"
      declared := true }
  , { item := .refinedFormulaFactorStanding
      kind := .structuralRoleCompressionBoundary
      leanAnchor := "BSDFormulaFactorStandingPacket"
      truthBoundary := "analytic continuation, functional equation, leading coefficient, regulator, Tamagawa, torsion, and Tate-Shafarevich standing are fixed as bridge/factor roles, not tracked as an unfinished analytic proof route"
      declared := true }
  , { item := .refinedFormulaGuardExact
      kind := .leanClosedProofSpine
      leanAnchor := "refinedBSDEndpoint_context_iff"
      truthBoundary := "the conditional refined endpoint is equivalent to the explicit refined formula context"
      declared := true }
  , { item := .manuscriptPdfSnapshot
      kind := .manuscriptSnapshotBoundary
      leanAnchor := "papers/bsd/PROJECT_LEDGER.md"
      truthBoundary := "main.tex has current Lean names; the bundled PDF is refreshed from the Codex handoff render"
      declared := true } ]

def bsdTruthBoundaryItems : List BSDTruthBoundaryItem :=
  bsdTruthBoundaryRows.map (fun row => row.item)

def bsdTruthBoundaryDeclaredFlags : List Bool :=
  bsdTruthBoundaryRows.map (fun row => row.declared)

def bsdTruthBoundaryAllDeclaredBool : Bool :=
  bsdTruthBoundaryDeclaredFlags.all id

def bsdTruthBoundaryLeanAnchors : List String :=
  bsdTruthBoundaryRows.map (fun row => row.leanAnchor)

def bsdTruthBoundaryLeanAnchorsPopulatedBool : Bool :=
  bsdTruthBoundaryLeanAnchors.all (fun anchor => !anchor.isEmpty)

def bsdTruthBoundaryTexts : List String :=
  bsdTruthBoundaryRows.map (fun row => row.truthBoundary)

def bsdTruthBoundaryTextsPopulatedBool : Bool :=
  bsdTruthBoundaryTexts.all (fun boundary => !boundary.isEmpty)

def bsdTruthBoundaryLeanClosedCount : Nat :=
  (bsdTruthBoundaryRows.filter
    (fun row => row.kind == BSDTruthBoundaryKind.leanClosedProofSpine)).length

def bsdTruthBoundaryExternalStandingCount : Nat :=
  (bsdTruthBoundaryRows.filter
    (fun row =>
      row.kind == BSDTruthBoundaryKind.externalArithmeticGeometryStanding)).length

def bsdTruthBoundaryStructuralBoundaryCount : Nat :=
  (bsdTruthBoundaryRows.filter
    (fun row =>
      row.kind ==
        BSDTruthBoundaryKind.structuralRoleCompressionBoundary)).length

def bsdTruthBoundarySnapshotCount : Nat :=
  (bsdTruthBoundaryRows.filter
    (fun row =>
      row.kind == BSDTruthBoundaryKind.manuscriptSnapshotBoundary)).length

theorem bsdTruthBoundaryRows_count_eq :
    bsdTruthBoundaryRows.length = 8 := by
  rfl

theorem bsdTruthBoundaryItemCatalog_count_eq :
    bsdTruthBoundaryItemCatalog.length = 8 := by
  rfl

theorem bsdTruthBoundaryItems_match_catalog :
    bsdTruthBoundaryItems = bsdTruthBoundaryItemCatalog := by
  rfl

theorem bsdTruthBoundaryItemTitlesPopulatedBool_eq_true :
    bsdTruthBoundaryItemTitlesPopulatedBool = true := by
  rfl

theorem bsdTruthBoundaryAllDeclaredBool_eq_true :
    bsdTruthBoundaryAllDeclaredBool = true := by
  rfl

theorem bsdTruthBoundaryLeanAnchorsPopulatedBool_eq_true :
    bsdTruthBoundaryLeanAnchorsPopulatedBool = true := by
  rfl

set_option maxRecDepth 10000 in
theorem bsdTruthBoundaryTextsPopulatedBool_eq_true :
    bsdTruthBoundaryTextsPopulatedBool = true := by
  rfl

theorem bsdTruthBoundaryLeanClosedCount_eq :
    bsdTruthBoundaryLeanClosedCount = 4 := by
  rfl

theorem bsdTruthBoundaryExternalStandingCount_eq :
    bsdTruthBoundaryExternalStandingCount = 0 := by
  rfl

theorem bsdTruthBoundaryStructuralBoundaryCount_eq :
    bsdTruthBoundaryStructuralBoundaryCount = 2 := by
  rfl

theorem bsdTruthBoundarySnapshotCount_eq :
    bsdTruthBoundarySnapshotCount = 1 := by
  rfl

def bsdTruthBoundaryMetadataComplete : Prop :=
  bsdTruthBoundaryRows.length = 8 /\
  bsdTruthBoundaryItemCatalog.length = 8 /\
  bsdTruthBoundaryItems = bsdTruthBoundaryItemCatalog /\
  bsdTruthBoundaryItemTitlesPopulatedBool = true /\
  bsdTruthBoundaryAllDeclaredBool = true /\
  bsdTruthBoundaryLeanAnchorsPopulatedBool = true /\
  bsdTruthBoundaryTextsPopulatedBool = true

def bsdTruthBoundaryCountComplete : Prop :=
  bsdTruthBoundaryLeanClosedCount = 4 /\
  bsdTruthBoundaryExternalStandingCount = 0 /\
  bsdTruthBoundaryStructuralBoundaryCount = 2 /\
  bsdTruthBoundarySnapshotCount = 1

def bsdTruthBoundaryLedgerComplete : Prop :=
  bsdTruthBoundaryMetadataComplete /\
  bsdTruthBoundaryCountComplete /\
  bsdEndpointStatusLedgerComplete

theorem bsdTruthBoundaryMetadataComplete_holds :
    bsdTruthBoundaryMetadataComplete := by
  refine And.intro bsdTruthBoundaryRows_count_eq ?_
  refine And.intro bsdTruthBoundaryItemCatalog_count_eq ?_
  refine And.intro bsdTruthBoundaryItems_match_catalog ?_
  refine And.intro bsdTruthBoundaryItemTitlesPopulatedBool_eq_true ?_
  refine And.intro bsdTruthBoundaryAllDeclaredBool_eq_true ?_
  refine And.intro bsdTruthBoundaryLeanAnchorsPopulatedBool_eq_true ?_
  exact bsdTruthBoundaryTextsPopulatedBool_eq_true

theorem bsdTruthBoundaryCountComplete_holds :
    bsdTruthBoundaryCountComplete := by
  refine And.intro bsdTruthBoundaryLeanClosedCount_eq ?_
  refine And.intro bsdTruthBoundaryExternalStandingCount_eq ?_
  refine And.intro bsdTruthBoundaryStructuralBoundaryCount_eq ?_
  exact bsdTruthBoundarySnapshotCount_eq

theorem bsdTruthBoundaryLedgerComplete_holds :
    bsdTruthBoundaryLedgerComplete := by
  refine And.intro bsdTruthBoundaryMetadataComplete_holds ?_
  refine And.intro bsdTruthBoundaryCountComplete_holds ?_
  exact bsdEndpointStatusLedgerComplete_holds

end BSD
end Papers
end MaleyLean
