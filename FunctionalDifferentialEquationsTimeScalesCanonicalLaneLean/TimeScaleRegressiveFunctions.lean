import canonicalLaneMathlib.AdmissibleClass

/-!
# Time Scale Regressive Functions Package
-/

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean

structure TimeScaleRegressiveFunctionsPackage where
  regressiveSet : Type u
  multiplication : regressiveSet → regressiveSet → regressiveSet
  addition : regressiveSet → regressiveSet → regressiveSet
  circleMultiplicationAssociative : Prop
  circleMultiplicationAssociativeTerm : circleMultiplicationAssociative
  regressiveOfRegressiveSum : Prop
  regressiveOfRegressiveSumTerm : regressiveOfRegressiveSum
  regressiveOfNegative : Prop
  regressiveOfNegativeTerm : regressiveOfNegative

structure TimeScaleRegressiveFunctionsEvidence (R : TimeScaleRegressiveFunctionsPackage) where
  circleMultiplicationAssociativeClosed : R.circleMultiplicationAssociative
  regressiveOfRegressiveSumClosed : R.regressiveOfRegressiveSum
  regressiveOfNegativeClosed : R.regressiveOfNegative

def TimeScaleRegressiveFunctionsClosed (R : TimeScaleRegressiveFunctionsPackage) : Prop :=
  R.circleMultiplicationAssociative ∧ R.regressiveOfRegressiveSum ∧ R.regressiveOfNegative

theorem time_scale_regressive_functions_closed_from_evidence (R : TimeScaleRegressiveFunctionsPackage) (E : TimeScaleRegressiveFunctionsEvidence R) : TimeScaleRegressiveFunctionsClosed R :=
  And.intro E.circleMultiplicationAssociativeClosed (And.intro E.regressiveOfRegressiveSumClosed E.regressiveOfNegativeClosed)

end FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean
end HautevilleHouse
