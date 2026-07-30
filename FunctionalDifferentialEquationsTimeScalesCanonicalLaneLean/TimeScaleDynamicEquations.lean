import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean

structure TimeScaleDynamicEquationPackage where
  timeScaleSet : Type u
  equationOrder : ℕ
  initialValueProblem : Prop
  existenceAndUniqueness : Prop
  continuousDependence : Prop

structure TimeScaleDynamicEquationEvidence (D : TimeScaleDynamicEquationPackage) where
  initialValueProblemClosed : D.initialValueProblem
  existenceAndUniquenessClosed : D.existenceAndUniqueness
  continuousDependenceClosed : D.continuousDependence

def TimeScaleDynamicEquationClosed (D : TimeScaleDynamicEquationPackage) : Prop :=
  D.initialValueProblem ∧ D.existenceAndUniqueness ∧ D.continuousDependence

theorem time_scale_dynamic_equation_closed_from_evidence
    (D : TimeScaleDynamicEquationPackage) (E : TimeScaleDynamicEquationEvidence D) :
    TimeScaleDynamicEquationClosed D := by
  exact And.intro E.initialValueProblemClosed (And.intro E.existenceAndUniquenessClosed E.continuousDependenceClosed)

end FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean
end HautevilleHouse