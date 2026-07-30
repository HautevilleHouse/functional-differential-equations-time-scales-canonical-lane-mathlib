import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean

structure TimeScaleIntegrationPackage where
  timeScaleSet : Type u
  deltaIntegral : (ℝ → ℝ) → timeScaleSet → timeScaleSet → ℝ
  fundamentalTheorem : Prop
  integrationByParts : Prop
  hölderInequality : Prop
  convergenceTheorems : Prop

structure TimeScaleIntegrationEvidence (I : TimeScaleIntegrationPackage) where
  fundamentalTheoremClosed : I.fundamentalTheorem
  integrationByPartsClosed : I.integrationByParts
  hölderInequalityClosed : I.hölderInequality
  convergenceTheoremsClosed : I.convergenceTheorems

def TimeScaleIntegrationClosed (I : TimeScaleIntegrationPackage) : Prop :=
  I.fundamentalTheorem ∧ I.integrationByParts ∧ I.hölderInequality ∧ I.convergenceTheorems

theorem time_scale_integration_closed_from_evidence
    (I : TimeScaleIntegrationPackage) (E : TimeScaleIntegrationEvidence I) :
    TimeScaleIntegrationClosed I := by
  exact And.intro E.fundamentalTheoremClosed (And.intro E.integrationByPartsClosed (And.intro E.hölderInequalityClosed E.convergenceTheoremsClosed))

end FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean
end HautevilleHouse