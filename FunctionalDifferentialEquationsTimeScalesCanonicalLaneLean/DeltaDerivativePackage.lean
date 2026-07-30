import FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean.TimeScaleCalculus

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean

structure DeltaDerivativePackage (T : TimeScale) where
  f : T.carrier → ℝ
  derivativeAt : T.carrier → ℝ
  limitDefinition : Prop
  linearity : Prop
  productRule : Prop

structure DeltaDerivativeEvidence {T : TimeScale} (D : DeltaDerivativePackage T) where
  limitDefinitionClosed : D.limitDefinition
  linearityClosed : D.linearity
  productRuleClosed : D.productRule

def DeltaDerivativeClosed {T : TimeScale} (D : DeltaDerivativePackage T) : Prop :=
  D.limitDefinition ∧ D.linearity ∧ D.productRule

theorem delta_derivative_closed_from_evidence {T : TimeScale} (D : DeltaDerivativePackage T) (E : DeltaDerivativeEvidence D) : DeltaDerivativeClosed D :=
  And.intro E.limitDefinitionClosed (And.intro E.linearityClosed E.productRuleClosed)

end FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean
end HautevilleHouse
