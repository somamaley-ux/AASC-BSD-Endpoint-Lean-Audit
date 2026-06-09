import MaleyLean.Papers.BSD.TruthBoundary

/-!
# BSD endpoint audit runner registry

The registry keeps the public audit surface explicit: focused axiom checks,
the aggregate PowerShell script, and the current status/progress summaries.
-/

namespace MaleyLean
namespace Papers
namespace BSD

/-- Canonical focused audit files for the BSD endpoint archive. -/
def bsdEndpointFocusedAuditRunnerFiles : List String :=
  [ "Checks/Axiom/MinimalConditionsForAdmissibleConstructionAxiomCheck.lean"
  , "Checks/Axiom/NonDegenerateConstructionAndKernelOfAdmissibilityAxiomCheck.lean"
  , "Checks/Axiom/BSDEndpointClosureAxiomCheck.lean"
  , "Checks/Axiom/BSDEndpointStatusLedgerAxiomCheck.lean"
  , "Checks/Axiom/BSDTruthBoundaryAxiomCheck.lean"
  , "Checks/Axiom/BSDEndpointAuditRunnersAxiomCheck.lean"
  , "Checks/Axiom/BSDFullStackAASCAxiomCheck.lean" ]

/-- Aggregate PowerShell audit runner for the BSD endpoint route. -/
def bsdEndpointAggregateAuditRunnerFiles : List String :=
  [ "scripts/check-bsd-endpoint-audit.ps1" ]

def bsdEndpointAuditRunnerFiles : List String :=
  bsdEndpointFocusedAuditRunnerFiles ++
    bsdEndpointAggregateAuditRunnerFiles

def bsdEndpointFocusedAuditRunnerFilesDuplicateFreeBool : Bool :=
  bsdEndpointFocusedAuditRunnerFiles.length ==
    bsdEndpointFocusedAuditRunnerFiles.eraseDups.length

def bsdEndpointAggregateAuditRunnerFilesDuplicateFreeBool : Bool :=
  bsdEndpointAggregateAuditRunnerFiles.length ==
    bsdEndpointAggregateAuditRunnerFiles.eraseDups.length

def bsdEndpointAuditRunnerFilesDuplicateFreeBool : Bool :=
  bsdEndpointAuditRunnerFiles.length ==
    bsdEndpointAuditRunnerFiles.eraseDups.length

def bsdEndpointFocusedAuditRunnerFilesPopulatedBool : Bool :=
  bsdEndpointFocusedAuditRunnerFiles.all (fun file => !file.isEmpty)

def bsdEndpointAuditRunnerFilesPopulatedBool : Bool :=
  bsdEndpointAuditRunnerFiles.all (fun file => !file.isEmpty)

def bsdEndpointAuditRunnerFormalizationStatusSummary : String :=
  bsdEndpointCurrentFormalizationStatusSummary

def bsdEndpointAuditRunnerProgressSummary : String :=
  bsdEndpointCurrentProgressSummary

theorem bsdEndpointFocusedAuditRunnerFiles_count_eq :
    bsdEndpointFocusedAuditRunnerFiles.length = 7 := by
  rfl

theorem bsdEndpointAggregateAuditRunnerFiles_count_eq :
    bsdEndpointAggregateAuditRunnerFiles.length = 1 := by
  rfl

theorem bsdEndpointAuditRunnerFiles_count_eq :
    bsdEndpointAuditRunnerFiles.length = 8 := by
  rfl

theorem bsdEndpointAuditRunnerFiles_decomposes :
    bsdEndpointAuditRunnerFiles =
      bsdEndpointFocusedAuditRunnerFiles ++
        bsdEndpointAggregateAuditRunnerFiles := by
  rfl

theorem bsdEndpointFocusedAuditRunnerFilesDuplicateFreeBool_eq_true :
    bsdEndpointFocusedAuditRunnerFilesDuplicateFreeBool = true := by
  rfl

theorem bsdEndpointAggregateAuditRunnerFilesDuplicateFreeBool_eq_true :
    bsdEndpointAggregateAuditRunnerFilesDuplicateFreeBool = true := by
  rfl

theorem bsdEndpointAuditRunnerFilesDuplicateFreeBool_eq_true :
    bsdEndpointAuditRunnerFilesDuplicateFreeBool = true := by
  rfl

theorem bsdEndpointFocusedAuditRunnerFilesPopulatedBool_eq_true :
    bsdEndpointFocusedAuditRunnerFilesPopulatedBool = true := by
  rfl

theorem bsdEndpointAuditRunnerFilesPopulatedBool_eq_true :
    bsdEndpointAuditRunnerFilesPopulatedBool = true := by
  rfl

def bsdEndpointAuditRunnerRegistryComplete : Prop :=
  bsdEndpointFocusedAuditRunnerFiles.length = 7 /\
  bsdEndpointAggregateAuditRunnerFiles.length = 1 /\
  bsdEndpointAuditRunnerFiles.length = 8 /\
  bsdEndpointAuditRunnerFiles =
    bsdEndpointFocusedAuditRunnerFiles ++
      bsdEndpointAggregateAuditRunnerFiles /\
  bsdEndpointAuditRunnerFilesDuplicateFreeBool = true /\
  bsdEndpointAuditRunnerFilesPopulatedBool = true /\
  bsdTruthBoundaryLedgerComplete

theorem bsdEndpointAuditRunnerRegistryComplete_holds :
    bsdEndpointAuditRunnerRegistryComplete := by
  exact
    And.intro bsdEndpointFocusedAuditRunnerFiles_count_eq
      (And.intro bsdEndpointAggregateAuditRunnerFiles_count_eq
        (And.intro bsdEndpointAuditRunnerFiles_count_eq
          (And.intro bsdEndpointAuditRunnerFiles_decomposes
            (And.intro bsdEndpointAuditRunnerFilesDuplicateFreeBool_eq_true
              (And.intro bsdEndpointAuditRunnerFilesPopulatedBool_eq_true
                bsdTruthBoundaryLedgerComplete_holds)))))

end BSD
end Papers
end MaleyLean
