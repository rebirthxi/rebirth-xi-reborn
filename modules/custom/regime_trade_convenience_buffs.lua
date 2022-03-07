-----------------------------------
-- Convenience module for Field Manual and Grounds Tome
-- Trade them 100 gil and gain all the generic / general purpose
-- buffs
-----------------------------------
require("modules/module_utils")
require("scripts/globals/status")
-----------------------------------
local m = Module:new("regime_trade_convenience_buffs")
m:setEnabled(true)

m:addOverride("xi.regime.bookOnTrade", function(player, npc, trade)
    if trade:getItemCount() ~= 1 or trade:getGil() ~= 100 then
        player:PrintToPlayer("Trade 100 gil only for all non-preferential buffs.", 0xE);
        return;
    end

    local tabs = player:getCurrency("valor_point");
    if (tabs >= 20) then
        player:delStatusEffect(xi.effect.REGEN);
        player:addStatusEffect(xi.effect.REGEN,1,3,3600);
        player:delCurrency("valor_point", 20);
    end
    if (tabs >= 20) then
        player:delStatusEffect(xi.effect.REFRESH);
        player:delStatusEffect(xi.effect.SUBLIMATION_COMPLETE);
        player:delStatusEffect(xi.effect.SUBLIMATION_ACTIVATED);
        player:addStatusEffect(xi.effect.REFRESH,1,3,3600, 0, 3);
        player:delCurrency("valor_point", 20);
    end
    if (tabs >= 15) then
        local mLvl = player:getMainLvl()
        local power = 0
        local tier = 0

        if mLvl < 27 then
            power = 20
            tier = 1
        elseif mLvl < 47 then
            power = 50
            tier = 2
        elseif mLvl < 63 then
            power = 90
            tier = 3
        elseif mLvl < 76 then
            power = 140
            tier = 4
        else
            power = 220
            tier = 5
        end

        local bonus = 0
        if player:getMod(xi.mod.ENHANCES_PROT_SHELL_RCVD) > 0 then
            bonus = 2 -- 2x Tier from MOD
        end

        power = power + (bonus * tier)
        player:delStatusEffectSilent(xi.effect.PROTECT)
        player:addStatusEffect(xi.effect.PROTECT, power, 0, 1800, 0, 0, tier)
        player:delCurrency("valor_point", 15);
    end
    if (tabs >= 15) then
        local mLvl = player:getMainLvl()
        local power = 0
        local tier = 0

        if mLvl < 37 then
            power = 1055 -- Shell I   (27/256)
            tier = 1
        elseif mLvl < 57 then
            power = 1641 -- Shell II  (42/256)
            tier = 2
        elseif mLvl < 68 then
            power = 2188 -- Shell III (56/256)
            tier = 3
        elseif mLvl < 76 then
            power = 2617 -- Shell IV  (67/256)
            tier = 4
        else
            power = 2930 -- Shell V   (75/256)
            tier = 5
        end

        local bonus = 0
        if player:getMod(xi.mod.ENHANCES_PROT_SHELL_RCVD) > 0 then
            bonus = 39   -- (1/256 bonus buff per tier of spell)
        end

        power = power + (bonus * tier)
        player:delStatusEffectSilent(xi.effect.SHELL)
        player:addStatusEffect(xi.effect.SHELL, power, 0, 1800, 0, 0, tier)
        player:delCurrency("valor_point", 15);
    end
    if (tabs >= 10) then
        player:delStatusEffectSilent(xi.effect.RERAISE)
        player:addStatusEffect(xi.effect.RERAISE, 1, 0, 7200)
        player:delCurrency("valor_point", 10);
    end
    player:tradeComplete();
end)

return m
