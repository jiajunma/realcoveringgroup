import RealCoveringGroup

/-! Compilation and initial proof-dependency audit. This is not a KLV test. -/

#check RealCoveringGroup.RealGL
#check RealCoveringGroup.RealSL
#check RealCoveringGroup.standardRepresentation
#check RealCoveringGroup.AlgebraicDoubleCover
#check RealCoveringGroup.AlgebraicDoubleCover.IsGenuine

#print axioms RealCoveringGroup.AlgebraicDoubleCover.same_fibre_iff
#print axioms RealCoveringGroup.AlgebraicDoubleCover.deck_involutive
#print axioms RealCoveringGroup.AlgebraicDoubleCover.deck_ne
#print axioms RealCoveringGroup.AlgebraicDoubleCover.genuine_fixed_eq_zero
#print axioms RealCoveringGroup.AlgebraicDoubleCover.genuine_not_descends
