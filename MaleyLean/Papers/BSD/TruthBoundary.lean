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

theorem bsdTruthBoundaryAllDeclaredBool_eq_true :
    bsdTruthBoundaryAllDeclaredBool = true := by
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

def bsdTruthBoundaryLedgerComplete : Prop :=
  bsdTruthBoundaryRows.length = 6 /\
  bsdTruthBoundaryAllDeclaredBool = true /\
  bsdTruthBoundaryLeanClosedCount = 3 /\
  bsdTruthBoundaryExternalStandingCount = 1 /\
  bsdTruthBoundarySnapshotCount = 1 /\
  bsdEndpointStatusLedgerComplete

theorem bsdTruthBoundaryLedgerComplete_holds :
    bsdTruthBoundaryLedgerComplete := by
  exact
    And.intro bsdTruthBoundaryRows_count_eq
      (And.intro bsdTruthBoundaryAllDeclaredBool_eq_true
        (And.intro bsdTruthBoundaryLeanClosedCount_eq
          (And.intro bsdTruthBoundaryExternalStandingCount_eq
            (And.intro bsdTruthBoundarySnapshotCount_eq
              bsdEndpointStatusLedgerComplete_holds))))

end BSD
end Papers
end MaleyLean
