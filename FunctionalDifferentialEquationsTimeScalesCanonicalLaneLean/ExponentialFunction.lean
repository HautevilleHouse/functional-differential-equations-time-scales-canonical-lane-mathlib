import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean.DynamicEquations

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean

structure ExponentialFunctionPackage {T : TimeScale} {D : DeltaDerivativePackage T}
    (E : DynamicEquationPackage D) where
  exponential : T.carrier → ℝ → ℝ
  initialValue : exponential 0 = 1
  semigroupProperty : ∀ s t, exponential (s + t) = exponential s * exponential t
  differentialEquationSatisfied : Prop
  semigroupPropertyTerm : semigroupProperty
  differentialEquationSatisfiedTerm : differentialEquationSatisfied

structure ExponentialFunctionEvidence {T : TimeScale} {D : DeltaDerivativePackage T}
    {E : DynamicEquationPackage D} (Exp : ExponentialFunctionPackage E) where
  initialValueClosed : Exp.initialValue
  semigroupPropertyClosed : Exp.semigroupProperty
  differentialEquationSatisfiedClosed : Exp.differentialEquationSatisfied

def ExponentialFunctionClosed {T : TimeScale} {D : DeltaDerivativePackage T}
    {E : DynamicEquationPackage D} (Exp : ExponentialFunctionPackage E) : Prop :=
  Exp.initialValue ∧ Exp.semigroupProperty ∧ Exp.differentialEquationSatisfied

theorem exponential_function_closed_from_evidence {T : TimeScale} {D : DeltaDerivativePackage T}
    {E : DynamicEquationPackage D} (Exp : ExponentialFunctionPackage E)
    (Ev : ExponentialFunctionEvidence Exp) : ExponentialFunctionClosed Exp := by
  exact And.intro Ev.initialValueClosed
    (And.intro Ev.semigroupPropertyClosed Ev.differentialEquationSatisfiedClosed)

end FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean
end HautevilleHouse