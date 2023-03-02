-- init, draw, update, and input
function _init()
  music(0)
  mode = 0
  poke(0x5F2D, 1) -- necessary for working curor
  cursor = {
    x = 10,
    y = 10,
    w = 1,
    h = 1,
    clicking = false,
  }
  shop_init()
  slimefarm_init()
end

function _draw()
  cls()
  if(mode == 0) then
    slimefarm_draw()
  elseif(mode == 1) then
    shop_draw()
  end

  --Cursor is here since we want it to be at the top
  spr(70, cursor.x, cursor.y)
end

function _update60()
  dt = t() - lastframe
  lastframe = t()
  input() 
  if(mode == 0) then
    slimefarm_update()
  elseif(mode == 1) then
    shop_update()
  end
end


