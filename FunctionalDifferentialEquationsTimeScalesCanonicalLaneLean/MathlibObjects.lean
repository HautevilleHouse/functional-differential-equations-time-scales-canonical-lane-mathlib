import FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure TimeScaleSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure TimeScaleAdmittedObject where
  space : TimeScaleSpace
  timeScaleCalculusConditions : Prop
  dynamicEquationWellposed : Prop
  solutionModel : Type
  solutionTopology : TopologicalSpace solutionModel
  solutionExistsGlobally : Prop
  conclusion : solutionExistsGlobally

structure FunctionalDifferentialEndgameState where
  object : TimeScaleAdmittedObject

def TimeScaleWitnessClosed (O : TimeScaleAdmittedObject) : Prop :=
  O.solutionExistsGlobally

end FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean
end HautevilleHouse