function update_slime_action(slime)
    -- update slime action
    slime.action_timeleft -= dt
    if slime.action_timeleft <= 0 then 
        if slime.action == slime_metadata.idle and slime.happiness != 0 then
        slime.action = slime_metadata.moving
        slime.move_angle = rnd(1)
        elseif slime.action == slime_metadata.moving then
        slime.action = slime_metadata.idle
        end
        local wait_time = 5 -- wait 5-10 seconds for each action,
        local min_wait = 5
        slime.action_timeleft = rnd(wait_time) + min_wait     
    end
end