import canonicalLaneMathlib.AdmissibleClass

/-!
# Dynamic Equation Package

This module defines the structure for dynamic equations on time scales, including the delta derivative and initial value problems.
-/

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean

structure DynamicEquation (T : TimeScale) where
  unknown : Type u
  deltaDerivative : (T.carrier → unknown) → T.carrier → unknown
  rightHandSide : T.carrier → unknown → unknown
  initialCondition : unknown
  equationSatisfied : ∀ f : T.carrier → unknown, (∀ t : T.carrier, deltaDerivative f t = rightHandSide t (f t)) ∧ f (Classical.choose T.nonempty) = initialCondition

structure DynamicEquationEvidence {T : TimeScale} (DE : DynamicEquation T) where
  deltaDerivativeLinear : Prop
  rhsContinuous : Prop
  existenceUniqueness : Prop
  deltaDerivativeLinearClosed : DE.deltaDerivativeLinear
  rhsContinuousClosed : DE.rhsContinuous
  existenceUniquenessClosed : DE.existenceUniqueness

def DynamicEquationClosed {T : TimeScale} (DE : DynamicEquation T) : Prop :=
  DE.deltaDerivativeLinear ∧ DE.rhsContinuous ∧ DE.existenceUniqueness

theorem dynamic_equation_closed_from_evidence {T : TimeScale} (DE : DynamicEquation T) (E : DynamicEquationEvidence DE) : DynamicEquationClosed DE := by
  exact And.intro E.deltaDerivativeLinearClosed (And.intro E.rhsContinuousClosed E.existenceUniquenessClosed)

end FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean
end HautevilleHouse