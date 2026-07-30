import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean.TimeScaleCalculus

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean

structure NablaDerivativePackage (ts : TimeScaleObject) where
  domain : ts → ℝ
  limitDefinition : (x : ts) → ℝ
  nablaDifferentiable : Prop
  nablaDerivativeFormula : Prop

definition NablaDerivativeEvidence (D : NablaDerivativePackage ts) where
  nablaDifferentiableClosed : D.nablaDifferentiable
  nablaDerivativeFormulaClosed : D.nablaDerivativeFormula

def NablaDerivativeClosed (D : NablaDerivativePackage ts) : Prop :=
  D.nablaDifferentiable ∧ D.nablaDerivativeFormula

theorem nabla_derivative_closed_from_evidence (D : NablaDerivativePackage ts) (E : NablaDerivativeEvidence D) : NablaDerivativeClosed D :=
  And.intro E.nablaDifferentiableClosed E.nablaDerivativeFormulaClosed

end FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean
end HautevilleHouse