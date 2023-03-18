

function create_slibuttons()
    shop_button = {
        sprite = 64,
        x = 112,
        y = 112,
        h = 16,
        w = 16,
    }
    crop_button = {
        sprite = 96,
        x = 96,
        y = 112,
        h = 16,
        w = 16,
        icon_sprite = 166,
    }
    add(slibuttons, shop_button)
    add(slibuttons, crop_button)
end

function draw_slibuttons()
    spr(shop_button.sprite, shop_button.x, shop_button.y, shop_button.w/8, shop_button.h/8)
    spr(crop_button.sprite, crop_button.x, crop_button.y, crop_button.w/8, crop_button.h/8)
    spr(crop_button.icon_sprite, crop_button.x+4, crop_button.y+4,1, 1)
end

function update_slibuttons()
    if collision_aabb(cursor, slibuttons[1]) and click_release() then
        mode = mode_type.shop
        sfx(15)
    end
    if collision_aabb(cursor, slibuttons[2]) and click_release() then
        mode = mode_type.crops
        sfx(15)
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
    -- for i=0,4,1 do
    --     spr(128,8+16*i,9,2,2)
    -- end 
end

function draw_inventory()
    pal(4,5)
    spr(224,96,0,4,2)
    pal()
    print(soul, 96+13, 0+6,0)
    local start_x, start_y = 12 * 8, 2 * 8
    onscreen_inv={}
    -- print(inventory_select_no)
    for i = 0,9,1 do 
        local horizontal_offset = (i % 2) * 16
        local vertical_offset = flr(i / 2) * 16

        pal(15,134,1)
        spr(142, start_x + horizontal_offset , start_y + vertical_offset, 2, 2)

        --Render item
        tempi = inventory[i+1]
        if tempi then
            -- pal(tempi.color)
            --Check if the item is 16 bit or not
            if tempi.bigItem == 1 then
                spr(tempi.sprite, start_x + horizontal_offset,start_y + vertical_offset,2,2)
                --Render seed product if item is a seed
                if tempi.item_type == item_types.seeds then
                    spr(tempi.product.sprite, start_x + horizontal_offset+4, start_y + vertical_offset+5,1,1)
                end
            else
                spr(tempi.sprite, start_x + horizontal_offset+4, start_y + vertical_offset+4,1,1)
            end
            --Print the quanity in inventory
            print(tempi.quantity,start_x +1 + horizontal_offset, start_y + vertical_offset+10,0)
            
        end

        --draw highlight for item select
        if inventory_select_no == i then
            rect(start_x + horizontal_offset,start_y + vertical_offset, start_x + horizontal_offset+15, start_y + vertical_offset+15, 7)
        end
    end
    --Inventory arrows
    spr(96, 6*16 ,12*8 , 2, 2)
    spr(96, 7*16 ,12*8 , 2, 2)
    --debug inv
    -- for item in all(inventory) do
    --     print(item)
    -- end
end

function update_invslots()
    local start_x, start_y = 12 * 8, 2 * 8
    for i = 0,9,1 do 
        local horizontal_offset = (i % 2) * 16
        local vertical_offset = flr(i / 2) * 16
        if collision_aabb(cursor, {x = (start_x + horizontal_offset), y =(start_y + vertical_offset), h=16,w=16}) and click_press() then
            inventory_select_no = i

        end
    end
end

function use_item()
    local temp = inventory[inventory_select_no+1]
    if temp then
        temp.quantity -= 1
        --remove item from inventory if used up
        if(temp.quantity == 0) then
            del(inventory, temp)
        end
    end
end