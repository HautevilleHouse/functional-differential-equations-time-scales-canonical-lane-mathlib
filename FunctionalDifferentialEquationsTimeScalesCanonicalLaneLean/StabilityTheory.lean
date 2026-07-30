import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean.TimeScaleCalculus
import HautevilleHouse.FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean.DynamicEquation

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean

structure StabilityPackage (T : TimeScale) (eq : DynamicEquation T) where
  equilibrium : T.carrier -> ℝ
  lyapunovFunction : (T.carrier -> ℝ) -> (T.carrier -> ℝ)
  positiveDefinite : Prop
  derivativeNegative : Prop
  stabilityHolds : Prop

structure StabilityEvidence (T : TimeScale) (eq : DynamicEquation T) (S : StabilityPackage T eq) where
  positiveDefiniteClosed : S.positiveDefinite
  derivativeNegativeClosed : S.derivativeNegative
  stabilityHoldsClosed : S.stabilityHolds

def StabilityClosed (T : TimeScale) (eq : DynamicEquation T) (S : StabilityPackage T eq) : Prop :=
  S.positiveDefinite ∧ S.derivativeNegative ∧ S.stabilityHolds

theorem stability_closed_from_evidence (T : TimeScale) (eq : DynamicEquation T) (S : StabilityPackage T eq) (E : StabilityEvidence T eq S) : StabilityClosed T eq S := by
  exact And.intro E.positiveDefiniteClosed (And.intro E.derivativeNegativeClosed E.stabilityHoldsClosed)

end FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean
end HautevilleHouse