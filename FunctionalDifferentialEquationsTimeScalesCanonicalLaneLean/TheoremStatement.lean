import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean

structure FDEAdmittedObject where
  timeScale : Type
  forwardOperator : timeScale → timeScale
  backwardOperator : timeScale → timeScale
  deltaDerivative : (timeScale → ℝ) → (timeScale → ℝ)
  rdContinuity : Prop
  closedUnderDeltaDerivative : Prop
  conclusion : closedUnderDeltaDerivative

def FDEWitnessClosed (O : FDEAdmittedObject) : Prop :=
  O.closedUnderDeltaDerivative

structure FDEEndpointState where
  object : FDEAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop

end FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean
end HautevilleHouse
