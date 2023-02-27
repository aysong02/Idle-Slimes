pico-8 cartridge // http://www.pico-8.com
version 39
__lua__
-->8
-- init, draw, update, and input
  function _init() 
    music(0)
    poke(0x5F2D, 1) -- necessary for working curor
    cursor = {
      x = 10,
      y = 10,
      w = 1,
      h = 1,
      clicking = false,
    }
    
    slimes = {}
    slime_metadata = {
      idle_frame_offset = 1,
      idle_frames = 3,
      moving_frame_offset = 16,
      moving_frames = 3,
      idle = 0,
      moving = 1,
    }
    add_slime()
    add_slime()
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

  function _draw()
    cls()
    map()
    draw_poop()
    drawSlime()
    draw_ui()
    draw_fence()
  end
  
  function _update60()
    dt = t() - lastframe
    lastframe = t()
    input() 
    update_poop()
    update_slimes()

  end

  function draw_ui()
    rectfill(98, 0, 127, 63, 6)
    rectfill(105, 9, 120, 10, 5)
    print("gold", 105, 3, 0)
    -- spr(80, 105,3,16,16)
    print(gold, 105, 12, 0)
    print(slimes[1].last_poop, 0, 115, 8)
    print(cursor.x, 25, 115, 12)
    print(cursor.y, 35, 115, 13)
    -- cursor
    spr(70, cursor.x, cursor.y)
  end

    function draw_fence()
    for i=0,4,1 do
      spr(128,8+16*i,98,2,2)
    end
    for i=0,4,1 do
      spr(128,8+16*i,9,2,2)
    end 
  end

-->8
-- slime code
  function update_slimes()
    for slime in all(slimes) do
        -- movement
        if slime.action == slime_metadata.idle then
          slime.action_timeleft -= dt
        elseif slime.action == slime_metadata.moving then
          slime.action_timeleft -= dt
          slime.x += slime.speed * cos(slime.move_angle)
          slime.y += slime.speed * sin(slime.move_angle)

          local min_x_map, max_x_map = 9,80
          local min_y_map, max_y_map = 23, 180 
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
      valid = 1,--not sure if we need this
      }
    add(slimes, newslime)
    local slime = slimes[count(slimes)]
  end
  
  function drawSlime()
    for i=1, #slimes do
      if slimes[i].valid then 
        spr(slimes[i].frame, slimes[i].x, slimes[i].y)
      end
    end
  end
-->8
-- cursor input code
  function input()
      cursor.x = stat(32) - 1
      cursor.y = stat(33) - 1
      cursor.clicking = stat(34) == 1
  end


-->8
-- poop code
  function draw_poop()
  for i=1, #poops do
    if poops[i].valid then 
      spr(poops[i].frame, poops[i].x, poops[i].y)
    end
  end
  end
  function initailize_poop()
    for i=1, 10, 1 do
      local seed = {
        x = 10,
        y = 10,
        frame = poopData.id,
        w = poopData.w,
        h = poopData.h,
        valid = false,
        }
        poops[i] = seed
    end
  end
  function plant_poop(x, y)
    local seed = {
      x = x,
      y = x,
      frame = poopData.id,
      w = poopData.w,
      h = poopData.h,
      valid = true,
    }
   
    for i=1, #poops do
      if poops[i].valid == false then
        poops[i] = seed
        poops[i].x = x
        poops[i].y = y
        break
      end
    end
  end

  function update_poop()
  for i=1, #poops do
    if collision_aabb(cursor, poops[i]) and poops[i].valid == true and cursor.clicking then
      gold += 1
      poops[i].valid = false
    end
  end
  end


-->8
--collision detection
  function collision_aabb(a, b)
    local a_right_b = a.x > b.x+b.w
    local a_left_b = a.x+a.w < b.x
    local a_above_b = a.y+a.h < b.y
    local a_below_b = a.y > b.y+b.h
    
    return not(a_right_b or 
      a_left_b or 
      a_above_b or 
      a_below_b)
  end

