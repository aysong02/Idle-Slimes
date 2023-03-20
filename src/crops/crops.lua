function crops_init()
    shop_button = {
        sprite = 64,
        x = 112,
        y = 112,
        h = 16,
        w = 16,
        
    }
    slime_button = {
        sprite = 96,
        x = 96,
        y = 112,
        h = 16,
        w = 16,
        icon_sprite = 1,
    }
    cropsfield = {}
    next_field_loc = {x = 8, y = 24}
end

function crops_draw()
    map(32, 0, 0, 0,128,128)
    draw_inventory()
    draw_cropsbuttons()
    draw_fields()
end

function crops_update()
    for plot in all(cropsfield) do
        if plot.stage != 0 then
            local frame_time = 1
            local stage = flr((t()- plot.planttime) / frame_time)+1--added since stage cannot be 0
            if stage >= #plot.plant_spr_data then
                stage = #plot.plant_spr_data
            end
            plot.stage = stage
        end

        --If crop is at the end of its life cycle harvest
        if plot.stage == #plot.plant_spr_data and plot.stage!= 0 then
            if click_press() and collision_aabb(cursor, plot) then
                add_to_inv(plot.product)
                plot.stage = 0
            end
        end
    end
end

function update_cropsbuttons()
    if collision_aabb(cursor, shop_button) or collision_aabb(cursor, slime_button) then
        cursor.sprite = cursor_sprites.hover
    end
    if collision_aabb(cursor, shop_button) and click_release() then
        mode = mode_type.shop
        sfx(15)
    end
    if collision_aabb(cursor, slime_button) and click_release() then
        mode = mode_type.slime_farm
        sfx(15)
    end
end
function draw_cropsbuttons()
    spr(shop_button.sprite, shop_button.x, shop_button.y, shop_button.w/8, shop_button.h/8)
    spr(slime_button.sprite, slime_button.x, slime_button.y, slime_button.w/8, slime_button.h/8)
    spr(slime_button.icon_sprite, slime_button.x+4, slime_button.y+4,1, 1)

end

function add_field()
    newfield={
        sprite = 174, 
        x = next_field_loc.x,
        y = next_field_loc.y,
        h = 16,
        w = 16,

        --Plant data
        stage = 0,
        plant_spr_data={},
        produce={},
    }
    add(cropsfield,newfield)

    --Update next field location
    next_field_loc.x+=16
    if next_field_loc.x > 80 then
        next_field_loc.x = 8
        next_field_loc.y += 20  
    end
end

function draw_fields()
    for plot in all(cropsfield) do
        spr(plot.sprite,plot.x,plot.y,2,2)
        if plot.stage > 0 then
            --check height of plant
            if #plot.plant_spr_data[plot.stage] == 1 then
                spr(plot.plant_spr_data[plot.stage][1],plot.x+4,plot.y+6,1,1)
            --If it isnt height of 1     
            else
                spr(plot.plant_spr_data[plot.stage][1],plot.x+4,plot.y+6,1,1)
                spr(plot.plant_spr_data[plot.stage][2],plot.x+4,plot.y-2,1,1)
            end
        end
    end
end

--Checks if you want to plant a seed
function check_plant_seed()
    local tempitem = inventory[inventory_select_no+1]
    -- check if an item even exists
    if(tempitem) then
        -- check if its a seed
        if(tempitem.item_type == item_types.seeds) then
            -- check every plot to see which one is clicked
            for plot in all(cropsfield) do
                if(click_press(click_type.r_click) and collision_aabb(cursor, plot))  and plot.stage == 0 then
                    plot.stage = 1
                    plot.plant_spr_data = tempitem.plant_spr_data
                    plot.planttime = t()
                    plot.product = tempitem.product
                    use_item()
                end
            end
        end
    end  
end
