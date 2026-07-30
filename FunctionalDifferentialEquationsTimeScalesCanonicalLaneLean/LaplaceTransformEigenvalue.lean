import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean.TimeScaleRegressiveFunctions

/-!
# Laplace Transform Eigenvalue Package
-/

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean

structure LaplaceTransformEigenvaluePackage where
  eigenvalueEquation : Prop
  laplaceTransform : Type u
  regressiveParameter : Prop
  eigenvalueEquationTerm : eigenvalueEquation
  laplaceTransformTerm : laplaceTransform
  regressiveParameterTerm : regressiveParameter

structure LaplaceTransformEigenvalueEvidence (L : LaplaceTransformEigenvaluePackage) where
  eigenvalueEquationClosed : L.eigenvalueEquation
  regressiveParameterClosed : L.regressiveParameter

def LaplaceTransformEigenvalueClosed (L : LaplaceTransformEigenvaluePackage) : Prop :=
  L.eigenvalueEquation ∧ L.regressiveParameter

theorem laplace_transform_eigenvalue_closed_from_evidence (L : LaplaceTransformEigenvaluePackage) (E : LaplaceTransformEigenvalueEvidence L) : LaplaceTransformEigenvalueClosed L :=
  And.intro E.eigenvalueEquationClosed E.regressiveParameterClosed

end FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean
end HautevilleHouse
