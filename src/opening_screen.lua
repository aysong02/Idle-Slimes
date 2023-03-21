-- Opening Scene Screen
function opening_init()
    opening_text = {
        "talking to yourself:\nthe first thing i do when i \nwake up is water my plants",
        -- "talking to yourself:\nluckily i just harvested my\ncrop so theres no need for it",
        -- "talking to yourself:\ni do miss my slimes that\nran off",
        -- "talking to yourself:\nhopefully they were okay in \nthe rain",
        -- "talking to yourself:\ni have grown to care a lot \nabout my slimes.",
        -- "talking to yourself:\nto be honest i don't even know \nif they acknowledge me",
        -- "talking to yourself:\nwell theres no use in crying \nover spilt milk",
        -- "talking to yourself:\ni heard there was a new slime\nshop down the street",
        -- "talking to yourself:\nmaybe i should go check it out\nand try slime farming again",
    }
    reading = false
    tb_init(0, opening_text)
end

function opening_draw()
    map(0, 0, 16, 0,128,128)
    tb_draw()
end

function animate_shopkeep()
    local frame_time = 0.3
    local stage = flr((t()+ shopkeep_spr.animation_offset) / frame_time % 40)+1
    if stage >= #shopkeep_seq then
        stage = 1
    end
    shopkeep_spr.frame = shopkeep_seq[stage]
end

function opening_update()
    if reading then -- if tb_init has been called, reading will be true and a text box is being displayed to the player. it is important to do this check here because that way you can easily separete normal game actions to text box inputs.
        tb_update() -- handle the text box on every frame update.   
    else 
        mode = mode_type.slime_farm
    end
    animate_shopkeep()
end