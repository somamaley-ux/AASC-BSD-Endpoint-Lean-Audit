# BSD Endpoint Closure AASC Project

This project contains the polished BSD endpoint-closure manuscript after the Poincare-style dependency and necessity hardening pass. The main body carries the mathematical proof route. Lean 4 material remains a reproducibility and theorem-routing audit surface, not a substitute for the manuscript proof and not a full arithmetic-geometry library.

## Main files

- `main.tex` - primary LaTeX source.
- `src/main.tex` - synchronized source copy.
- `BSD_Endpoint_Closure_AASC.pdf` - compiled manuscript PDF.
- `main.pdf` - duplicate compiled PDF for standard LaTeX workflows.
- `formalization_map/BSD_EndpointClosure_LeanMap.lean` - Lean-facing theorem-surface map.
- `background/Structural_BSD_Role_Compression_Predecessor.pdf` - predecessor structural role-compression paper.
- `verification/` - representative render/contact-sheet verification.

## Manuscript posture

The main body states the complete AASC endpoint-structure proof route for the BSD rank endpoint:

1. any non-degenerate fixed-carrier BSD rank regime forces kernel governance;
2. official BSD endpoint use is curvewise target fixation, not an assumption of rank equality;
3. rank mismatch is routed through standard BSD mismatch normal form and bridge-image exclusion;
4. the explicit rank bridge object `B^rank_BSD(E,n)` records same-curve, analytic-carrier, arithmetic-carrier, common-value, UEAP, and ATS discipline without smuggling rank equality;
5. endpoint-resolving mismatch is not a lawful coequal BSD endpoint role;
6. endpoint-resolving mismatch becomes theorem-level endpoint-status governance;
7. governance induces an independent same-domain rank discriminator;
8. no-independent-discriminator closure excludes that discriminator;
9. the local exact-complement reductio route discharges `[RankMismatch(E)]_i` itself, not a strengthened premise;
10. rank roles are total and unique on the adequate carrier, so excluding rank mismatch forces rank equality;
11. the fixed-carrier rank equality is identified with the official rank part of BSD.

The hardening passes import targeted defensive structure from the Poincare, RH, and Hodge manuscripts: mathematical-status/Lean-boundary lock, kernel-governance-as-regime-necessity, K13 tightening, K5/K6/K11/K13 weakening resistance, no-fifth-case governance, mismatch non-explosiveness, mismatch-not-coequal endpoint closure, rank-role totality/uniqueness, explicit rank bridge-object audit, local exact-complement annotation discharge, formula endpoint-use boundary, and anti-circularity audit.

The refined leading-coefficient formula remains an explicit bridge/factor-standing boundary. Once formula-factor roles have standing and the refined formula endpoint is under determinate evaluation, formula mismatch is excluded by the same endpoint-governance pattern. This manuscript does not claim a conventional arithmetic construction of rational points, descent data, Sha finiteness, or the leading-coefficient formula from first principles.

## Lean 4 appendix alignment

The Lean 4 material is contained in the appendix and records:

- public audit repository and Zenodo DOI;
- verification commands and pinned environment;
- audit handoff chain;
- key Lean anchors for the rank endpoint route;
- refined formula and truth-boundary anchors;
- focused audit boundary and non-import boundary for the pre-Lean signature map.

Public audit archive referenced in the manuscript:

- GitHub: `https://github.com/somamaley-ux/AASC-BSD-Endpoint-Lean-Audit`
- Zenodo DOI: `10.5281/zenodo.20619017`

## Build

Run:

```bash
bash BUILD.sh
```

The final verification build completed with three `pdflatex` passes and produced a 54-page PDF with no unresolved references, rerun warnings, or overfull/underfull hbox warnings in the final log. Representative render verification was regenerated from the final PDF and refreshed in `verification/`.
