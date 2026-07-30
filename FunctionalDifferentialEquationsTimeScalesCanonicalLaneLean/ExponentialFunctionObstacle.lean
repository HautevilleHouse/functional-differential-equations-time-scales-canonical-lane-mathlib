import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean.TimeScaleRegressiveFunctions

/-!
# Exponential Function Obstacle Package
-/

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean

structure ExponentialFunctionObstaclePackage where
  exponentialFunction : Type u
  dynamicEquation : Type v
  closedFormCondition : Prop
  exponentialFunctionTerm : exponentialFunction
  dynamicEquationTerm : dynamicEquation
  closedFormConditionTerm : closedFormCondition

structure ExponentialFunctionObstacleEvidence (E : ExponentialFunctionObstaclePackage) where
  closedFormConditionClosed : E.closedFormCondition

def ExponentialFunctionObstacleClosed (E : ExponentialFunctionObstaclePackage) : Prop :=
  E.closedFormCondition

theorem exponential_function_obstacle_closed_from_evidence (E : ExponentialFunctionObstaclePackage) (Ev : ExponentialFunctionObstacleEvidence E) : ExponentialFunctionObstacleClosed E :=
  Ev.closedFormConditionClosed

end FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean
end HautevilleHouse
