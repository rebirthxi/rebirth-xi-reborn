-----------------------------------
-- Zone: Abyssea - Konschtat
--  NPC: Conflux Surveyor
-- !pos 133.000 -72.738 -824.000 15
-----------------------------------
require("scripts/globals/abyssea/conflux_surveyor")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    xi.abyssea.surveyorOnTrigger(player, npc)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option, npc)
    xi.abyssea.surveyorOnEventFinish(player, csid, option, npc)
end

return entity
