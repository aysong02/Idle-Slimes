-- title screen
function title_init()
    -- TODO save data
    cartdata("slimes")

end

function title_draw()
    rectfill(0, 0, 128, 128, 5)
    spr(66, 16, 0, 12, 4) 
    print("credits: \n art:\n  yunjia yu\n music:\n  katie mukai\n sounds:\n  clarissa gutierrez\n story:\n  clarissa gutierrez\n programming:\n  andrew song \n  wesley judy", 16, 33, 8)
    
    -- bottom screen
    -- rectfill(16, 105, 111, 128, 7)
    -- button
    pal(9, 8)
    pal(10, 8)
    spr(96, 55, 105, 2 , 2)
    spr(141, 59, 109, 1, 1, true, false)
    pal()
end


function title_update()
    local btn = {x = 55, y = 105, h=16,w=16}
    if collision_aabb(cursor, btn) then
        cursor.sprite = cursor_sprites.hover
        if click_release() then
            mode = mode_type.opening
        end
    end
end