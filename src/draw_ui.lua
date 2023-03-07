
function draw_ui()
    rectfill(98, 0, 127, 63, 6)
    rectfill(105, 9, 120, 10, 5)
    print("gold", 105, 3, 0)
    -- spr(80, 105,3,16,16)
    print(gold, 105, 12, 0)
    -- print(slimes[1].happiness, 0, 115, 8)
    -- print(slimes[1].last_poop, 0, 115, 8)
    -- cursor
    spr(70, cursor.x, cursor.y)
end

function create_slibuttons()
    shop_button = {
        sprite = 110,
        x = 112,
        y = 112,
        h = 16,
        w = 16,
    }
    add(slibuttons, shop_button)
end

function draw_slibuttons()
    for button in all(slibuttons) do
        spr(button.sprite, button.x, button.y, button.w, button.h)
    end
end

function update_slibuttons()
    if collision_aabb(cursor, slibuttons[1]) and cursor.clicking then
        mode = mode_type.farm
    end
    
    -- feed slimes
    -- for slime in all(slimes) do
    --     if collision_aabb(cursor, slime) and click_press() then
    --         slime.happiness = 100
    --         break
    --     end
    -- end
    for slime in all(slimes) do
        if collision_aabb(cursor, slime) and click_press() then
            slime.action = slime_metadata.held
            break
        end
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