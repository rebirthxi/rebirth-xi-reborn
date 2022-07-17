-----------------------------------
-- Discharger
--
-- Description: Places a magic barrier and shock spikes.
-- Type: Enhancing
-- Utsusemi/Blink absorb: N/A
-- Range: Self
-- Notes: Used only by Omega
-----------------------------------
require("scripts/globals/mobskills")
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------
local mobskill_object = {}

mobskill_object.onMobSkillCheck = function(target, mob, skill)
    local mobhp = mob:getHPP()

    if (mobhp < 26) then
        return 0
    end
    return 1
end

mobskill_object.onMobWeaponSkill = function(target, mob, skill)
    local typeEffectOne = xi.effect.MAGIC_SHIELD
    local typeEffectTwo = xi.effect.SHOCK_SPIKES

    skill:setMsg(xi.mobskills.mobBuffMove(mob, typeEffectOne, 1, 0, 60))
    xi.mobskills.mobBuffMove(mob, typeEffectTwo, 25, 0, 60)
    return typeEffectOne
end

return mobskill_object
