import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean.TimeScaleCalculus
import HautevilleHouse.FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean.FunctionalDifferentialEquation

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean

structure LyapunovFunction (T : TimeScale) (FDE : FunctionalDifferentialEquation T) where
  functionType : FDE.stateSpace → ℝ
  positiveDefinite : Prop
  decrescent : Prop
  derivativeAlongSolutions : Prop
  derivativeNegativeDefinite : Prop

structure StabilityPackage (T : TimeScale) (FDE : FunctionalDifferentialEquation T) where
  equilibriumPoint : FDE.stateSpace
  lyapunovFunction : LyapunovFunction T FDE
  stabilityType : String -- "uniform" | "asymptotic" | "exponential"
  stabilityCondition : Prop

structure StabilityEvidence (T : TimeScale) (FDE : FunctionalDifferentialEquation T) (P : StabilityPackage T FDE) where
  equilibriumPointClosed : P.stabilityCondition
  lyapunovFunctionClosed : P.lyapunovFunction.positiveDefinite ∧ P.lyapunovFunction.decrescent ∧ P.lyapunovFunction.derivativeNegativeDefinite
  stabilityConditionClosed : P.stabilityCondition

def StabilityClosed (T : TimeScale) (FDE : FunctionalDifferentialEquation T) (P : StabilityPackage T FDE) : Prop :=
  P.stabilityCondition

theorem stability_closed_from_evidence (T : TimeScale) (FDE : FunctionalDifferentialEquation T) (P : StabilityPackage T FDE) (Ev : StabilityEvidence T FDE P) : StabilityClosed T FDE P := by
  exact Ev.stabilityConditionClosed

end HautevilleHouse
end FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean