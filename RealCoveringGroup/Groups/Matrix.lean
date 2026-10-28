import Mathlib

/-!
# Concrete matrix groups

These abbreviations refer to actual mathlib matrix groups, not root-data labels.
Their reductivity, Lie-group structures, maximal compact subgroups, and nonlinear
covers are separate obligations in the roadmap. No such theorems are asserted here.
-/

namespace RealCoveringGroup

/-- The group of invertible real `n` by `n` matrices. -/
abbrev RealGL (n : ℕ) := Matrix.GeneralLinearGroup (Fin n) ℝ

/-- The real determinant-one matrix group. -/
abbrev RealSL (n : ℕ) := Matrix.SpecialLinearGroup (Fin n) ℝ

/-- The complex general linear matrix group. -/
abbrev ComplexGL (n : ℕ) := Matrix.GeneralLinearGroup (Fin n) ℂ

/-- Determinant as a homomorphism to the units of the real field. -/
def realGLDet (n : ℕ) : RealGL n →* ℝˣ :=
  Matrix.GeneralLinearGroup.det

/-- The actual action of `GL(n,R)` on its defining real vector space. -/
def standardRepresentation (n : ℕ) : Representation ℝ (RealGL n) (Fin n → ℝ) :=
  (Units.coeHom (Module.End ℝ (Fin n → ℝ))).comp
    (Matrix.GeneralLinearGroup.toLin (n := Fin n) (R := ℝ)).toMonoidHom

end RealCoveringGroup
