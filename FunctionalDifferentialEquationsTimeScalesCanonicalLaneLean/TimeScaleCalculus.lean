import canonicalLaneMathlib.AdmissibleClass

/-!
# Time Scale Calculus Package

This module defines the foundational structures for time scales, which are arbitrary nonempty closed subsets of ℝ.
-/

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean

structure TimeScale where
  carrier : Set ℝ
  nonempty : carrier.Nonempty
  closed : IsClosed carrier
  forwardJump : carrier → carrier
  backwardJump : carrier → carrier
  graininess : carrier → ℝ≥0
  forwardJumpContinuous : Continuous forwardJump
  backwardJumpContinuous : Continuous backwardJump
  graininessContinuous : Continuous graininess

structure TimeScaleEvidence (T : TimeScale) where
  nonemptyClosed : T.nonempty ∧ T.closed
  jumpGraininessCoherence : ∀ t : T.carrier, T.forwardJump t = t ∨ T.forwardJump t > t
  forwardJumpContinuousClosed : T.forwardJumpContinuous
  backwardJumpContinuousClosed : T.backwardJumpContinuous
  graininessContinuousClosed : T.graininessContinuous

def TimeScaleClosed (T : TimeScale) : Prop :=
  T.nonempty ∧ T.closed ∧ T.forwardJumpContinuous ∧ T.backwardJumpContinuous ∧ T.graininessContinuous

theorem time_scale_closed_from_evidence (T : TimeScale) (E : TimeScaleEvidence T) : TimeScaleClosed T := by
  exact And.intro E.nonemptyClosed.1 (And.intro E.nonemptyClosed.2 (And.intro E.forwardJumpContinuousClosed (And.intro E.backwardJumpContinuousClosed E.graininessContinuousClosed)))

end FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean
end HautevilleHouse