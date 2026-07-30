import FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

def timeScaleProjection : Projection FunctionalDifferentialEndgameState := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem timeScale_projection_idempotent (x : FunctionalDifferentialEndgameState) :
    timeScaleProjection.toFun (timeScaleProjection.toFun x) = timeScaleProjection.toFun x := by
  exact timeScaleProjection.idempotent x

end FunctionalDifferentialEquationsTimeScalesCanonicalLaneLean
end HautevilleHouse