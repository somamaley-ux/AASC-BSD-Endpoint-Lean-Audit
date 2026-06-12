# BSD bridge-object and local-reductio hardening patch

This patch adds two targeted defensive modules:

1. An explicit rank bridge object `B^rank_BSD(E,n)` with same-curve, analytic-carrier, arithmetic-carrier, common-value, bridge-certification, UEAP, and ATS clauses. The object is non-circular: rank equality appears only under bridge completion or mismatch exclusion.
2. A local exact-complement reductio route for `[RankMismatch(E)]_i`. The annotation is proof-role metadata, not an extra object-level premise; the local contradiction discharges the mismatch assumption itself.

The global official-negative-resolution route remains available as an audit path, while the rank endpoint closeout now uses local annotation discharge as the primary endpoint proof discipline.
