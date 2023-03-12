
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
        held = 2,
        ded = 17,
    }
    hunger_metadata = {
      happy_emote_frame = 22,
      almost_unhappy_frame = 24,
      unhappy_emote_frame = 25,
    }
    poops = {}
    poopData = {
        id = 32,
        w = 8,
        h = 8,
    }
    initailize_poop()
    inventory_select_no = 0
    dt = 0
    lastframe = t()
    soul = 100
end

function slimefarm_draw()
    map()
    draw_poop()
    drawSlime()
    draw_fence()
    draw_slibuttons()
    draw_inventory()
end

function slimefarm_update()
    update_slibuttons()
    update_slimes()
    update_poop()
end

function update_slimes()
    for slime in all(slimes) do
        update_slime_movement(slime)
        update_slime_action(slime)
        update_slime_animation(slime)

        -- pooping
        if slime.happiness != 0 then
          slime.last_poop += dt
        end
        if slime.last_poop >= 7 then
          plant_poop(slime.x, slime.y,slime.color)
          slime.last_poop = 0
        end

        -- happiness
        local happiness_decay = 50 --happiness lost per minute
        if slime.happiness > 0 then
          slime.happiness -= happiness_decay / 3600
        else 
          slime.happiness = 0
        end
    end
end

function add_slime(ncolor)
    newslime = {
      x = rnd(50)+30,
      y = rnd(50)+30,
      w = 8,
      h = 8,
      speed = 0.1,
      frame = 1,
      last_poop = 0,
      action = slime_metadata.idle,
      move_angle = 0, -- 0 to 1 for movement angle if moving
      action_timeleft = 6,
      animation_offset = flr(rnd(20)),
      happiness = 100,
      valid = 1,--not sure if we need this
      color = ncolor,
      }
    add(slimes, newslime)
    local slime = slimes[count(slimes)]
end
  
function drawSlime()
    for i=1, #slimes do
      if slimes[i].valid then
        pal()
        pal(slimes[i].color)
        spr(slimes[i].frame, slimes[i].x, slimes[i].y)
        pal()
        local emote_frame = -1
        if slimes[i].happiness > 50 then
          emote_frame = hunger_metadata.happy_emote_frame
        elseif slimes[i].happiness > 1 then
          emote_frame = hunger_metadata.almost_unhappy_frame
        else 
          emote_frame = hunger_metadata.unhappy_emote_frame
        end
        local speech_waittime = 10
        local speech_duration = 3
        if flr(t()) % speech_waittime < speech_duration or slimes[i].happiness == 0 then 
          spr(26, slimes[i].x + 5, slimes[i].y - 10, 2, 2)
          spr(emote_frame, slimes[i].x + 10, slimes[i].y - 9)
        end
        pal()
      end
    end
end