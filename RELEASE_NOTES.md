# Release Notes

## Current AASC BSD Endpoint Lean Audit Release

This release packages the first dedicated Lean 4 audit archive for the
AASC-first BSD rank endpoint proof spine.

Included:

- BSD endpoint Lean files under `MaleyLean/Papers/BSD`, including
  `EndpointClosure.lean`, `StatusLedger.lean`, and `AuditRunners.lean`.
- Reusable AASC support files carried over from the broader working
  formalization, including bivalence/nondegenerate reasoning, minimal
  conditions/A+ support, and the nondegenerate kernel/admissibility anchor.
- Seven focused AASC/BSD audit files under `Checks/Axiom`, including BSD
  closure, status-ledger, truth-boundary, audit-runner, and combined full-stack
  axiom checks.
- Parse-only check for the pre-Lean manuscript signature map under
  `formalization_map`.
- Manuscript-facing BSD PDF/source snapshot under `papers/bsd`.
- Short audit handoff in `AUDIT_HANDOFF.md`.
- Pre-Lean manuscript-to-formalization map under `formalization_map`.
- Audit runner: `scripts/check-bsd-endpoint-audit.ps1`.
- GitHub audit workflow: `.github/workflows/audit.yml`.
- Local release packager: `scripts/package-bsd-release.ps1`.
- Cross-platform support-audit scanning for the reusable Minimal Conditions /
  A+ audit script.

Verification command:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/check-bsd-endpoint-audit.ps1
```

Audit status:

- `MaleyLean.Papers.BSD.EndpointClosure` builds.
- `MaleyLean.Papers.BSD.AuditRunners` builds.
- The aggregate audit script scans the active Lean surface for live `axiom`,
  `sorry`, `admit`, or `unsafe` declarations.
- The focused BSD endpoint axiom checks report no axioms for the audited BSD
  closeout, status-ledger, and audit-runner anchors.
- The pre-Lean manuscript signature map parses outside the audited proof
  surface.
- The rank endpoint route closes pointwise rank mismatch under the explicit
  `BSDRankEndpointAuditHypotheses` package.
- The refined formula guard is now exact:
  `refinedBSDEndpoint_context_iff`.
- The truth-boundary ledger is audited through
  `bsdTruthBoundaryLedgerComplete_holds`.
- Recorded progress:
  `BSDRankEndpointClosure=100%`,
  `BSDRefinedFormulaConditionalClosure=82%`,
  `BSDReferenceArchiveMaturityComparable=93%`.
- The refined BSD formula layer remains conditional on
  `BSDFormulaFactorStandingPacket`.

Truth boundary:

This is an AASC endpoint-structure Lean audit archive for the BSD rank endpoint
route. It is not a complete first-principles formalization of elliptic curves,
L-functions, analytic rank, Mordell-Weil rank, the Tate-Shafarevich group,
regulators, Tamagawa factors, or the full refined BSD formula. Those objects
are represented at the audit surface by explicit carriers, fields, and
standing hypotheses.

The refined formula guard is now split into named standing components for
analytic continuation, functional equation, leading coefficient, regulator,
Tamagawa, torsion, and Tate-Shafarevich factors.

`formalization_map/BSD_EndpointClosure_PreLeanMap.lean` is a pre-Lean
signature map and is not part of the executable proof surface.

Pinned environment:

- Lean toolchain: `leanprover/lean4:v4.28.0`
- mathlib revision: `8f9d9cff6bd728b17a24e163c9402775d9e6a365`

Suggested GitHub release title:

`AASC BSD Endpoint Lean Audit vX.Y.Z`

Suggested release body:

- see `GITHUB_RELEASE.md`
