-- init, draw, update, and input
function _init()
  music(0)
  mode_type = {
    opening = 0,
    shop = 1,
    slime_farm = 2,
    crops = 3,
  }
  click_type = {
    l_click = 1,
    r_click = 2,
  }
  inventory = {

  }
  mode = mode_type.opening
  poke(0x5F2D, 1) -- necessary for working curor
  cursor = {
    sprite = 64,
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
  crops_init()
end

function _draw()
  cls()
  if mode == mode_type.opening then
    opening_draw()
  elseif mode == mode_type.shop then
    shop_draw()
  elseif mode == mode_type.slime_farm then
    slimefarm_draw()
  elseif mode == mode_type.crops then
    crops_draw()
  end
  -- Cursor is here since we want it to be at the top
  spr(cursor.sprite, cursor.x, cursor.y)
  -- debug prints
  print(cursor.x, cursor.x, cursor.y + 8, 12)
  print(cursor.y, cursor.x, cursor.y + 13, 13)
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
  elseif mode == mode_type.crops then
    crops_update()
  end
end


