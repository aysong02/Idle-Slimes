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

function create_slibuttons()
    shop_button = {
        sprite = 142,
        x = 96,
        y = 112,
        h = 16,
        w = 16,
    }
    add( slibuttons, shop_button)
end

function draw_slibuttons()
    for button in all(slibuttons) do
        spr(button.sprite, button.x, button.y, button.w, button.h)
    end
    print("shop", 99, 115, 1)
end

function update_slibuttons()
    if collision_aabb(cursor, slibuttons[1]) and cursor.clicking then
        mode = 1
    end
end

function draw_fence()
    for i=0,4,1 do
        spr(128,8+16*i,98,2,2)
    end
    for i=0,4,1 do
        spr(128,8+16*i,9,2,2)
    end 
end