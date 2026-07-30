import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean.TimeScaleCalculus
import HautevilleHouse.FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean.DynamicEquation

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean

structure ExistenceUniquenessPackage (T : TimeScale) where
  equation : DynamicEquation T
  existenceGuarantee : Prop
  uniquenessGuarantee : Prop
  domainInterval : Set T.carrier

structure ExistenceUniquenessEvidence (T : TimeScale) (P : ExistenceUniquenessPackage T) where
  existenceGuaranteeClosed : P.existenceGuarantee
  uniquenessGuaranteeClosed : P.uniquenessGuarantee

def ExistenceUniquenessClosed (T : TimeScale) (P : ExistenceUniquenessPackage T) : Prop :=
  P.existenceGuarantee ∧ P.uniquenessGuarantee

theorem existence_uniqueness_closed_from_evidence (T : TimeScale) (P : ExistenceUniquenessPackage T) (E : ExistenceUniquenessEvidence T P) : ExistenceUniquenessClosed T P := by
  exact And.intro E.existenceGuaranteeClosed E.uniquenessGuaranteeClosed

end FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean
end HautevilleHouse