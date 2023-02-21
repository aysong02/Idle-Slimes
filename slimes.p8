pico-8 cartridge // http://www.pico-8.com
version 39
__lua__
-->8
-- init, draw, update, and input
  function _init() 
    poke(0x5F2D, 1)
    cursor = {
      x = 10,
      y = 10,
      w = 1,
      h = 1,
      clicking = false,
    }
    slimes = {}
    add_slime()
    add_slime()
    add_slime()    
    poops = {}
      poopData = {
        id = 68,
        w = 8,
        h = 8
        }
      poopCount = 0
    plantPoop(70, 90)

      gold = 0
    
    end

  function _draw()
    cls()
    map()
    drawSlime()
    drawPoop()
    draw_ui()
    draw_fence()
  end
  function _update60()
    input() 
    updatePoop()
    move_slimes()
    animate_slimes()

  end

  function draw_ui()
    rectfill(98, 0, 127, 63, 6)
    rectfill(105, 9, 120, 10, 5)
    print("gold", 105, 3, 0)
    print(gold, 105, 12, 0)
    print(cursor.clicking, 0, 115, 8)
    print(cursor.x, 25, 115, 12)
    print(cursor.y, 35, 115, 13)
    --Cursor
    spr(70, cursor.x, cursor.y)
  end
-->8 
-- slime movement
  function update_slimes()
    for slime in all(slimes) do
        slime.x = slime.x + flr(rnd(3) - 1) * slime.speed
        slime.y = slime.y + flr(rnd(3) - 1) * slime.speed

    end
  end

  function add_slime()
    newslime = {
      x = rnd(50)+30,
      y = rnd(50)+30,
      speed = 0.1,
      sprite = 1,
      frame = 1,
      valid = 1,--not sure if we need this
      }
    add(slimes, newslime)
    local slime = slimes[count(slimes)]
  end

  function animate_slimes()
  -- TODO
    for slime in all(slimes) do
      local sprite_offset = slime.sprite
      local frame_time = 0.1
      -- set stage
      local stage = flr(t() / frame_time % 20)
      if stage > 2 then
        stage = 0
      end
      slime.frame = stage + sprite_offset
    end
  end

-- cursor input code
  function input()
      cursor.x = stat(32) - 1
      cursor.y = stat(33) - 1
      cursor.clicking = stat(34) == 1
  end


-->8
-- poop code
  function drawPoop()
  for i=1, #poops do
    if poops[i].valid then 
      spr(poops[i].frame, poops[i].x, poops[i].y)
    end
  end
  end
  function draw_fence()
    spr(128,5,100,2,2)
  end

  function plantPoop(x, y)
    local seed = {
      x = x,
      y = x,
      frame = poopData.id,
      w = poopData.w,
      h = poopData.h,
      valid = true,
    }
    poopCount += 1
    poops[poopCount] = seed
  end

  function updatePoop()
  for i=1, #poops do
    if collision_aabb(cursor, poops[i]) and poops[i].valid == true and cursor.clicking then
      gold += 1
      poops[i].valid = false
    end
  end
  end

-->8
-- slime code
  function drawSlime()
  for i=1, #slimes do
    if slimes[i].valid then 
      spr(slimes[i].frame, slimes[i].x, slimes[i].y)
    end
  end
  end

  function plantSlime(x, y)
    local seed = {
      x = x,
      y = x,
      frame = slimeData.id,
      w = slimeData.w,
      h = slimeData.h,
      valid = true,
    }
    slimeCount += 1
    slimes[slimeCount] = seed
  end

  function updateSlime()
  for i=1, #slimes do
    if collision_aabb(cursor, poops[i]) and slimes[i].valid == true and cursor.clicking then
      test += 1
      slimes[i].valid = false
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
55555555333333333333333344444444000440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
555555553333333333333b3349494444000440000011110000000000000000000000000000000000000000000000000000000000000000000000000000000000
666656663333333333b3b333444449440044440001cccc1000777700000000000000000000000000000000000000000000000000000000000000000000000000
66665666333333333b33333344444444444444441cc7c7c100777000000000000000000000000000000000000000000000000000000000000000000000000000
55555555333333333333b33344944494444444441cc0c0c100777700000000000000000000000000000000000000000000000000000000000000000000000000
6656666633333333333b33b344449444004444001cccccc100707700000000000000000000000000000000000000000000000000000000000000000000000000
665666663333333333b33b33944444440004400001cccc1000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555333333333333333344444494000440000011110000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
4180818081808180818081414747474744414141414141414141414141414141414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a090919091909190919091a14747474744414141414141414141414141414141414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
