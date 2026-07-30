import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean

structure ExponentialStability (T : TimeScale) (X : Type u) [NormedAddCommGroup X] where
  dynamicEquation : DynamicEquation T X
  equilibrium : X
  lyapunovFunction : X → ℝ
  decayRate : ℝ
  stabilityProof : Prop
  stabilityProofTerm : stabilityProof

definition exponentiallyStable (s : ExponentialStability T X) : Prop :=
  s.stabilityProof

end FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean
end HautevilleHouse
