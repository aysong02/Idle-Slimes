function click_press(type)
    type = type or click_type.l_click
    return cursor.clicking == type and cursor.prevClick == 0
    
end
function click_release(type) 
    type = type or click_type.l_click
    return cursor.clicking == 0 and cursor.prevClick == type
end