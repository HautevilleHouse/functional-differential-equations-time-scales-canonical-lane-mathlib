import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean.TimeScaleCalculus
import HautevilleHouse.FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean.ExistenceUniqueness

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean

structure FunctionalDelayTerm (T : TimeScale) (S : Type u) where
  delayFunction : T.carrier → T.carrier
  historyFunction : (T.carrier → S) → T.carrier → S
  delayContinuous : Prop
  historyBounded : Prop

structure FunctionalDifferentialEquation (T : TimeScale) where
  stateSpace : Type u
  currentStateTerm : T.carrier × stateSpace → stateSpace
  delayTerms : List (FunctionalDelayTerm T stateSpace)
  delayOrder : Nat
  initialFunction : (T.carrier → stateSpace)
  initialInterval : T.carrier × T.carrier
  rdContinuous : Prop

structure FunctionalDifferentialEquationSolution (T : TimeScale) (FDE : FunctionalDifferentialEquation T) where
  solutionFunction : T.carrier → FDE.stateSpace
  satisfiesEquation : Prop
  satisfiesInitialCondition : Prop
  domainInterval : T.carrier × T.carrier
  maximalDomain : Prop

structure SolutionEvidence (T : TimeScale) (FDE : FunctionalDifferentialEquation T) (Sol : FunctionalDifferentialEquationSolution T FDE) where
  satisfiesEquationClosed : Sol.satisfiesEquation
  satisfiesInitialConditionClosed : Sol.satisfiesInitialCondition
  maximalDomainClosed : Sol.maximalDomain

def SolutionClosed (T : TimeScale) (FDE : FunctionalDifferentialEquation T) (Sol : FunctionalDifferentialEquationSolution T FDE) : Prop :=
  Sol.satisfiesEquation ∧ Sol.satisfiesInitialCondition ∧ Sol.maximalDomain

theorem solution_closed_from_evidence (T : TimeScale) (FDE : FunctionalDifferentialEquation T) (Sol : FunctionalDifferentialEquationSolution T FDE) (Ev : SolutionEvidence T FDE Sol) : SolutionClosed T FDE Sol := by
  exact And.intro Ev.satisfiesEquationClosed (And.intro Ev.satisfiesInitialConditionClosed Ev.maximalDomainClosed)

end HautevilleHouse
end FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean