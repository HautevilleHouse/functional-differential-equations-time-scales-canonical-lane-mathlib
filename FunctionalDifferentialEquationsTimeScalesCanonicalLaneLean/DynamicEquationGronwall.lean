import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean.TimeScaleRegressiveFunctions

/-!
# Dynamic Equation Gronwall Inequality Package
-/

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean

structure DynamicEquationGronwallPackage where
  initialValueProblem : Prop
  linearDynamicEquation : Prop
  regressiveCoefficient : Prop
  gronwallInequality : Prop
  initialValueProblemTerm : initialValueProblem
  linearDynamicEquationTerm : linearDynamicEquation
  regressiveCoefficientTerm : regressiveCoefficient
  gronwallInequalityTerm : gronwallInequality

structure DynamicEquationGronwallEvidence (D : DynamicEquationGronwallPackage) where
  gronwallInequalityClosed : D.gronwallInequality
  initialValueProblemClosed : D.initialValueProblem
  linearDynamicEquationClosed : D.linearDynamicEquation
  regressiveCoefficientClosed : D.regressiveCoefficient

def DynamicEquationGronwallClosed (D : DynamicEquationGronwallPackage) : Prop :=
  D.initialValueProblem ∧ D.linearDynamicEquation ∧ D.regressiveCoefficient ∧ D.gronwallInequality

theorem dynamic_equation_gronwall_closed_from_evidence (D : DynamicEquationGronwallPackage) (E : DynamicEquationGronwallEvidence D) : DynamicEquationGronwallClosed D :=
  And.intro E.initialValueProblemClosed (And.intro E.linearDynamicEquationClosed (And.intro E.regressiveCoefficientClosed E.gronwallInequalityClosed))

end FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean
end HautevilleHouse
