function initailize_poop()
    for i=1, 10, 1 do
        local seed = {
            x = 10,
            y = 10,
            frame = poopData.id,
            w = poopData.w,
            h = poopData.h,
            valid = false,
            }
            poops[i] = seed
    end
end

function draw_poop()
    for i=1, #poops do
      if poops[i].valid then 
        spr(poops[i].frame, poops[i].x, poops[i].y)
      end
    end
end

function plant_poop(x, y)
    local seed = {
    x = x,
    y = x,
    frame = poopData.id,
    w = poopData.w,
    h = poopData.h,
    valid = true,
    }
    
    for i=1, #poops do
        if poops[i].valid == false then
            poops[i] = seed
            poops[i].x = x
            poops[i].y = y
            break
        end
    end
end
  
function update_poop()
    for i=1, #poops do
        if collision_aabb(cursor, poops[i]) and poops[i].valid == true and cursor.clicking then
            gold += 1
            poops[i].valid = false
        end
    end
end