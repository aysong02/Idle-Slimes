function input()
    cursor.x = stat(32) - 1
    cursor.y = stat(33) - 1
    cursor.prevClick = cursor.clicking
    cursor.clicking = stat(34)
    cursor.sprite = cursor_sprites.normal
    if mode == mode_type.slime_farm then 
        update_slibuttons()
        update_invslots()
    elseif mode == mode_type.crops then
        update_cropsbuttons()
        check_plant_seed()
        update_invslots()
    elseif mode == mode_type.shop then 
        shop_update()
    end
    
    if cursor.sprite == cursor_sprites.hover and cursor.clicking != 0 then
        cursor.sprite = cursor_sprites.clicking
    end
end