__gfx__
000000000000000000bb770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070700000000000
00000000000000000bbbbb7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070707000000000
007007000bbbb7700bbabab0000000000cccc770088887700aaaa770089abc10000000000899aab00abbcc100c11228000000000000000000070707000707070
00077000bbbbbbb70bbbbbb000000000ccccccc788888887aaaaaaa789abc12800000000899aabbcabbcc112c112288900000000000000000077777000777770
00077000bbbabbab0bbbbbb00bbbb770cc1d11dc88898898aaa9aa9a9ab712790000000099a7bb7cbbc711721127887900000000000000006077777007777770
00700700bbbbbbbb033bbbb0bbbbbbb7c111111c88888888aaaaaaaaabc1289a000000009aabbcc1bcc112281228899a00000000000000006677777007777770
0000000033bbbbbb0033330033babbabc111111c2288888844aaaaaa221289ab0000000055bbcc1155112288558899aa00000000000000000666777000777770
000000000333333000000000333333330cccccc00222222004444440022222200000000005555550055555500555555000000000000000000006660000077700
00000000000000000000000000000000000000000000000000a00a0000a00a000000000000000000000007777777700000000000000000000067770000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000077777777770000000000000000000067770000000000
000000000000000000000000000000000000000000000000a0aaaa0aa0aaaa0a0000000000666000000777777777777000000000000000000067770000000000
0bbbb770000000000000000000000000000000000000000000aaaa0000666a000066600006666660007777777777777700000000000000000067770000000000
bbbbbbb70bbbb7700000000000000000000000000000000000aaaa00066666600666666065555566007777777777777700000000000000006677777700000000
bbbabbabbbbbbbb70bbb7770000000000000000000000000a0aaaa0a655555666555556655c55c56007777777777777700000000000000000677777000000000
33bbbbbb33babbab33babbab0000000000000000000000000000000055555556555555565c51c515007777777777777700000000000000000067770000000000
03333330333333333333333300000000000000000000000000a00a00065556600655566000100100000777777777777000000000000000000006700000000000
07070070070007000000000000000000000000000000000000000000000000000000000000000000000077777777770000000000000000000000000000000000
737377b773707370050500d005000500000000000000000000000000000000000000000000000000000007777777700000000000000000000000000000000000
7b3733377bb77b770d5055500dd00d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
7777bb70073bb3b70000dd00005dd5d0000000000000000000000000000000000000000000000000007700000000000000000000000000000000000000000000
073b7700073b3b37005d0000005d5d50000000000000000000000000000000000000000000000000007700000000000000000000000000000000000000000000
0073377073b377700005500005d50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077b370737337000000d5000505500000000000000000000000000000000000000000000000000700000000000000000000000000000000000000000000000
00000770007077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00007000000707000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077700000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00007000000707000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555333333333333333344444444000440000000000077770000000000000000000000000000000000000000000000000000000000000000000000000000
555555553333333333333b3349494444000440000011110077700000000000000000000000000000000000000000000000000000000000000000000000000000
666656663333333333b3b333444449440044440001cccc1077770000000000000000000000000000000000000000000000000000000000000000000000000000
66665666333333333b33333344444444444444441cc7c7c170770000000000000000000000000000000000000000000000000000000000000000000000000000
55555555333333333333b33344944494444444441cc0c0c100000000000000000000000000000000000000000000000000000000000000000000000000000000
6656666633333333333b33b344449444004444001cccccc100000000000000000000000000000000000000000000000000000000000000000000000000000000
665666663333333333b33b33944444440004400001cccc1000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555333333333333333344444494000440000011110000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000500600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00005006505000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00005065050600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00060566555650000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000666665050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0060566dd66500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
006056dddd6505000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000056dddd6505000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000566dd66500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000566665000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000055550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000033333333333333333333b3333333333300000000000000000003303300000000000dd000000000005555555555555555
00000000000000000000000000000000333333b3333b3333333b3333333333b300000000000bbb00000333300000000000deed00000000005666666666666665
0000000000000000000000000000000033b3333b3333b333333b333333333b330000000000bbb0000333b000000000000deeeed3000000005666666666666665
00000000000000000000000000000000333b3333b3333b3333bb33333b333b330b0000b0000bb000330bb0330000000000deed30000000005666666666666665
009900099000990000000000000000003333b3333333333333333333b333bb330bbbbbb0000bbb00000b333000000000033dd000000000005666666666666665
0049000490004900000000000000000033333333333333333333b333b3333333000bb00000bbb0000333b30000033033330bb033000000005666666666666665
004900049000490000000000000000003b33333b333b3333333b333bb333333300000000000bb000330bb00000033330000b3330000000005666666666666665
9949999499994999000000000000000033b33333b333b333333b3333333333b30000000000000000000bb0000333b0000333b000000000005666666666666665
44444444444444440000000000000000333b33333b333b3333bb333333333b33000000000000000000000000330bb03300000000000000005666666666666665
004900049000490000000000000000003333333333333333333333333b333b33000000000000000000000000000b333000000000000000005666666666666665
004900049000490000000000000000003b33333b3333333333333333b333bb330000000000000000000000000333b30000000000000000005666666666666665
0049000490004900000000000000000033b33333b33b33333333b333b3333333000000000000000000000000330bb00000000000000000005666666666666665
99499994999949990000000000000000333b33333b33b333333b333bb33333b3000000000000000000000000000bb00000000000000000005666666666666665
4444444444444444000000000000000033333b3333333b33333b333333333b330000000000000000000000000000000000000000000000005666666666666665
00490004900049000000000000000000333333b33333333333bb333333333b330000000000000000000000000000000000000000000000005666666666666665
004900049000490000000000000000003333333b33333333333333333333bb330000000000000000000000000000000000000000000000005555555555555555
33333399993333330000000000000000000000000000000000000000000000004444444444444444444444444444444400000000000000000000000000000000
33333349493333330000000000000000000000000000000000000000000000004444444444444444444444444444444400000000000000000000000000000000
3333339999333333000000000000000000000000000000000000000000000000449999999999994444444aaaaaa4444400000000000000000000000000000000
333333494933333300000000000000000000000000000000000000000000000044999999999999444444a99999aa444400000000000000000000000000000000
33333399993333330000000000000000000000000000000000000000000000004499999999999944444a9999999aa44400000000000000000000000000000000
33333349493333330000000000000000000000000000000000000000000000004499999999999944449999999999aa4400000000000000000000000000000000
333333999933333300000000000000000000000000000000000000000000000044999999999999444499999999999a4400000000000000000000000000000000
33333349493333330000000000000000000000000000000000000000000000004499bb9999bb99444499999999999a4400000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000044999bbbbbb999444499999999999a4400000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000004499999bb99999444499999999999a4400000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000044999999999999444499999999999a4400000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000004499999999999944444999999999944400000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000004499999999999944444499999999444400000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000004499999999999944444449999994444400000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000004444444444444444444444444444444400000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000004444444444444444444444444444444400000000000000000000000000000000
__gff__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
4141414141414141414141414747474744444141414141414141414141414141414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4141414141414141414141414747474744414141414141414141414141414141414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a041414141414141414141a14747474744414141414141414141414141414141414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a086878687868786878687a14747474744414041414141414141414141414141414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a096979697969796979697a14747474744414141414141414141414141414141414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a086878687868786878687a14747474744414141404141414141414141414141414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a096979697969796979697a14747474744414141414141414141414141414141414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a086878687868786878687a14747474744414140414141414141414141414141414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a041979697969796979697a14747474744414141414141414141414141414141414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a086878687868786878687a14747474744414141414141414141414141414141414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a096979697969796979697a14747474744414141414141414141414141414141414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a086878687868786878687a14747474744414141414141414141414141414141414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a086878687868786878687a14747474744414141414141414141414141414141414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a096979697969796979697a14747474744414141414141414141414141414141414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4141414141414141414141414747474744414141414141414141414141414141414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4141414141414141414141414747474744414141414141414141414141414141414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4444444444444444444444444444444444444141414141414141414141414141414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4141414141414141414141414141414141414141414141414141414141414141414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4141414141414141414141414141414141414141414141414141414141414141414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4141414141414141414141414141414141414141414141414141414141414141414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4141414141414141414141414141414141414141414141414141414141414141414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4141414141414141414141414141414141414141414141414141414141414141414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4141414141414141414141414141414141414141414141414141414141414141414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4141414141414141414141414141414141414141414141414141414141414141414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4141414141414141414141414141414141414141414141414141414141414141414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4141414141414141414141414141414141414141414141414141414141414141414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
0109000025344253012b3442b3012c3442c30133344333012b3242b30133324333012b3142b301333143330100000000000000000000000000000000000000000000000000000000000000000000000000000000
0109000027344273012c3442c3012e3442e30137344373012e3242e30137324373012e3142e301373143730100000000000000000000000000000000000000000000000000000000000000000000000000000000
0109000031465000000000031435000000000031415000002e46500000000002e42531465000002e4253146500000000003142500000000003141500000000002b4342b4302c4442c44031454314503346433460
01090000354650000000000354350000000000354150000033465000000000033425354650000033425354650000000000354250000000000354150000000000294142b4002b4242b4002c4342c4322c4322c432
010900002e46500000000002e43500000000002e415000002c46500000000002c4252e465000002c4252e46500000000002e42500000000002e4150000000000000000000000000000002b4342c4442e45433464
0109000031465000000000031435000000000031415000002e46500000000002e4252b465000002e4252b46500000000002b42500000000002b4150000000000000000000000000000002b4002c4002e40033400
010900002e46500000000002e43500000000002e415000002c46500000000002c4252e465000002c4252e46500000000002e42500000000002e4150000000000000000000000000000002b4002c4002e40033400
01090000254340000027444000002b454000002c464000002e434000002b444000002c454000002e4640000033434000002e44400000334540000035464000003743437430374303743037432374323743037430
010900002c0750000000000274000c0752b400270752c4002b0752e400000002b4002c0752c400000002e4000c07527000270752e4002c075334002b0702b0752207537400374003740037400250002507527075
010900002c0750000000000274000d0752b400270752c4002b0752e400000002b4002c0752c400000002e4000d0700d075270752e4002c0702c0752b0702b0752207022075270753740020070200752207527000
010900002b0750000000000274000f0752b400270752c400290752e400000002b4002b0752c400000002e4000f07527000270752e4002c075334002b0702b0752207537400374003740037400250002507527075
010900002b0750000000000274000f0752b400270752c400290752e400000002b4002b0752c400000002e4000f07527000270752e4002c075334002b0702b0752207022070220722207222001250002500027000
030900003064300600006000c60024623246012461530600246232460124615306003064300600006000060024623246012461530600246232460124615306001863318611186010060000615066150c62512625
030900002464300600006000c60030623246012461530600246232460130615306003064300600006000060030623246012461530600246232460130615306001863318611186010060000615066150c62512625
030900002464300600006000c60030623246012461530600246232460130615306003064300600006000060030623246012461530600246232460130615306001863318621186111860100600066000c60012600
__music__
01 0002080c
00 0003090d
00 01040a0c
00 01050a0d
00 0002080c
00 0003090d
00 01060a0c
02 01070b0e

