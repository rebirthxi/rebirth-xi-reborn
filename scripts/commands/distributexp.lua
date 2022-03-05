---------------------------------------------------------------------------------------------------
-- func: distributexp <set/clear> <jobId> <lvl>
-- desc: Allows players to distribute exp to other jobs as they gain it under specific conditions
---------------------------------------------------------------------------------------------------

require( "scripts/globals/status" )

cmdprops =
{
    permission = 0,
    parameters = "ssi",
}

function error(player, msg)
    player:PrintToPlayer( msg .. "\n" ..
            "!distributexp <set> <jobID> {level to stop distributing at}\n" ..
            "      OR      <clear>\n" ..
            "      OR      <show>", 0x7)
end

function onTrigger(player, option, jobId, level)
    if( option == nil ) then
        error( player,"no option was given")
        return
    elseif (option ~= "clear" and option ~= "set" and option ~= "show") then
        error( player, "invalid option: '" .. option .. "' given.")
        return
    end

    if( option == "clear" ) then
        player:setDistributedExp( 0, 0 )
    elseif( option == "set" ) then
        if( jobId == nil ) then
            error( player,"Must pass a <jobId>\n - Valid IDs: WAR, BLM, THF, etc..." )
            return
        else
            jobId = xi.job[string.upper(jobId)];
            if( jobId == nil or jobId <= 0 or jobId >= xi.MAX_JOB_TYPE ) then
                error( player,"Invalid <tjobId>: '" .. jobId .. "'\n - Valid IDs: WAR, BLM, THF, etc..." )
                return
            end

            if( player:getNumDistributeJobs() >= 3 ) then
                player:PrintToPlayer("No more than 3 jobs can be set!", 0x07)
                return
            end


            if( level == nil or level < 0 or level > 75 ) then
                error( player, "Must enter a job level between 0 and 75.\n" ..
                        "Passing a 0 will disable distributing to that job.")
                return
            end
            player:setDistributedExp( jobId, level )
        end
    end
    player:showDistributedExp()
end