-- Opening Scene Screen
function opening_init()
    opening_text = {
        "this is a test string. it is\nset to check if this is working\nproperly.",
        "done! it seems to be working\nfine now! text boxes are great\nfor adventure and rpg games!"
    }
    reading = false


    tb_init(0, opening_text)
end

function opening_draw()
    tb_draw()
    -- print(opening_text[1],0,0)
    print("gold", 10, 10)
end


function opening_update()
    if reading then -- if tb_init has been called, reading will be true and a text box is being displayed to the player. it is important to do this check here because that way you can easily separete normal game actions to text box inputs.
        tb_update() -- handle the text box on every frame update.   
    else 
        mode = mode_type.slime_farm
    end
end