import FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean.DeltaDerivativePackage

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean

structure DynamicEquationPackage (T : TimeScale) where
  unknown : T.carrier → ℝ
  rightHandSide : T.carrier × ℝ → ℝ
  equationForm : Prop
  initialCondition : Prop
  existenceResult : Prop
  uniquenessResult : Prop

structure DynamicEquationEvidence {T : TimeScale} (E : DynamicEquationPackage T) where
  equationFormClosed : E.equationForm
  initialConditionClosed : E.initialCondition
  existenceResultClosed : E.existenceResult
  uniquenessResultClosed : E.uniquenessResult

def DynamicEquationClosed {T : TimeScale} (E : DynamicEquationPackage T) : Prop :=
  E.equationForm ∧ E.initialCondition ∧ E.existenceResult ∧ E.uniquenessResult

theorem dynamic_equation_closed_from_evidence {T : TimeScale} (E : DynamicEquationPackage T) (Ev : DynamicEquationEvidence E) : DynamicEquationClosed E :=
  And.intro Ev.equationFormClosed (And.intro Ev.initialConditionClosed (And.intro Ev.existenceResultClosed Ev.uniquenessResultClosed))

end FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean
end HautevilleHouse
