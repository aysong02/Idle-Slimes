-- init, draw, update, and input
function _init()
  music(0)

  mode_type = {
    opening = 0,
    shop = 1,
    slime_farm = 2,
  }
  mode = mode_type.shop
  poke(0x5F2D, 1) -- necessary for working curor
  cursor = {
    x = 10,
    y = 10,
    w = 1,
    h = 1,
    clicking = false,
    prevClick = false,
  }
  shop_init()
  slimefarm_init()
  opening_init()
end

function _draw()
  cls()
  if mode == mode_type.opening then
    opening_draw()
  elseif mode == mode_type.shop then
    shop_draw()
  elseif mode == mode_type.slime_farm then
    slimefarm_draw()
  end
  --Cursor is here since we want it to be at the top
  spr(72, cursor.x, cursor.y)
  print(cursor.x, 25, 115, 12)
  print(cursor.y, 35, 115, 13)
end

function _update60()
  dt = t() - lastframe
  lastframe = t()
  input() 
  if mode == mode_type.opening then
    opening_update()
  elseif mode == mode_type.shop then
    shop_update()
  elseif mode == mode_type.slime_farm then
    slimefarm_update()
  end
end


