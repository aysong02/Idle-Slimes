
function slimefarm_init()
    slimes = {}
    slibuttons = {}
    create_slibuttons()

    slimes = {}
    slime_metadata = {
        idle_frame_offset = 16,
        idle_frames = 3,
        moving_frame_offset = 1,
        moving_frames = 3,
        idle = 0,
        moving = 1,
    }
    hunger_metadata = {
      happy_emote_frame = 22,
      almost_unhappy_frame = 24,
      unhappy_emote_frame = 25,
    }
    add_slime()

    poops = {}
    poopData = {
        id = 32,
        w = 8,
        h = 8,
        }
    initailize_poop()

    gold = 0
    dt = 0
    lastframe = t()
    gold = 0
end

function slimefarm_draw()
    map()
    draw_poop()
    drawSlime()
    draw_ui()
    draw_fence()
    draw_slibuttons()
end

function slimefarm_update()
    update_slimes()
    update_slibuttons()
    update_poop()
end

function update_slimes()
    for slime in all(slimes) do
        -- movement
        if slime.action == slime_metadata.moving then
          slime.x += slime.speed * cos(slime.move_angle)
          slime.y += slime.speed * sin(slime.move_angle)

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

        -- update slime action
        slime.action_timeleft -= dt
        if slime.action_timeleft <= 0 then 
          if slime.action == slime_metadata.idle then
            slime.action = slime_metadata.moving
            slime.move_angle = rnd(1)
          else 
            slime.action = slime_metadata.idle
          end
          local wait_time = 5 -- wait 5-10 seconds for each action,
          local min_wait = 5
          slime.action_timeleft = rnd(wait_time) + min_wait     
        end

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

        -- pooping
        slime.last_poop += dt
        if slime.last_poop >= 7 then
          plant_poop(slime.x, slime.y)
          slime.last_poop = 0
        end

        if slime.happiness > 0 then
          slime.happiness -= 1/10
        end
          
    end
end

function add_slime()
    newslime = {
      x = rnd(50)+30,
      y = rnd(50)+30,
      speed = 0.1,
      frame = 1,
      last_poop = 0,
      action = slime_metadata.idle,
      move_angle = 0, -- 0 to 1 for movement angle if moving
      action_timeleft = 6,
      animation_offset = flr(rnd(20)),
      happiness = 100,
      valid = 1,--not sure if we need this
      }
    add(slimes, newslime)
    local slime = slimes[count(slimes)]
end
  
function drawSlime()
    for i=1, #slimes do
      if slimes[i].valid then 
        spr(slimes[i].frame, slimes[i].x, slimes[i].y)
        
        local emote_frame = -1
        if slimes[i].happiness > 50 then
          emote_frame = hunger_metadata.happy_emote_frame
        elseif slimes[i].happiness > 1 then
          emote_frame = hunger_metadata.almost_unhappy_frame
        else 
          emote_frame = hunger_metadata.unhappy_emote_frame
        end
        spr(26, slimes[i].x + 5, slimes[i].y - 10, 2, 2)
        spr(emote_frame, slimes[i].x + 10, slimes[i].y - 9)
      end
    end
end