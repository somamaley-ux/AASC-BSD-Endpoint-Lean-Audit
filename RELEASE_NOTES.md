# Release Notes

## AASC BSD Endpoint Lean Audit v0.1.0

This release packages the first dedicated Lean 4 audit archive for the
AASC-first BSD rank endpoint proof spine.

Included:

- BSD endpoint Lean file under `MaleyLean/Papers/BSD`.
- Reusable AASC support files carried over from the broader working
  formalization, including bivalence/nondegenerate reasoning, minimal
  conditions/A+ support, and the nondegenerate kernel/admissibility anchor.
- Focused BSD endpoint axiom check under `Checks/Axiom`.
- Manuscript-facing BSD PDF/source snapshot under `papers/bsd`.
- Pre-Lean manuscript-to-formalization map under `formalization_map`.
- Audit runner: `scripts/check-bsd-endpoint-audit.ps1`.

Verification command:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/check-bsd-endpoint-audit.ps1
```

Audit status:

- `MaleyLean.Papers.BSD.EndpointClosure` builds.
- The focused BSD endpoint axiom check reports no axioms for the audited BSD
  closeout anchors.
- The rank endpoint route closes pointwise rank mismatch under the explicit
  `BSDRankEndpointAuditHypotheses` package.
- The refined BSD formula layer remains conditional on
  `BSDFormulaFactorsStanding`.

Truth boundary:

This is an AASC endpoint-structure Lean audit archive for the BSD rank endpoint
route. It is not a complete first-principles formalization of elliptic curves,
L-functions, analytic rank, Mordell-Weil rank, the Tate-Shafarevich group,
regulators, Tamagawa factors, or the full refined BSD formula. Those objects
are represented at the audit surface by explicit carriers, fields, and
standing hypotheses.

Pinned environment:

- Lean toolchain: `leanprover/lean4:v4.28.0`
- mathlib revision: `8f9d9cff6bd728b17a24e163c9402775d9e6a365`

Suggested GitHub release title:

`AASC BSD Endpoint Lean Audit v0.1.0`
