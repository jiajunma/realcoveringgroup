# Agent instructions: realcoveringgroup

## Mission and mandatory order

This is Jia-Jun Ma (马家骏)'s Lean formalization workspace for David Renard and Peter Trapa, *Kazhdan–Lusztig algorithms for nonlinear groups and applications to Kazhdan–Patterson lifting* (AJM 127 (2005), 911–971; source-version details belong in `docs/REFERENCES.md`).

The user's explicit priority is:

> 先把群定义出来，表示搞出来，KLV 做出来。

Implement **actual groups and covers → actual representations and Harish–Chandra modules → parameters and KLV → character multiplicities, duality, and lifting**. Do not replace this objective with a standalone finite-table calculation, an abstract canonical-basis interface, or a rank-one example. Those are useful tests, not the project's completion criterion. Type A / GL(n,R) is an initial implementation family, not a silent restriction of the final theorem. Keep the paper's full hypotheses visible.

## Read first

Read `README.md`, `ROADMAP.md`, `docs/DEFINITIONS.md`, `docs/REFERENCES.md`, and `docs/STATUS.md` when present. The roadmap is a plan, not evidence that its declarations have been implemented. Inspect the actual Lean files and the latest build result.

## Mathematical integrity

1. Reuse mathlib structures and prove compatibility rather than introducing competing foundations without a written reason.
2. A central extension of abstract groups is not yet a topological or Lie-group cover. Keep the exact sequence, topology, local triviality, smoothness, and non-splitting separate. Prove each promised property.
3. A non-split double cover is not automatically nonlinear. Nonlinearity concerns faithful finite-dimensional continuous representations. RT05 Definition 6.3 has an additional representation-theoretic condition; preserve its exact scope. Distinguish it from AT12 admissibility.
4. Do not assume covered Cartan subgroups are abelian. Use irreducible representations of a Cartan, and genuine central characters where the required classification theorem has been proved.
5. `Representation` alone is algebraic. Continuous representations require joint continuity of the action; smooth vectors, differentiated actions, and Harish–Chandra compatibility are additional constructions.
6. A Harish–Chandra module must contain actual group and Lie-algebra actions, their compatibility including differentiation on the compact subgroup, local finiteness, and the stated finiteness conditions. A finite label or a vector in a free module is not a Harish–Chandra module.
7. Standard modules must be constructed by the appropriate normalized parabolic induction / cohomological constructions. Langlands classification and the existence/uniqueness of an irreducible submodule or quotient are theorems, never definitional fields that hide those theorems.
8. Distinguish exact from generalized infinitesimal character. Translation functors require the appropriate generalized-character category; do not assume exact central character is extension-closed.
9. Define the Grothendieck group from actual exact sequences. A free module on labels becomes its coordinate model only after a proved comparison.
10. KLV inputs must eventually be derived from these groups and representations. Record soundness and exhaustion of parameter enumeration, not only agreement with a printed table.
11. Nonintegral wall crossing may move between infinitesimal characters and blocks. Preserve the parameter family, not just one fixed block. Do not silently substitute an ordinary Coxeter Hecke algebra for RT05's enlarged operator system.
12. Fix standard/submodule/quotient conventions, root normalizations, polynomial variables, lengths, and matrix orientation explicitly. Use `characterMatrix` and `compositionMatrix` as distinct concepts. Their inverse relation is proved. Check formulas against rendered source pages; OCR or extracted text can lose bars, signs, or indices.
13. Preserve RT05 Hypothesis 6.15 and all hypotheses of Theorems 9.9–9.10 until discharged. Do not import the simply-laced conclusions of AT12 into general RT05 statements.
14. A degree-bounded triangular bar-invariant basis specification does not prove existence or termination of a recursive algorithm. Prove existence, uniqueness, recursive correctness, and independence of choices separately.

## Proof and status policy

- No project-specific `axiom`, `sorry`, `admit`, or opaque theorem stub in the verified import closure. Standard Lean axioms such as choice, propositional extensionality, and quotient soundness are permitted and should be distinguished from mathematical assumptions.
- Unimplemented concepts belong in the definition registry with status `PLANNED`; do not install vacuous `True` predicates or dummy objects just to make a build pass.
- A theorem conditional on a genuinely defined hypothesis can be useful, but label it `CONDITIONAL` and list all remaining obligations. Never count assumed Langlands classification, semisimplicity, localization, or KLV correctness as proved.
- Maintain separate statuses: `PLANNED`, `DEFINED`, `PROVED`, `CONDITIONAL`, `COMPUTED`, and `SOURCE-VERIFIED`. `PROVED` requires a successful Lean build at an identified toolchain/mathlib revision; computation or source inspection alone does not qualify.
- Generality is part of every result: group family, cover, rank range, infinitesimal character, regularity, central character, and any technical hypotheses.
- For exported milestone theorems, inspect `#print axioms`. Avoid untrusted/native computation in the proof boundary unless its trust implications are explicitly approved and documented.
- Do not copy copyrighted papers into this public repository. Store bibliographic data, source links, versions, checksums, theorem maps, and original project notes.

## Engineering and collaboration

- Pin Lean and mathlib to compatible, reproducible revisions. Do not upgrade incidentally while changing mathematics.
- Before editing, read the remote tree and current files. Fetch/synchronize before committing; preserve concurrent changes. Never force-push, reset another contributor's work, or overwrite a file using an obsolete SHA.
- Prefer coherent commits. GitHub Contents API writes must use the latest blob SHA for updates and be sequential for a shared branch. Re-read after writing.
- Keep changes in `jiajunma/realcoveringgroup`. Do not mutate another project or unrelated user data.
- Run `lake build` and relevant tests before claiming compilation. If the toolchain cannot run, state that explicitly and leave the status unverified. Record commands and outcomes in `docs/STATUS.md`.
- Update documentation to distinguish completed work from the next work item. No claim of completion based only on file existence, a green placeholder test, or an assumed interface.
- Report commit hashes and concise mathematical progress to the user. Do not promise unattended/background continuation.

## Communication

Use Chinese for discussion and the main roadmap; use conventional English Lean identifiers and clear English docstrings. Explain the mathematical objects and dependencies, not only file names. The next step must follow the group-first order unless the user explicitly changes it.
