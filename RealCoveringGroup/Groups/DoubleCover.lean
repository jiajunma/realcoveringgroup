import Mathlib

/-!
# Algebraic central double extensions

This is deliberately only the algebraic layer. A Lie-group double cover must
add topology, a covering-map property, compatible smooth structures, and the
required group-specific hypotheses. Non-splitting is not nonlinearity.
-/

namespace RealCoveringGroup

universe u v

/-- An exact central extension with kernel `{1,z}` and `z ≠ 1`.
Both `G` and `E` are actual groups supplied independently of the extension. -/
structure AlgebraicDoubleCover (G : Type u) (E : Type v) [Group G] [Group E] where
  proj : E →* G
  z : E
  z_ne_one : z ≠ 1
  z_mul_z : z * z = 1
  z_central : ∀ x : E, z * x = x * z
  surjective : Function.Surjective proj
  kernel_iff : ∀ x : E, proj x = 1 ↔ x = 1 ∨ x = z

namespace AlgebraicDoubleCover

variable {G : Type u} {E : Type v} [Group G] [Group E]
variable (C : AlgebraicDoubleCover G E)

@[simp] theorem proj_z : C.proj C.z = 1 :=
  (C.kernel_iff C.z).2 (Or.inr rfl)

/-- The inverse image of a subgroup. It is not assumed to be commutative. -/
def preimage (H : Subgroup G) : Subgroup E := H.comap C.proj

@[simp] theorem mem_preimage (H : Subgroup G) (x : E) :
    x ∈ C.preimage H ↔ C.proj x ∈ H := Iff.rfl

/-- Algebraic splitting; continuity and smoothness are not included. -/
def IsAlgebraicallySplit : Prop :=
  ∃ s : G →* E, C.proj.comp s = MonoidHom.id G

/-- Two elements of the same fibre differ by the distinguished kernel element. -/
theorem same_fibre_iff (x y : E) :
    C.proj x = C.proj y ↔ x = y ∨ x = C.z * y := by
  constructor
  · intro h
    have hk : C.proj (x * y⁻¹) = 1 := by
      rw [map_mul, map_inv, h, mul_inv_cancel]
    rcases (C.kernel_iff (x * y⁻¹)).1 hk with h1 | hz
    · exact Or.inl (mul_inv_eq_one.mp h1)
    · right
      have hh := congrArg (fun t : E => t * y) hz
      simpa only [mul_assoc, inv_mul_cancel, mul_one] using hh
  · rintro (rfl | h)
    · rfl
    · rw [h, map_mul, C.proj_z, one_mul]

/-- The algebraic deck involution. -/
theorem deck_involutive : Function.Involutive (fun x : E => C.z * x) := by
  intro x
  rw [← mul_assoc, C.z_mul_z, one_mul]

/-- The two points in a fibre are distinct. -/
theorem deck_ne (x : E) : C.z * x ≠ x := by
  intro h
  apply C.z_ne_one
  apply mul_right_cancel (b := x)
  simpa only [one_mul] using h

end AlgebraicDoubleCover
end RealCoveringGroup
