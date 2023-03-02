function shop_init()
    shopbuttons = {{
        sprite = 142,
        x = 20,
        y = 20,
        h = 2,
        w = 2,
      }}
end
  
function shop_draw()
    map(16, 0, 0, 0,128,128)
    print("shop screen works!")
    draw_shopbuttons()
    
end
  
function draw_shopbuttons()
    for button in all(shopbuttons) do
      spr(button.sprite, button.x, button.y,2,2)
      print(button.sprite,button.x,button.y)
    end
end
  
function update_shopbuttons()
    if collision_aabb(cursor, slibuttons[1]) and cursor.clicking then
      add_slime()
    end
end
  
function shop_update()
    update_shopbuttons()
end
  