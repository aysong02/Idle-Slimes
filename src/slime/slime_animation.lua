slime_jump_seq = {1,2,3,4,5,18,17,16}
slime_idle_seq = {1,16,17,18,17,16,1}
function update_slime_animation(slime)
    -- animation
    if slime.action == slime_metadata.idle then 
        local frame_time = 0.05
        local stage = flr((t()+ slime.animation_offset) / frame_time % 40)+1
        if stage >= #slime_idle_seq then
            stage = 1
        end
        slime.frame = slime_idle_seq[stage]
    elseif slime.action == slime_metadata.moving then 
        local frame_time = 0.05
        local stage = flr((t()+ slime.animation_offset) / frame_time % #slime_jump_seq)+1
        if stage >= #slime_jump_seq then
            stage = 1
        end
        slime.frame = slime_jump_seq[stage]
    end

    if slime.happiness == 0 then
        slime.frame = slime_metadata.ded
    end
end