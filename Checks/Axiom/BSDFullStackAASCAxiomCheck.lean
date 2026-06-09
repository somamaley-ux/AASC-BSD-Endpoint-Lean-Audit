import MaleyLean.Papers.BSD.AuditRunners
import MaleyLean.Papers.MinimalConditionsForAdmissibleConstruction.APlusAuditRunners

open MaleyLean.Papers.BSD
open MaleyLean.Papers.BSD.EndpointClosure
open MaleyLean.Papers.MinimalConditionsForAdmissibleConstruction

/-!
# BSD full-stack AASC axiom surface

This check imports the reusable AASC foundation/audit-runner layer and the BSD
endpoint audit-runner layer together.  It is the single-file audit entry point
for the current standalone BSD rank endpoint archive.
-/

#print axioms KernelAPlusAuditCertificate.auditSurfaceComplete_holds
#print axioms kernelAPlusAuditRunnerRegistryComplete_holds
#print axioms bsdRankMismatchOccupation_nonoptional
#print axioms bsdGovernedEndpointUse_bivalent
#print axioms bsdOfficialNegativeEndpointUse_endpointStatusGovernance
#print axioms bsdNoIndependentRankDiscriminator_of_foundationalNoClassifier
#print axioms bsdRankEndpointAASCContext_closes_rankEndpoint
#print axioms bsdFormulaFactorStandingPacket_components
#print axioms bsdRefinedFormulaEndpoint_remains_conditional
#print axioms bsdEndpointStatusLedgerComplete_holds
#print axioms bsdEndpointAuditRunnerRegistryComplete_holds
