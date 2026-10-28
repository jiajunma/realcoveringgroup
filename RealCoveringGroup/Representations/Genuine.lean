import RealCoveringGroup.Groups.DoubleCover

/-!
# Genuine representations of a specified double extension

The definition here concerns representations, not RT05's separate definition
of a genuine *cover*. It works on arbitrary complex vector spaces. Continuity,
smoothness, admissibility, and Harish-Chandra compatibility are not assumed.
-/

namespace RealCoveringGroup

universe u v w

variable {G : Type u} {E : Type v} [Group G] [Group E]
variable {V : Type w} [AddCommGroup V] [Module ℂ V]

namespace AlgebraicDoubleCover

variable (C : AlgebraicDoubleCover G E)

/-- The distinguished kernel element acts as negative identity. -/
def IsGenuine (ρ : Representation ℂ E V) : Prop :=
  ∀ v : V, ρ C.z v = -v

/-- Descent on the same vector space through the specified projection. -/
def Descends (ρ : Representation ℂ E V) : Prop :=
  ∃ σ : Representation ℂ G V, ρ = σ.comp C.proj

/-- A genuine representation has no nonzero vector fixed by the kernel. -/
theorem genuine_fixed_eq_zero {ρ : Representation ℂ E V}
    (hρ : C.IsGenuine ρ) {v : V} (hfix : ρ C.z v = v) : v = 0 := by
  have hv : v = -v := hfix.symm.trans (hρ v)
  have htwo : (2 : ℂ) • v = 0 := by
    simpa only [two_smul] using (add_eq_zero_iff_eq_neg.mpr hv)
  exact (smul_eq_zero.mp htwo).resolve_left (by norm_num)

/-- On a nonzero space, a genuine representation cannot factor through `G`. -/
theorem genuine_not_descends [Nontrivial V] {ρ : Representation ℂ E V}
    (hρ : C.IsGenuine ρ) : ¬ C.Descends ρ := by
  rintro ⟨σ, rfl⟩
  obtain ⟨v, hv⟩ := exists_ne (0 : V)
  apply hv
  apply C.genuine_fixed_eq_zero hρ
  simp [C.proj_z]

end AlgebraicDoubleCover
end RealCoveringGroup
