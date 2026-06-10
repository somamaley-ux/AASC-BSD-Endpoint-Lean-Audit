# Suggested GitHub Release

## Release Title Template

AASC BSD Endpoint Lean Audit vX.Y.Z

## Release Notes

Standalone Lean 4 archive for the AASC-first Birch and Swinnerton-Dyer rank
endpoint proof spine.

This release verifies the complete manuscript-facing AASC endpoint-structure
route to the BSD rank endpoint in a dedicated repository separated from the
broader AASC working checkout. In the audited AASC proof class, fixed-carrier
BSD endpoint use forces the kernel-governed endpoint regime; analytic-arithmetic
mismatch becomes theorem-level same-domain endpoint-status governance; the
corresponding independent rank discriminator is excluded by the reusable AASC
no-second-classifier closure; and the official BSD rank endpoint follows.

The audit surface includes the reusable AASC foundation layer, the BSD rank
endpoint bridge layer, a structured conditional refined-formula standing
packet, an explicit refined-formula bridge-boundary ledger, and a combined
full-stack AASC/BSD axiom check.
The short theorem-chain handoff is in `AUDIT_HANDOFF.md`.
Local zip packages can be created with `scripts/package-bsd-release.ps1`.
The same audit is wired for GitHub Actions in `.github/workflows/audit.yml`,
with the latest pushed `main` workflow run expected to pass before release.
The current release line also includes BSD-native status naming,
manuscript-map alignment with the executable Lean spine, parse checking for
the pre-Lean signature map, semantic-audit-carrier wording cleanup, and
cross-platform A+ support-audit scan hardening. The audit now also checks that
the pre-Lean manuscript signature map is not imported by the active Lean proof
surface, and it strengthens the status/truth-boundary ledgers with metadata
completion anchors for titles, Lean anchors, source evidence, explanatory
boundary text, row counts, and current progress summaries.

Verification passed:

```powershell
lake build
powershell -ExecutionPolicy Bypass -File scripts/check-bsd-endpoint-audit.ps1
```

Audit status:

- `BSDRankEndpointClosure=100%`
- `BSDRefinedFormulaBridgeBoundary=100%`
- `BSDReferenceArchiveMaturityComparable=100%`
- 7 focused AASC/BSD audit files run, including the truth-boundary check and
  the combined full-stack check
- pre-Lean manuscript signature map parses outside the audited proof surface
- aggregate audit verifies the pre-Lean manuscript signature map is not
  imported by the active Lean audit surface
- no live project-level `axiom`, `sorry`, `admit`, or `unsafe` declaration in
  the active BSD audit surface
- BSD rank endpoint route closes through `BSDRankEndpointAASCContext`
- refined formula guard exactness is audited through
  `refinedBSDEndpoint_context_iff`
- truth-boundary ledger completion is audited through
  `bsdTruthBoundaryLedgerComplete_holds`
- status-ledger metadata completion is audited through
  `bsdEndpointStatusLedgerComplete`
- truth-boundary metadata and row-count completion are audited through
  `bsdTruthBoundaryMetadataComplete_holds` and
  `bsdTruthBoundaryCountComplete_holds`
- refined formula layer is recorded as an explicit bridge/factor-standing
  boundary through `BSDFormulaFactorStandingPacket`, not as an unfinished
  analytic-construction route

Truth boundary:

This is a complete AASC endpoint-structure Lean audit archive for the BSD rank
endpoint route. It does not claim a conventional first-principles arithmetic
formalization or construction proof of elliptic curves, L-functions, analytic
rank, Mordell-Weil rank, regulators, Tamagawa factors, torsion,
Tate-Shafarevich finiteness, or the full refined BSD formula. The refined
formula layer is fully located as a bridge/factor-standing boundary, not as an
unfinished analytic-construction route.

Pinned environment:

- Lean toolchain: `leanprover/lean4:v4.28.0`
- mathlib revision: `8f9d9cff6bd728b17a24e163c9402775d9e6a365`
