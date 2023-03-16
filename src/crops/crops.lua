function crops_init()
    cropsbuttons ={
        {
            sprite = 110,
            x = 112,
            y = 112,
            h = 16,
            w = 16,
        },
        {
            sprite = 70,
            x = 96,
            y = 112,
            h = 16,
            w = 16,
        }
    }
    cropsfield = {}
    next_field_loc = {x = 16, y = 16}
end
function crops_draw()
    map(32, 0, 0, 0,128,128)
    draw_inventory()
    draw_cropsbuttons()
    draw_fields()
end
function crops_update()
    update_cropsbuttons()
    check_plant_seed()
    update_plants()
end

function update_cropsbuttons()
    if collision_aabb(cursor, cropsbuttons[1]) and click_release() then
        mode = mode_type.shop
        sfx(15)
    end
    if collision_aabb(cursor, cropsbuttons[2]) and click_release() then
        mode = mode_type.slime_farm
        sfx(15)
    end
end
function draw_cropsbuttons()
    for button in all(cropsbuttons) do
        spr(button.sprite, button.x, button.y, button.w/8, button.h/8)
    end
end

function add_field()
    newfield={
        sprite = 170, 
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
    if next_field_loc.x > 64 then
        next_field_loc.x = 16
        next_field_loc.y += 16  
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
                if(click_press(click_type.r_click) and collision_aabb(cursor, plot)) then
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

function update_plants()
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
        if plot.stage == #plot.plant_spr_data then
            if click_press() and collision_aabb(cursor, plot) then
                add_to_inv(plot.product)
                plot.stage = 0
            end
        end
    end

end