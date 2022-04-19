-----------------------------------
-- func: addlowbieaugment
-- desc: Adds an item to low tier augment to a GM's inventory
-----------------------------------
require("scripts/globals/qr_augments")

cmdprops =
{
    permission = 1,
    parameters = "iiiiiiiiiii"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!additem <itemId> {quantity} {aug1} {v1} {aug2} {v2} {aug3} {v3} {aug4} {v4} {trial}")
end

function onTrigger(player)
    local augs, augs_src = xi.augments.RollAugments({chances = {100, 50}, pool = {1, 1}})
    player:addItem({id=xi.augments.ingredients.LOWBIE_AUG, augments=augs, aug_src=augs_src})
    player:messageSpecial(zones[player:getZoneID()].text.ITEM_OBTAINED, xi.augments.ingredients.LOWBIE_AUG)
end
