-- credit screen
function credit_init()
    credit_btn = {x = 55, y = 90, h=16, w=16}
end

function credit_draw()
    rectfill(0, 0, 128, 128, 13)
    print("credits: \n art:\n  yunjia yu\n music:\n  katie mukai\n sounds:\n  clarissa gutierrez\n story:\n  clarissa gutierrez\n programming:\n  andrew song \n  wesley judy", 16, 10, 8)
    
    -- bottom screen
    -- rectfill(16, 105, 111, 128, 7)
    -- button
    pal(9, 8)
    pal(10, 8)
    spr(96, credit_btn.x, credit_btn.y, 2 , 2)
    spr(141, credit_btn.x + 4, credit_btn.y + 4, 1, 1, false, false)
    pal()
end


function credit_update()
    if collision_aabb(cursor, credit_btn) then
        cursor.sprite = cursor_sprites.hover
        if click_release() then
            mode = mode_type.title
        end
    end
end