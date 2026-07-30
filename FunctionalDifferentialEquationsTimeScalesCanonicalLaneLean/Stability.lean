import FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean.ExistenceUniqueness

/-!
# Stability Package
-/

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean

structure StabilityPackage {T : TimeScaleCalculusPackage}
    {D : DynamicEquationsPackage T} (U : ExistenceUniquenessPackage D) where
  lyapunovFunctional : Type u
  uniformAsymptoticStability : Prop
  exponentialStabilityConditions : Prop
  perturbationRobustness : Prop

structure StabilityEvidence {T : TimeScaleCalculusPackage}
    {D : DynamicEquationsPackage T} {U : ExistenceUniquenessPackage D}
    (S : StabilityPackage U) where
  uniformAsymptoticStabilityClosed : S.uniformAsymptoticStability
  exponentialStabilityConditionsClosed : S.exponentialStabilityConditions
  perturbationRobustnessClosed : S.perturbationRobustness

def StabilityClosed {T : TimeScaleCalculusPackage}
    {D : DynamicEquationsPackage T} {U : ExistenceUniquenessPackage D}
    (S : StabilityPackage U) : Prop :=
  S.uniformAsymptoticStability ∧ S.exponentialStabilityConditions ∧ S.perturbationRobustness

theorem stability_closed_from_evidence
    {T : TimeScaleCalculusPackage} {D : DynamicEquationsPackage T}
    {U : ExistenceUniquenessPackage D} (S : StabilityPackage U)
    (E : StabilityEvidence S) : StabilityClosed S := by
  exact And.intro E.uniformAsymptoticStabilityClosed
    (And.intro E.exponentialStabilityConditionsClosed E.perturbationRobustnessClosed)

end FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean
end HautevilleHouse