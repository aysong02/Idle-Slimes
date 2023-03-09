function shop_init()
    slime_pals = {
      red = {[11]=8, [10]=9, [3]=2},
      yellow = {[11]=9, [10]=9, [3]=4},
    }
    shopitems = {
      {
        sprite = 001,
        name = "Green slime",
        desc = "Londuasnugnufnsnjnobagognfoangiodnaiongongkono",
        price = 1,
        color = {}
      },
      {
        sprite = 005,
        name = "Red slime",
        desc = "Londuasnugnufnsnjnobagognfoangiodnaiongongkono",
        price = 300,
        color = {[11]=8, [10]=9, [3]=2},
      },
      {
        sprite = 006,
        name = "Yellow slime",
        desc = "Londuasnugnufnsnjnobagognfoangiodnaiongongkono",
        price = 69,
        color = {[11]=10, [10]=9, [3]=4}
      },
      {
        sprite = 007,
        name = "Rainbow slime",
        desc = "Londuasnugnufnsnjnobagognfoangiodnaiongongkono",
        price = 9999,
      },
    }
    leftbuttons ={
      {
        x = 7,
        y = 64,
        h=29,
        w=7,
      }
    }
    rightbuttons ={
      {
        x = 109,
        y = 64,
        h=29,
        w=7,
      }
    }
    shopcontainers ={
      {
        num = 1,
        x = 24,
        y = 66,
        h=15,
        w=15,
      },
      {
        num = 2,
        x = 56,
        y = 66,
        h=15,
        w=15,
      },
      {
        num = 3,
        x = 88,
        y = 66,
        h=15,
        w=15,
      }
    }
    lefti = 1
    inum = (#shopitems)
    buttontest =0
end

function shop_draw()
    map(16, 0, 0, 0,128,128)
    draw_shopbuttons()
    print(buttontest)
    print(gold,9,10,1)
end



function draw_shopbuttons()
  --This was a horrible implementation but it works :)
  if lefti == 0 then
    onscreen = {shopitems[inum],shopitems[1],shopitems[2]}
  elseif lefti == inum-1 then
    onscreen = {shopitems[inum-1],shopitems[inum],shopitems[1]}
  else
    onscreen = {shopitems[lefti],shopitems[lefti+1],shopitems[lefti+2]}
  end

  i=0
  for tempi in all(onscreen) do
    xcord = 24 + i*32
    ycord = 66
    rectfill( xcord+1, ycord+1, xcord+15, ycord+15, 13)
    spr(tempi.sprite, xcord+5, ycord+4,1,1)
    print(tempi.price,xcord+6, ycord+20)
    spr(123,xcord-4, ycord + 18)
    i+=1
  end
  xcord = 56
  ycord = 66
  --Draw highlight 
  rect(56,66,56+16,66+16,11)

  --draw arrows
  spr(76,10,74)
  spr(76,110,74,1,1,1)

  --draw exit button 
  spr(122,120)
end
  
function check_scroll()
  for button in all(rightbuttons) do
    if collision_aabb(cursor, button) and click_release() then
      lefti+=1
      lefti= lefti%(inum)
    end
  end
  for button in all(leftbuttons) do
    if collision_aabb(cursor, button) and click_release() then
      lefti-=1
      lefti= lefti%(inum)
    end
  end
end

function check_buy()
  for button in all(shopcontainers) do
    if collision_aabb(cursor, button) and click_release() then
      if gold >= onscreen[button.num].price then
        add_slime(onscreen[button.num].color)
        gold -= onscreen[button.num].price
        buttontest +=1
      end
    end
  end

  if collision_aabb(cursor, {x=120,y=0,h=8,w=8}) and click_release() then
    mode = mode_type.slime_farm
  end
end
  
function shop_update()
    check_scroll()
    check_buy()
end
  