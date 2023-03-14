

function create_slibuttons()
    shop_button = {
        sprite = 110,
        x = 112,
        y = 112,
        h = 16,
        w = 16,
    }
    crop_button = {
        sprite = 72,
        x = 96,
        y = 112,
        h = 16,
        w = 16,
    }
    add(slibuttons, shop_button)
    add(slibuttons, crop_button)
end

function draw_slibuttons()
    for button in all(slibuttons) do
        spr(button.sprite, button.x, button.y, button.w/8, button.h/8)
    end
end

function update_slibuttons()
    if collision_aabb(cursor, slibuttons[1]) and click_release() then
        mode = mode_type.shop
    end
    if collision_aabb(cursor, slibuttons[2]) and click_release() then
        mode = mode_type.crops
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

function draw_inventory()
    pal(4,5)
    spr(224,96,0,4,2)
    pal()
    print(soul, 96+13, 0+6,0)
    local start_x, start_y = 12 * 8, 2 * 8
    onscreen_inv={}
    for i = 0,9,1 do 
        if inventory_select_no == i then
            -- Note to andrew probably dont use pallete here maybe just use the rect fill
            -- pal(5, 11)
        end
        local horizontal_offset = (i % 2) * 16
        local vertical_offset = flr(i / 2) * 16
        pal(15,134,1)
        spr(142, start_x + horizontal_offset , start_y + vertical_offset, 2, 2)
        -- pal()

        --Render item
        tempi = inventory[i+1]
        if tempi then
            -- pal(tempi.color)
            --Check if the item is 16 bit or not
            if tempi.bigItem == 1 then
                spr(tempi.sprite, start_x + horizontal_offset,start_y + vertical_offset,2,2)
            else
                spr(tempi.sprite, start_x + horizontal_offset+5, start_y + horizontal_offset+4,1,1)
            end
            print(tempi.quanity,start_x + horizontal_offset+5, start_y + horizontal_offset+4,0)
            pal()
        end
    end
    --Inventory arrows
    spr(68, 6*16 ,12*8 , 2, 2)
    spr(68, 7*16 ,12*8 , 2, 2,1)

    --debug inv
    -- for item in all(inventory) do
    --     print(item)
    -- end
end