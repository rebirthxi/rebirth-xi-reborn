-----------------------------------
-- String Clipper
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/automatonweaponskills")

-----------------------------------
local ability_object = {}

ability_object.onAutomatonAbilityCheck = function(target, automaton, skill)
    local master = automaton:getMaster()
    return master:countEffect(xi.effect.THUNDER_MANEUVER)
end

ability_object.onAutomatonAbility = function(target, automaton, skill, master, action)
    local params =
    {
        numHits = 2,
        atkmulti = 1.25,
        weaponType = xi.skill.SWORD,
        ftp100 = 2.0,
        ftp200 = 2.0,
        ftp300 = 2.0,
        acc100 = 0.0,
        acc200 = 0.0,
        acc300 = 0.0,
        str_wsc = 0.3,
        dex_wsc = 0.3,
        vit_wsc = 0.0,
        agi_wsc = 0.0,
        int_wsc = 0.0,
        mnd_wsc = 0.0,
        chr_wsc = 0.0
    }

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.ftp100 = 3.5
        params.ftp200 = 3.5
        params.ftp300 = 3.5
        params.accBonus = 0.05 * skill:getTP()
    end

    local damage = doAutoPhysicalWeaponskill(automaton, target, 0, skill:getTP(), true, action, false, params, skill)

    return damage
end

return ability_object
