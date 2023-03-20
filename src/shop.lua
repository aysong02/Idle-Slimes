function shop_init()
    slime_pals = {
      red = {[11]=8, [10]=9, [3]=2},
      yellow = {[11]=9, [10]=9, [3]=4},
    }
    item_types = {
      slime = 0,
      seeds = 1,
      plot = 2,
      food = 3,
      roomba = 4,
    }
    shopitems = {
      {
        sprite = 172,
        name = "crop plot",
        desc = "Londuasnugnufnsnjnobagognfoangiodnaiongongkono",
        price = 100,
        bigItem = 1,
        quantity = 1,
        item_type = item_types.plot,
      },
      {
        sprite = 001,
        name = "Green slime",
        desc = "a simple green slime whose \nneeds are simple to tend to",
        price = 10,
        color = {},
        bigItem = 0,
        item_type = item_types.slime,
        poop_value = 1
      },
      {
        sprite = 001,
        name = "Red slime",
        desc = "Angwy red slime :(",
        price = 100,
        color = {[11]=8, [10]=9, [3]=2},
        bigItem = 0,
        item_type = item_types.slime,
        poop_value = 12,
      },
      {
        sprite = 001,
        name = "Yellow slime",
        desc = "Londuasnugnufnsnjnobagognfoangiodnaiongongkono",
        price = 500,
        color = {[11]=10, [10]=9, [3]=4},
        bigItem = 0,
        item_type = item_types.slime,
        poop_value = 69
      },
      {
        sprite = 001,
        name = "Blue slime",
        desc = "Londuasnugnufnsnjnobagognfoangiodnaiongongkono",
        price = 3000,
        color = {[11]=12, [10]=13, [3]=1},
        bigItem = 0,
        item_type = item_types.slime,
        poop_value = 450
      },
      {
        sprite = 023,
        name = "Rainbow slime",
        desc = "Londuasnugnufnsnjnobagognfoangiodnaiongongkono",
        price = 9999,
        bigItem = 0,
        item_type = item_types.slime,
        poop_value = 0
      },
      {
        sprite = 170,
        name = "blood rice seeds",
        desc = "Londuasnugnufnsnjnobagognfoangiodnaiongongkono",
        price = 10,
        bigItem = 1,
        quantity = 1,
        item_type = item_types.seeds,
        --plant stuff
        plant_spr_data = {{167},{168},{183},{184}},
        product = {
          sprite = 169,
          name = "blood rice",
          desc = "Londuasnugnufnsnjnobagognfoangiodnaiongongkono",
          bigItem = 0,
          quantity = 1,
          item_type = item_types.food,
          happy_val = 10
        }
      },
      {
        sprite = 170,
        name = "berry drop seeds",
        desc = "Londuasnugnufnsnjnobagognfoangiodnaiongongkono",
        price = 50,
        bigItem = 1,
        quantity = 1,
        item_type = item_types.seeds,
        --plant stuff
        plant_spr_data = {{136},{137},{138},{138,139},{156,140}},
        product = {
          sprite = 185,
          name = "berry drop",
          desc = "Londuasnugnufnsnjnobagognfoangiodnaiongongkono",
          bigItem = 0,
          quantity = 1,
          item_type = item_types.food,
          happy_val = 25
        }
      },
      {
        sprite = 170,
        name = "star egg seeds",
        desc = "Londuasnugnufnsnjnobagognfoangiodnaiongongkono",
        price = 500,
        bigItem = 1,
        quantity = 1,
        item_type = item_types.seeds,
        --plant stuff
        plant_spr_data = {{178},{179},{180,164},{181,165},{182,166}},
        product = {
          sprite = 153,
          name = "star egg",
          desc = "Londuasnugnufnsnjnobagognfoangiodnaiongongkono",
          bigItem = 0,
          quantity = 1,
          item_type = item_types.food,
          happy_val = 100
        }
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

    --initialize items for shop
    onscreen = {shopitems[1],shopitems[2],shopitems[3]}
end

function shop_draw()
    map(16, 0, 0, 0,128,128)
    draw_shopbuttons()
    
    spr(194, 0, 101, 1, 1, true, false)
    spr(211, 120, 106, 1, 1, true, false)

    pal(15,134,1)
    spr(224,7,7,4,2)
    print(soul,20,13,0)
    tb_draw()
end

function shop_update()
  if reading then
    tb_update()  
  end
  check_scroll()
  check_buy()
  
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
    rectfill( xcord, ycord, xcord+15, ycord+15, 13)
    pal(tempi.color)
    --Check if the item is 16 bit or not
    if tempi.bigItem == 1 then
      spr(tempi.sprite, xcord, ycord,2,2)
    else
      spr(tempi.sprite, xcord+4, ycord+4,1,1)
    end
    if tempi.item_type == item_types.seeds then
      spr(tempi.product.sprite, xcord+4, ycord+5,1,1)
    end
    pal()
    print(tempi.price,xcord+6, ycord+20)
    spr(soul_sprite,xcord-4, ycord + 18)
    i+=1
  end
  xcord = 56
  ycord = 66
  --Draw highlight 
  rect(56,66,56+16,66+16,11)

  --draw arrows
  spr(141,10,74)
  spr(141,110,74,1,1,1)

  --draw exit button 
  spr(204,112,0,2,2)
end
  
function check_scroll()
  for button in all(rightbuttons) do
    if collision_aabb(cursor, button) then
      cursor.sprite = cursor_sprites.hover
    end

    if collision_aabb(cursor, button) and click_release() then
      lefti+= 1
      lefti= lefti%(inum)
      tb_init(0, {onscreen[3].desc}) 
    end
  end
  for button in all(leftbuttons) do
    if collision_aabb(cursor, button) then
      cursor.sprite = cursor_sprites.hover
    end
    if collision_aabb(cursor, button) and click_release() then
      lefti-= 1
      lefti= lefti%(inum)
      tb_init(0, {onscreen[1].desc}) 
    end
  end
end

function check_buy()
  for button in all(shopcontainers) do
    if collision_aabb(cursor, button) then
      cursor.sprite = cursor_sprites.hover
    end
    
    if collision_aabb(cursor, button) and click_release() then
      --Check if you have enough soul
      curritem = onscreen[button.num]
      if soul >= curritem.price then
        soul -= curritem.price
        sfx(16)

        --Check what kind of purchase it is
        if curritem.item_type == item_types.slime then
          add_slime(curritem.color, curritem.poop_value)
        elseif curritem.item_type == item_types.seeds then
          add_to_inv(curritem)
        elseif curritem.item_type == item_types.plot then
          add_field()
        elseif curritem.item_type == item_types.roomba then
          add_to_inv(curritem)
        end
        
      end
    end
  end

  if collision_aabb(cursor, {x=112,y=0,h=16,w=16}) then
    cursor.sprite = cursor_sprites.hover
  end
  if collision_aabb(cursor, {x=112,y=0,h=16,w=16}) and click_release() then
    mode = mode_type.slime_farm
    sfx(15)
  end
end

function add_to_inv(item)
  --Check if item exists in inventory if it does increment it
  for invitem in all(inventory) do
    if invitem.name == item.name then
      invitem.quantity += item.quantity
      return
    end
  end
  -- if it doesnt add it
  temp = deepcopy(item) --I dont know why but this is neccessary
  add(inventory,temp)
end

function deepcopy(orig)
  local orig_type = type(orig)
  local copy
  if orig_type == 'table' then
      copy = {}
      for orig_key, orig_value in next, orig, nil do
          copy[deepcopy(orig_key)] = deepcopy(orig_value)
      end
      setmetatable(copy, deepcopy(getmetatable(orig)))
  else -- number, string, boolean, etc
      copy = orig
  end
  return copy
end




  