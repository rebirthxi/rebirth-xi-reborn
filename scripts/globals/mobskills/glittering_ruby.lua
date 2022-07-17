-----------------------------------
-- Glittering Ruby
-----------------------------------
require("scripts/globals/mobskills")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local mobskill_object = {}

mobskill_object.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskill_object.onMobWeaponSkill = function(target, mob, skill)
    --randomly give str/dex/vit/agi/int/mnd/chr (+12)
    local effect = math.random()
    local effectid = xi.effect.STR_BOOST
    if (effect<=0.14) then --STR
        effectid = xi.effect.STR_BOOST
    elseif (effect<=0.28) then --DEX
        effectid = xi.effect.DEX_BOOST
    elseif (effect<=0.42) then --VIT
        effectid = xi.effect.VIT_BOOST
    elseif (effect<=0.56) then --AGI
        effectid = xi.effect.AGI_BOOST
    elseif (effect<=0.7) then --INT
        effectid = xi.effect.INT_BOOST
    elseif (effect<=0.84) then --MND
        effectid = xi.effect.MND_BOOST
    else --CHR
        effectid = xi.effect.CHR_BOOST
    end

    target:addStatusEffect(effectid, math.random(12, 14), 0, 90)
    skill:setMsg(xi.msg.basic.SKILL_GAIN_EFFECT)
    return effectid
end

return mobskill_object
