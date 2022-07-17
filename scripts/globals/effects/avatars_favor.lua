-----------------------------------
-- xi.effect.AVATARS_FAVOR
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/pets")
require("scripts/globals/avatars_favor")
-----------------------------------
local effect_object = {}

effect_object.onEffectGain = function(target, effect)
    xi.avatarsFavor.applyAvatarsFavorAuraToPet(target, effect)
    xi.avatarsFavor.applyAvatarsFavorDebuffsToPet(target)
end

effect_object.onEffectTick = function(target, effect)
    -- Perform tick power upgrade to max
    if effect:getPower() <= 11 then
        effect:setPower(effect:getPower() + 1)
    end

    local summoningSkill = target:getSkillLevel(xi.skill.SUMMONING_MAGIC)

    for i = 1, 7 do
        if
            summoningSkill <= xi.avatarsFavor.skillLevels[i] and
            effect:getPower() > i
        then
            effect:setPower(i)
            break
        elseif
            summoningSkill > 670 and
            effect:getPower() > 7
        then
            effect:setPower(7) -- Making sure we set a power if we are over 670 skill
        end
    end

    -- Applying gear bonus
    effect:setPower(effect:getPower() + target:getMaxGearMod(xi.mod.AVATARS_FAVOR_ENHANCE))

    -- TODO add Job Point Gift Bonus
    -- if GET PLAYERS JP TOTAL >= 550 then
    --    effect:setPower(effect:getPower() + 1)
    -- end

    xi.avatarsFavor.applyAvatarsFavorAuraToPet(target, effect)
end

effect_object.onEffectLose = function(target, effect)
    xi.avatarsFavor.removeAvatarsFavorAuraFromPet(target)
end

return effect_object
