-----------------------------------
-- Limit trusts to one per player
-- Allow
-----------------------------------
require("modules/module_utils")
local ID = require("scripts/zones/Rabao/IDs")
-----------------------------------
local m = Module:new("limit_trusts_to_one_per_player")
m:setEnabled(true)

local rovKIBattlefieldIDs = set{
    5,    -- Shattering Stars (WAR LB5)
    6,    -- Shattering Stars (BLM LB5)
    7,    -- Shattering Stars (RNG LB5)
    70,   -- Shattering Stars (RDM LB5)
    71,   -- Shattering Stars (THF LB5)
    72,   -- Shattering Stars (BST LB5)
    101,  -- Shattering Stars (MNK LB5)
    102,  -- Shattering Stars (WHM LB5)
    103,  -- Shattering Stars (SMN LB5)
    163,  -- Survival of the Wisest (SCH LB5)
    194,  -- Shattering Stars (SAM LB5)
    195,  -- Shattering Stars (NIN LB5)
    196,  -- Shattering Stars (DRG LB5)
    517,  -- Shattering Stars (PLD LB5)
    518,  -- Shattering Stars (DRK LB5)
    519,  -- Shattering Stars (BRD LB5)
    530,  -- A Furious Finale (DNC LB5)
    1091, -- Breaking the Bonds of Fate (COR LB5)
    1123, -- Achieving True Power (PUP LB5)
    1154, -- The Beast Within (BLU LB5)
    -- TODO: GEO LB5
    -- TODO: RUN LB5
}

m:addOverride("xi.trust.canCast", function(caster, spell, not_allowed_trust_ids)
    -- Trusts must be enabled in settings
    if xi.settings.ENABLE_TRUST_CASTING == 0 then
        return xi.msg.basic.TRUST_NO_CAST_TRUST
    end

    -- Trusts not allowed in an alliance
    --if caster:checkSoloPartyAlliance() == 2 then
    --    return xi.msg.basic.TRUST_NO_CAST_TRUST
    --end

    -- Trusts only allowed in certain zones (Remove this for trusts everywhere)
    if not caster:canUseMisc(xi.zoneMisc.TRUST) then
        return xi.msg.basic.TRUST_NO_CALL_AE
    end

    -- You can only summon trusts if you are the party leader or solo
    local leader = caster:getPartyLeader()
    if leader and caster:getID() ~= leader:getID() then
        caster:messageSystem(xi.msg.system.TRUST_SOLO_OR_LEADER)
        return -1
    end

    -- Block summoning trusts if seeking a party
    if caster:isSeekingParty() then
        caster:messageSystem(xi.msg.system.TRUST_NO_SEEKING_PARTY)
        return -1
    end

    -- Block summoning trusts if someone recently joined party (120s)
    --local last_party_member_added_time = caster:getPartyLastMemberJoinedTime()
    --if os.time() - last_party_member_added_time < 120 then
    --    caster:messageSystem(xi.msg.system.TRUST_DELAY_NEW_PARTY_MEMBER)
    --    return -1
    --end

    -- Trusts cannot be summoned if you have hate
    if caster:hasEnmity() then
        caster:messageSystem(xi.msg.system.TRUST_NO_ENMITY)
        return -1
    end

    -- Check party for trusts
    local num_pt = 0
    local num_player = 0
    local num_trusts = 0
    local party = caster:getPartyWithTrusts()
    for _, member in pairs(party) do
        if member:getObjType() == xi.objType.TRUST then
            -- Check for same trust
            if member:getTrustID() == spell:getID() then
                caster:messageSystem(xi.msg.system.TRUST_ALREADY_CALLED)
                return -1
                -- Check not allowed trust combinations (Shantotto I vs Shantotto II)
            elseif type(not_allowed_trust_ids) == "number" then
                if member:getTrustID() == not_allowed_trust_ids then
                    caster:messageSystem(xi.msg.system.TRUST_ALREADY_CALLED)
                    return -1
                end
            elseif type(not_allowed_trust_ids) == "table" then
                for _, v in pairs(not_allowed_trust_ids) do
                    if type(v) == "number" then
                        if member:getTrustID() == v then
                            caster:messageSystem(xi.msg.system.TRUST_ALREADY_CALLED)
                            return -1
                        end
                    end
                end
            end
            num_trusts = num_trusts + 1
        else
            num_player = num_player + 1
        end

        num_pt = num_pt + 1
    end

    -- Max party size
    if num_pt >= 6 then
        caster:messageSystem(xi.msg.system.TRUST_MAXIMUM_NUMBER)
        return -1
    end

    -- Some battlefields allow trusts after you get this ROV Key Item
    local casterBattlefieldID = caster:getBattlefieldID()
    if rovKIBattlefieldIDs[casterBattlefieldID] and not caster:hasKeyItem(xi.ki.RHAPSODY_IN_UMBER) then
        return xi.msg.basic.TRUST_NO_CAST_TRUST
    end

    -- Limits set by ROV Key Items
    if num_trusts >= num_player then
        caster:messageSystem(xi.msg.system.TRUST_MAXIMUM_NUMBER)
        return -1
    end

    return 0
end)

return m