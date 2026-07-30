import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean.TimeScaleCalculus
import HautevilleHouse.FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean.FunctionalDifferentialEquation

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean

structure OscillationPackage (T : TimeScale) (FDE : FunctionalDifferentialEquation T) where
  solutionClass : Type u
  oscillationProperty : Prop
  nonoscillationProperty : Prop
  criteria : Prop
  classification : Prop

structure OscillationEvidence (T : TimeScale) (FDE : FunctionalDifferentialEquation T) (O : OscillationPackage T FDE) where
  oscillationPropertyClosed : O.oscillationProperty
  nonoscillationPropertyClosed : O.nonoscillationProperty
  criteriaClosed : O.criteria
  classificationClosed : O.classification

def OscillationClosed (T : TimeScale) (FDE : FunctionalDifferentialEquation T) (O : OscillationPackage T FDE) : Prop :=
  O.oscillationProperty ∧ O.nonoscillationProperty ∧ O.criteria ∧ O.classification

theorem oscillation_closed_from_evidence (T : TimeScale) (FDE : FunctionalDifferentialEquation T) (O : OscillationPackage T FDE) (Ev : OscillationEvidence T FDE O) : OscillationClosed T FDE O := by
  exact And.intro Ev.oscillationPropertyClosed (And.intro Ev.nonoscillationPropertyClosed (And.intro Ev.criteriaClosed Ev.classificationClosed))

end HautevilleHouse
end FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean