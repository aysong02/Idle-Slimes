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
end

function update_cropsbuttons()
    if collision_aabb(cursor, cropsbuttons[1]) and click_release() then
        mode = mode_type.shop
    end
    if collision_aabb(cursor, cropsbuttons[2]) and click_release() then
        mode = mode_type.slime_farm
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
        w = 16
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
    for field in all(cropsfield) do
        spr(field.sprite,field.x,field.y,2,2)
    end
end

--Checks if you want to plant a seed
function check_plant_seed()
    -- check if an item even exists
    if(inventory[inventory_select_no+1]) then
        -- check if its a seed
        if(inventory[inventory_select_no+1].item_type == item_types.seeds) then
            -- check every plot to see which one is clicked
            for plot in all(cropsfield) do
                if(click_press(click_type.r_click) and collision_aabb(cursor, plot)) then
                    plot.sprite = 134
                end
                -- plot.sprite = 134
            end
        end
    end  
end