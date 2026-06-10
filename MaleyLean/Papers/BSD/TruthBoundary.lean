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
  | externalArithmeticGeometryStanding
  | manuscriptSnapshotBoundary
deriving DecidableEq, Repr

def BSDTruthBoundaryKind.label : BSDTruthBoundaryKind -> String
  | .leanClosedProofSpine => "closed in the Lean proof spine"
  | .semanticCarrierAbstraction => "semantic carrier abstraction"
  | .externalArithmeticGeometryStanding =>
      "external arithmetic-geometry standing"
  | .manuscriptSnapshotBoundary => "manuscript snapshot boundary"

/-- Named truth-boundary items that should remain visible to auditors. -/
inductive BSDTruthBoundaryItem where
  | carrierAndRankReadouts
  | rankEndpointRoute
  | aascClassifierExclusion
  | refinedFormulaFactorStanding
  | refinedFormulaGuardExact
  | manuscriptPdfSnapshot
deriving DecidableEq, Repr

def BSDTruthBoundaryItem.title : BSDTruthBoundaryItem -> String
  | .carrierAndRankReadouts =>
      "BSD carrier and rank readouts are semantic audit carriers"
  | .rankEndpointRoute =>
      "Rank endpoint route is closed in the AASC proof spine"
  | .aascClassifierExclusion =>
      "Independent same-domain classifier exclusion is supplied by AASC"
  | .refinedFormulaFactorStanding =>
      "Refined formula factors remain external arithmetic standing"
  | .refinedFormulaGuardExact =>
      "Refined formula endpoint has an exact conditional guard"
  | .manuscriptPdfSnapshot =>
      "Bundled manuscript PDF is a snapshot until regenerated"

def bsdTruthBoundaryItemCatalog : List BSDTruthBoundaryItem :=
  [ .carrierAndRankReadouts
  , .rankEndpointRoute
  , .aascClassifierExclusion
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
  , { item := .refinedFormulaFactorStanding
      kind := .externalArithmeticGeometryStanding
      leanAnchor := "BSDFormulaFactorStandingPacket"
      truthBoundary := "analytic continuation, functional equation, leading coefficient, regulator, Tamagawa, torsion, and Tate-Shafarevich standing remain explicit conditions"
      declared := true }
  , { item := .refinedFormulaGuardExact
      kind := .leanClosedProofSpine
      leanAnchor := "refinedBSDEndpoint_context_iff"
      truthBoundary := "the conditional refined endpoint is equivalent to the explicit refined formula context"
      declared := true }
  , { item := .manuscriptPdfSnapshot
      kind := .manuscriptSnapshotBoundary
      leanAnchor := "papers/bsd/PROJECT_LEDGER.md"
      truthBoundary := "main.tex has current Lean names; the bundled PDF is a pre-regeneration snapshot"
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

def bsdTruthBoundarySnapshotCount : Nat :=
  (bsdTruthBoundaryRows.filter
    (fun row =>
      row.kind == BSDTruthBoundaryKind.manuscriptSnapshotBoundary)).length

theorem bsdTruthBoundaryRows_count_eq :
    bsdTruthBoundaryRows.length = 6 := by
  rfl

theorem bsdTruthBoundaryItemCatalog_count_eq :
    bsdTruthBoundaryItemCatalog.length = 6 := by
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
    bsdTruthBoundaryLeanClosedCount = 3 := by
  rfl

theorem bsdTruthBoundaryExternalStandingCount_eq :
    bsdTruthBoundaryExternalStandingCount = 1 := by
  rfl

theorem bsdTruthBoundarySnapshotCount_eq :
    bsdTruthBoundarySnapshotCount = 1 := by
  rfl

def bsdTruthBoundaryMetadataComplete : Prop :=
  bsdTruthBoundaryRows.length = 6 /\
  bsdTruthBoundaryItemCatalog.length = 6 /\
  bsdTruthBoundaryItems = bsdTruthBoundaryItemCatalog /\
  bsdTruthBoundaryItemTitlesPopulatedBool = true /\
  bsdTruthBoundaryAllDeclaredBool = true /\
  bsdTruthBoundaryLeanAnchorsPopulatedBool = true /\
  bsdTruthBoundaryTextsPopulatedBool = true

def bsdTruthBoundaryCountComplete : Prop :=
  bsdTruthBoundaryLeanClosedCount = 3 /\
  bsdTruthBoundaryExternalStandingCount = 1 /\
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
  exact bsdTruthBoundarySnapshotCount_eq

theorem bsdTruthBoundaryLedgerComplete_holds :
    bsdTruthBoundaryLedgerComplete := by
  refine And.intro bsdTruthBoundaryMetadataComplete_holds ?_
  refine And.intro bsdTruthBoundaryCountComplete_holds ?_
  exact bsdEndpointStatusLedgerComplete_holds

end BSD
end Papers
end MaleyLean
