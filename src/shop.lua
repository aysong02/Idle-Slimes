function shop_init()
    shopbuttons = {{
        sprite = 142,
        x = 20,
        y = 20,
        h = 16,
        w = 16,
      }}
end
  
function shop_draw()
    draw_shopbuttons()
    print("shop screen works!")
end
  
function draw_shopbuttons()
    for button in all(shopbuttons) do
      spr(button.sprite, button.x, button.y, button.w, button.h)
    end
    print("add slime")
end
  
function update_shopbuttons()
    if collision_aabb(cursor, slibuttons[1]) and cursor.clicking then
      add_slime()
    end
end
  
function shop_update()
    update_shopbuttons()
end
  