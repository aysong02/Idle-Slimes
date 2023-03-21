-- Opening Scene Screen
function opening_init()
    opening_text = {
        "*the first thing i do when i \nwake up is water my plants but \ni want to go check on my slimes! i hope they were okay in the rain…*",
        "*slimes actually thrive in the \nrain since it allows them \nto grow, but i can't help but feel bad for them when they’re stuck out there for so long in the cold…*",
        "*i've grown to care a lot about \nmy slimes.. they are my \nonly friends but i'm okay with that!*",
        "*to be honest i don't even know \nif they acknowledge me \nbut that's okay because they're cute and they keep me happy*" ,
        "*i've had my slime farm for a \nwhile now! but i'm starting \nto worry about space because there's so many of them…*",
        "*i noticed a new shop opened \nup down the street! i think \ni will go check it out after i check on my slimes.*",
        "*since i'm heading to the \nfarm i should probably also \nfeed them and clean up their space!*",
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