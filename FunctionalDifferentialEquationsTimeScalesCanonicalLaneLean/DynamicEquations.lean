import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean

structure DynamicEquation (T : TimeScale) (X : Type u) [NormedAddCommGroup X] where
  lhs : DeltaDerivative T X
  rhs : X
  solution : T.carrier → X
  boundaryCondition : Prop
  uniqueness : Prop
  existenceTerm : uniqueness

definition dynamicEquationSatisfied (eq : DynamicEquation T X) : Prop :=
  ∀ t : T.carrier, eq.lhs.value = eq.rhs → eq.solution t = eq.lhs.value

end FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean
end HautevilleHouse
