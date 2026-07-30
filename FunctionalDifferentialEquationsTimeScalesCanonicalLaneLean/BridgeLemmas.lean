import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  TimeScaleClosed A.object.timeScale ∧ DynamicEquationClosed A.object.dynamicEquation ∧ (∀ ES ∈ A.object.stabilityPackages, ExponentialStabilityClosed ES)

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.object.admissibleClosure

end FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean
end HautevilleHouse