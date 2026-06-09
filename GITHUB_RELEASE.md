# Suggested GitHub Release

## Release Title

AASC BSD Endpoint Lean Audit v0.1.0

## Release Notes

Standalone Lean 4 archive for the AASC-first Birch and Swinnerton-Dyer rank
endpoint proof spine.

This release verifies the manuscript-facing AASC route to the BSD rank endpoint
in a dedicated repository separated from the broader AASC working checkout. The
audit surface includes the reusable AASC foundation layer, the BSD rank
endpoint bridge layer, a structured conditional refined-formula standing
packet, a truth-boundary ledger, and a combined full-stack AASC/BSD axiom
check.
The short theorem-chain handoff is in `AUDIT_HANDOFF.md`.

Verification passed:

```powershell
lake build
powershell -ExecutionPolicy Bypass -File scripts/check-bsd-endpoint-audit.ps1
```

Audit status:

- `BSDRankEndpointClosure=100%`
- `BSDRefinedFormulaConditionalClosure=82%`
- `PvsNPArchiveMaturityComparable=90%`
- 7 focused AASC/BSD audit files run, including the truth-boundary check and
  the combined full-stack check
- no live project-level `axiom`, `sorry`, `admit`, or `unsafe` declaration in
  the active BSD audit surface
- BSD rank endpoint route closes through `BSDRankEndpointAASCContext`
- refined formula guard exactness is audited through
  `refinedBSDEndpoint_context_iff`
- truth-boundary ledger completion is audited through
  `bsdTruthBoundaryLedgerComplete_holds`
- refined formula endpoint remains conditional on
  `BSDFormulaFactorStandingPacket`

Truth boundary:

This is an AASC endpoint-structure Lean audit archive for the BSD rank endpoint
route. It does not claim a first-principles formalization of elliptic curves,
L-functions, analytic rank, Mordell-Weil rank, regulators, Tamagawa factors,
torsion, Tate-Shafarevich finiteness, or the full refined BSD formula.

Pinned environment:

- Lean toolchain: `leanprover/lean4:v4.28.0`
- mathlib revision: `8f9d9cff6bd728b17a24e163c9402775d9e6a365`
