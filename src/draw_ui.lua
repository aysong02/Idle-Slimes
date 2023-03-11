
function draw_ui()

    pal(4,5)
    spr(224,96,0,4,2)
    pal()
    print(gold, 96+13, 0+6,0)
    local start_x, start_y = 12 * 8, 2 * 8
    for i = 0,9,1 do 
        if inventory_select_no == i then
            pal(5, 11)
        end
        local horizontal_offset = (i % 2) * 16
        local vertical_offset = flr(i / 2) * 16
        pal(15,134,1)
        spr(142, start_x + horizontal_offset , start_y + vertical_offset, 2, 2)
        pal()
    end
   
    -- debug prints
    -- print(cursor.clicking, 0, 115, 8)
    -- if #slimes >0 then
    --     print(slimes[1].happiness, 0, 115, 8)
    -- end
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
    if collision_aabb(cursor, slibuttons[1]) and click_release() then
        mode = mode_type.shop
    end
    
    -- feed slimes
    for slime in all(slimes) do
        if collision_aabb(cursor, slime) and click_press() then
            slime.happiness = 100
            break
        end
    end
    -- drag slimes
    for slime in all(slimes) do
        if collision_aabb(cursor, slime) and click_press(click_type.r_click) then
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