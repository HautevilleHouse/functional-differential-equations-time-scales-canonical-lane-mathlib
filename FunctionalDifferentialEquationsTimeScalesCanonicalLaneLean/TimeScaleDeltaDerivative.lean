import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean

structure TimeScaleDeltaDerivativePackage where
  timeScaleSet : Type u
  forwardJump : timeScaleSet → timeScaleSet
  graininessFunction : timeScaleSet → ℝ
  deltaDerivative : (ℝ → ℝ) → timeScaleSet → ℝ
  linearity : Prop
  productRule : Prop
  quotientRule : Prop
  chainRule : Prop

structure TimeScaleDeltaDerivativeEvidence (P : TimeScaleDeltaDerivativePackage) where
  linearityClosed : P.linearity
  productRuleClosed : P.productRule
  quotientRuleClosed : P.quotientRule
  chainRuleClosed : P.chainRule

def TimeScaleDeltaDerivativeClosed (P : TimeScaleDeltaDerivativePackage) : Prop :=
  P.linearity ∧ P.productRule ∧ P.quotientRule ∧ P.chainRule

theorem time_scale_delta_derivative_closed_from_evidence
    (P : TimeScaleDeltaDerivativePackage) (E : TimeScaleDeltaDerivativeEvidence P) :
    TimeScaleDeltaDerivativeClosed P := by
  exact And.intro E.linearityClosed (And.intro E.productRuleClosed (And.intro E.quotientRuleClosed E.chainRuleClosed))

end FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean
end HautevilleHouse