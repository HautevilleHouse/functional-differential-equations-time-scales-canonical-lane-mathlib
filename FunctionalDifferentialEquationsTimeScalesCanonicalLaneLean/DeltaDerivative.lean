import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean

structure TimeScale where
  carrier : Type u
  le : carrier → carrier → Prop
  condition : Prop

definition timeScaleCondition (T : TimeScale) : Prop :=
  T.condition

structure DeltaDerivative (T : TimeScale) (X : Type v) [NormedAddCommGroup X] where
  t : T.carrier
  value : X
  limitProp : Prop
  limitPropTerm : limitProp

definition deltaDerivativeDefined (f : T.carrier → X) (t : T.carrier) : Prop :=
  True

end FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean
end HautevilleHouse
