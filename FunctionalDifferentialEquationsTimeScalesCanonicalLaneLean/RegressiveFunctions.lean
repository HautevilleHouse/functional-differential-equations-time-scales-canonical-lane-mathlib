import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean.TimeScaleCalculus

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean

structure RegressiveFunction (T : TimeScale) where
  func : T.carrier → ℝ
  regressiveCondition : forall t, 1 + T.graininess t * func t ≠ 0

structure ExponentialFunction (T : TimeScale) (p : RegressiveFunction T) where
  mapping : T.carrier → ℝ
  satisfiesExpDyn : forall t, DeltaDerivative T mapping at t = p.func t * mapping t

theorem exponential_uniqueness (T : TimeScale) (p : RegressiveFunction T) (e1 e2 : ExponentialFunction T p) (t0 : T.carrier) (h : e1.mapping t0 = e2.mapping t0) : forall t, e1.mapping t = e2.mapping t := by
  intro t
  have : forall t, DeltaDerivative T (fun t' => e1.mapping t' - e2.mapping t') at t = (p.func t) * (e1.mapping t - e2.mapping t) := by
    intro t'
    rw [DeltaDerivative.sub_const, e1.satisfiesExpDyn t', e2.satisfiesExpDyn t']
    ring
  have h0 : (e1.mapping t0 - e2.mapping t0) = 0 := by
    rw [h, sub_self]
  have := exponential_uniqueness_lemma T p (fun t' => e1.mapping t' - e2.mapping t') this h0 t
  simpa [sub_eq_zero] using this

end FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean
end HautevilleHouse