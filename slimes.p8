pico-8 cartridge // http://www.pico-8.com
version 39
__lua__
-- code modified from class rain.p8

function _init() 
  poke(0x5F2D, 1)
  cursor = {
    x = 10,
    y = 10,
  }


end

function _draw()
	cls()
  map()
	spr(0, cursor.x, cursor.y)
  print(stat(34))
end

function _update60()
	input() 
end




function input()
    cursor.x = stat(32) - 1
    cursor.y = stat(33) - 1
end



__gfx__
777777777777777788888888888888889999999999999999aaaaaaaaaaaaaaaa0000000000000000000000000000000000000000000000000000000000000000
777777777777777788888888888888889999999999999999aaaaaaaaaaaaaaaa0000000000000000000000000000000000000000000000000000000000000000
777777777777777788888888888888889999999999999999aaaaaaaaaaaaaaaa0000000000000000000000000000000000000000000000000000000000000000
777777777777777788888888888888889999999999999999aaaaaaaaaaaaaaaa0000000000000000000000000000000000000000000000000000000000000000
777777777777777788888888888888889999999999999999aaaaaaaaaaaaaaaa0000000000000000000000000000000000000000000000000000000000000000
777777777777777788888888888888889999999999999999aaaaaaaaaaaaaaaa0000000000000000000000000000000000000000000000000000000000000000
777777777777777788888888888888889999999999999999aaaaaaaaaaaaaaaa0000000000000000000000000000000000000000000000000000000000000000
777777777777777788888888888888889999999999999999aaaaaaaaaaaaaaaa0000000000000000000000000000000000000000000000000000000000000000
777777777777777788888888888888889999999999999999aaaaaaaaaaaaaaaa0000000000000000000000000000000000000000000000000000000000000000
777777777777777788888888888888889999999999999999aaaaaaaaaaaaaaaa0000000000000000000000000000000000000000000000000000000000000000
777777777777777788888888888888889999999999999999aaaaaaaaaaaaaaaa0000000000000000000000000000000000000000000000000000000000000000
777777777777777788888888888888889999999999999999aaaaaaaaaaaaaaaa0000000000000000000000000000000000000000000000000000000000000000
777777777777777788888888888888889999999999999999aaaaaaaaaaaaaaaa0000000000000000000000000000000000000000000000000000000000000000
777777777777777788888888888888889999999999999999aaaaaaaaaaaaaaaa0000000000000000000000000000000000000000000000000000000000000000
777777777777777788888888888888889999999999999999aaaaaaaaaaaaaaaa0000000000000000000000000000000000000000000000000000000000000000
777777777777777788888888888888889999999999999999aaaaaaaaaaaaaaaa0000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555333333333333333300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
555555553333333333333b3300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
666656663333333333b3b33300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66665666333333333b33333300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555333333333333b33300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6656666633333333333b33b300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
665666663333333333b33b3300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555333333333333333300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__gff__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
4040404040404040404040404141414141414141414141410000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4041414241414141414141404141414041414141414141410000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4041414141424141414141404140414141414141414141410000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4041424142414142414141404141414141414041414141410000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4041414040404040404141404141414141414141414141410000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4041414241414142404141414140414141414141404141410000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4042414141424141404141414141414140414141414141410000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4041414141414141404140414141414141414140414141410000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4040404040404040404041414141404141414141414141410000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4141414141414141414140414141414141414141414141410000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
