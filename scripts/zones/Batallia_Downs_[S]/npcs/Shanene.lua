-----------------------------------
-- Area: Batallia Downs (S)
--  NPC: Shanene
-- !pos 161.183 0.468 91.111 84
-----------------------------------
require('scripts/globals/keyitems')
require('scripts/globals/items')
require('scripts/globals/npc_util')
require('scripts/globals/settings')
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local hasScrollsBundle = player:hasKeyItem(xi.ki.BUNDLE_OF_HALF_INSCRIBED_SCROLLS)
    local hasRainemard = player:hasItem(xi.items.CIPHER_OF_RAINEMARDS_ALTER_EGO) or
                         player:hasSpell(xi.magic.spell.RAINEMARD)

    if hasScrollsBundle and not hasRainemard then
        player:startEvent(36)
    else
        player:startEvent(37)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 36 and option == 2 then
        npcUtil.giveItem(player, xi.items.CIPHER_OF_RAINEMARDS_ALTER_EGO)
    end
end

return entity
