import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean.TimeScaleCalculus
import HautevilleHouse.FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean.DeltaDerivative

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean

structure DynamicalSystemsPackage (ts : TimeScaleObject) (D : DeltaDerivativePackage ts) where
  semiflow : Prop
  exponentialStability : Prop
  lyapunovFunction : Prop

definition DynamicalSystemsEvidence (S : DynamicalSystemsPackage ts D) where
  semiflowClosed : S.semiflow
  exponentialStabilityClosed : S.exponentialStability
  lyapunovFunctionClosed : S.lyapunovFunction

def DynamicalSystemsClosed (S : DynamicalSystemsPackage ts D) : Prop :=
  S.semiflow ∧ S.exponentialStability ∧ S.lyapunovFunction

theorem dynamical_systems_closed_from_evidence (S : DynamicalSystemsPackage ts D) (E : DynamicalSystemsEvidence S) : DynamicalSystemsClosed S :=
  And.intro E.semiflowClosed (And.intro E.exponentialStabilityClosed E.lyapunovFunctionClosed)

end FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean
end HautevilleHouse