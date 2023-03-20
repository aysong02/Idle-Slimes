-- Opening Scene Screen
function opening_init()
    opening_text = {
        "sk: \nASDGH@%^^B&$#&IWNREHI#!",
        "you: \nhello?",
        "sk: \noh.. hi. sorry. i thought  \nyou speak slimili",
        "you: \n...no",
        "sk: \ni see now. you are human yes",
        "you: \nyes… and you are….?",
        "sk: \n...human yes",
        "you: \nokay… well… anyways…",
        "sk: \n...",
        "you: \ni live nearby and was  \nlooking to buy some goods!",
        "you: \nwhat do you have in stock?",
        "sk: \nah yes. goods. i have lots. \ntake a look!",
        "you: \nyes i see a few that i'm \ninterested in!",
        "you: \nbut there is one tiny problem…",
        "sk: \nwhat? you don't like?",
        "you: \nnononono it's not that ",
        "you: \ni just",
        "you: \ndo not know what currency this is…",
        "sk: \nyou do not know? if you do not \nknow then what do you have?",
        "you: \ndo you take gold? you are \nhuman yes? humans use gold",
        "sk: \noh yeah. human… see this shop \nis different. special. one of a kind.",
        "you: \n...yeah i can see that",
        "sk: \ni don't take gold. gold isn’t useful!",
        "you: \nsure… yeah… right. not useful at all…",
        "sk: \nyou own a slime farm, yes?",
        "you: \nyes i do! wait… how do you….  uh nevermind.",
        "sk:\nlet’s make a deal- give me your slime droppings!",
        -- "you:\n*did he just say….*",
        -- "you:\n*my slime droppings??????*",
        -- "you:\n*maybe it's not too late to turn back… no i can't. i really need these items!!!",
        -- "you:\n*i do have a lot of slime droppings… maybe i can just give them to him, no questions asked. even though i have lots of questions…*",
        -- "you:\nsure. i can do that! random…  but sure!",
        -- "sk:\nnot random! very necessary. give me slime droppings and i trade you soul husks to pay for an item. then buy. deal?",
        -- "you:\n*soul husks…????? this just keeps getting weirder and weirder*",
        -- "you:\nsouls? husks? how do i know if the value is… agh. ok deal. here this is from this morning…",
        -- "sk:\nyay! thank you!! you are so helpful human!!!",
        -- "you:\nhahaha yayyyyy",
        -- "sk:\n here are soul husks. buy items with soul husks. come back with slime droppings, i give you more!",
        -- "you:\ni feel like i’m scamming him… or maybe he’s scamming me?",
        -- "you:\nthank you…! i will most… likely… be back again!",
        -- "sk:\nyay! new friend!!!",
        -- "you:\nsure yes… new friend…",
        -- "you:\nthank you! by the way… i have a question?",
        -- "sk:\nask away!",
        -- "you:\nwhy do you want slime droppings?",
        -- "sk:\nfunny question! i eat them. yummy snack!",
        -- "you:\n...",
        -- "sk:\njust kidding! hahahaha you should’ve seen your face!",
        -- "you:\nhahahah…",
        -- "sk:\ni use them to make clothing material! i am a fashion designer b) isn’t my cloak cool???? i made it!!!”",
        -- "you:\n*huh. seems weird, but i'll take it… seems like a rarity… like silk maybe?*",
        -- "you:\nwoah that's …cool! your designs are cool!”",
        -- "sk:\nthanks friend!!! maybe i could make you one too!”",
        -- "you:\nhahahahahaha yeah maybe!!”",
    }
    reading = false
    tb_init(0, opening_text)
    shopkeep_seq = {212,200,202,200,212}
    shopkeep_spr = {
        frame = 202,
        x= 88,
        y = 40,
        animation_offset = flr(rnd(20))
    }
end

function opening_draw()
    map(16, 0, 0, 0,128,128)
    tb_draw()
    spr(shopkeep_spr.frame, shopkeep_spr.x, shopkeep_spr.y,2,2)
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