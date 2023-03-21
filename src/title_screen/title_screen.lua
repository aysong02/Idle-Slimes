-- title screen
function title_init()
    -- TODO save data
    cartdata("slimes")
    title_btn1 = {x = 43, y = 70, h=16, w=16}
    title_btn2 = {x = 67, y = 70, h=16, w=16}
end

function title_draw()
    rectfill(0, 0, 128, 128, 13)
    spr(66, 16, 31, 11, 4) 
    
    -- bottom screen
    -- rectfill(16, 105, 111, 128, 7)
    -- button
    pal(9, 8)
    pal(10, 8)
    spr(96, title_btn1.x, title_btn1.y, 2 , 2)
    spr(141, title_btn1.x + 4, title_btn1.y + 4, 1, 1, true, false)
    spr(96, title_btn2.x, title_btn2.y, 2 , 2)
    pal()
    -- draw the "i"
    rectfill(title_btn2.x + 3, title_btn2.y + 4, title_btn2.x + 12, title_btn2.y + 4, 8)
    rectfill(title_btn2.x + 7, title_btn2.y + 4, title_btn2.x + 8, title_btn2.y + 11, 8)
    rectfill(title_btn2.x + 3, title_btn2.y + 11, title_btn2.x + 12, title_btn2.y + 11, 8)
    
    -- draw slime
    -- slime_jump_seq = {1,2,3,4,5,18,17,16}
    local slime_frame = slime_jump_seq[flr(t() / 0.1 % #slime_jump_seq) + 1]
    spr(slime_frame, 59, 100)
    spr(slime_frame, 50, 100)
    spr(slime_frame, 68, 100)
end


function title_update()
    if collision_aabb(cursor, title_btn1) then
        cursor.sprite = cursor_sprites.hover
        if click_release() then
            sfx(15)
            mode = mode_type.opening
        end
    end
    if collision_aabb(cursor, title_btn2) then
        cursor.sprite = cursor_sprites.hover
        if click_release() then
            sfx(15)
            mode = mode_type.credit
        end
    end
end