function update_slime_animation(slime)
    -- animation
    if slime.action == slime_metadata.idle then 
        local sprite_offset = slime_metadata.idle_frame_offset
        local frame_time = 0.1 
        local stage = flr((t() + slime.animation_offset) / frame_time % 20)
        if stage >= slime_metadata.idle_frames then
        stage = 0
        end
        slime.frame = stage + sprite_offset
    elseif slime.action == slime_metadata.moving then 
        local sprite_offset = slime_metadata.moving_frame_offset
        local frame_time = 0.1
        local stage = flr((t() + slime.animation_offset) / frame_time % 7)
        if stage >= slime_metadata.moving_frames then
        stage = 0
        end
        slime.frame = stage + sprite_offset
    end
end