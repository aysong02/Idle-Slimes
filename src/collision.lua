--collision detection
function collision_aabb(a, b)
    local a_right_b = a.x > b.x+b.w
    local a_left_b = a.x+a.w < b.x
    local a_above_b = a.y+a.h < b.y
    local a_below_b = a.y > b.y+b.h
    
    return not(a_right_b or 
      a_left_b or 
      a_above_b or 
      a_below_b)
  end