-- init, draw, update, and input
function _init()
  music(0)
  mode_type = {
    opening = 0,
    shop = 1,
    slime_farm = 2,
    crops = 3,
    title = 4,
    credit = 5,
  }
  click_type = {
    l_click = 1,
    r_click = 2,
  }
  inventory = {
    {
      sprite = 077,
      name = "trash can",
      desc = "Londuasnugnufnsnjnobagognfoangiodnaiongongkono",
      price = 1,
      bigItem = 1,
      quantity = 1,
      item_type = 5,
    },
  }
  inventory_select_no = 0
  mode = mode_type.title
  poke(0x5F2D, 1) -- necessary for working curor
  cursor = {
    sprite = 8,
    x = 10,
    y = 10,
    w = 4,
    h = 4,
    clicking = false,
    prevClick = false,
  }
  soul = 900
  cursor_sprites = {
    hover = 9,
    normal = 8,
    clicking = 24
  }
  soul = 300
  soul_sprite = 51
  shop_init()
  slimefarm_init()
  opening_init()
  crops_init()
  title_init()
  credit_init()
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
  elseif mode == mode_type.title then
    title_draw()
  elseif mode == mode_type.credit then
    credit_draw()
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
  elseif mode == mode_type.title then
    title_update()
  elseif mode == mode_type.credit then
    credit_update()
  end
  
  slimefarm_update()
  crops_update()
  

end


