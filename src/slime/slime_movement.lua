function update_slime_movement(slime)
    -- movement
    if slime.action == slime_metadata.moving then
        slime.x += slime.speed * cos(slime.move_angle)
        slime.y += slime.speed * sin(slime.move_angle)
    elseif slime.action == slime_metadata.held then
        slime.x = cursor.x
        slime.y = cursor.y
        if click_release() then
            slime.action = slime_metadata.moving
            slime.action_timeleft = 0
        end
    end

    -- out of bounds movement
    local min_x_map, max_x_map = 9,80
    local min_y_map, max_y_map = 23, 100 
    local hit_fence = false
    if slime.x > max_x_map or 
        slime.x < min_x_map or 
        slime.y > max_y_map or 
        slime.y < min_y_map then
        slime.move_angle = rnd(1)
    end

    if slime.x > max_x_map then
        slime.x = max_x_map
    elseif slime.x < min_x_map then
        slime.x = min_x_map
    end
    if slime.y > max_y_map then
        slime.y = max_y_map
    elseif slime.y < min_y_map then
        slime.y = min_y_map
    end
end