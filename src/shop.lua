function shop_init()
    shopitems = {
      {
        sprite = 001,
        name = "Green slime",
        desc = "Londuasnugnufnsnjnobagognfoangiodnaiongongkono",
        price = "10",
      },
      {
        sprite = 005,
        name = "Red slime",
        desc = "Londuasnugnufnsnjnobagognfoangiodnaiongongkono",
        price = "900",
      },
      {
        sprite = 006,
        name = "Yellow slime",
        desc = "Londuasnugnufnsnjnobagognfoangiodnaiongongkono",
        price = "69",
      },
      {
        sprite = 007,
        name = "Rainbow slime",
        desc = "Londuasnugnufnsnjnobagognfoangiodnaiongongkono",
        price = "69",
      },
    }
end

function shop_draw()
    map(16, 0, 0, 0,128,128)
    draw_shopbuttons()
    
end



function draw_shopbuttons()
  onscreen = {shopitems[3],shopitems[1],shopitems[2]}
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
end
  
function check_scroll()
    if collision_aabb(cursor, slibuttons[1]) and cursor.clicking then
      add_slime()
    end
end
  
function shop_update()
    check_scroll()
end
  