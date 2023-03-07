function click_press() 
    return cursor.clicking == true and cursor.prevClick == false
end
function click_release() 
    return cursor.clicking == false and cursor.prevClick
end