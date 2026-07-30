import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean

structure TimeScaleAdmittedObject where
  timeScale : TimeScale
  dynamicEquation : DynamicEquation timeScale
  stabilityPackages : List (ExponentialStabilityPackage dynamicEquation)
  admissibleClosure : Prop

structure AdmissibleClass where
  object : TimeScaleAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  TimeScaleClosed A.object.timeScale ∧ DynamicEquationClosed A.object.dynamicEquation ∧ (∀ ES ∈ A.object.stabilityPackages, ExponentialStabilityClosed ES) ∧ A.endpointSatisfied

end FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean
end HautevilleHouse