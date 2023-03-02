pico-8 cartridge // http://www.pico-8.com
version 39
__lua__
#include src/main.lua
#include src/opening_screen.lua
#include src/slime/slime.lua
#include src/draw_ui.lua
#include src/helper/collision.lua
#include src/shop.lua
#include src/slime/poop.lua
#include src/cursor.lua
__gfx__
000000000000000000bb770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070700000000000
00000000000000000bbbbb7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070707000000000
007007000bbbb7700bbabab0000000000cccc770088887700aaaa770089abc10000000000899aab00abbcc100c11228000000000000000000070707000707070
00077000bbbbbbb70bbbbbb000000000ccccccc788888887aaaaaaa789abc12800000000899aabbcabbcc112c112288900000000000000000077777000777770
00077000bbbabbab0bbbbbb00bbbb770cc1d11dc88898898aaa9aa9a9ab712790000000099a7bb7cbbc711721127887900000000000000006077777007777770
00700700bbbbbbbb033bbbb0bbbbbbb7c111111c88888888aaaaaaaaabc1289a000000009aabbcc1bcc112281228899a00000000000000006677777007777770
0000000033bbbbbb0033330033babbabc111111c2288888844aaaaaa221289ab0000000055bbcc1155112288558899aa00000000000000000666777000777770
000000000333333000000000333333330cccccc00222222004444440022222200000000005555550055555500555555000000000000000000006660000077700
00000000000000000000000000000000000000000000000000a00a0000a00a000000000000000000000007777777700000000000000000000067770000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000077777777770000000000000000000067770000000000
000000000000000000000000000000000000000000000000a0aaaa0aa0aaaa0a0000000000666000000777777777777000000000000000000067770000000000
0bbbb770000000000000000000000000000000000000000000aaaa0000666a000066600006666660007777777777777700000000000000000067770000000000
bbbbbbb70bbbb7700000000000000000000000000000000000aaaa00066666600666666065555566007777777777777700000000000000006677777700000000
bbbabbabbbbbbbb70bbb7770000000000000000000000000a0aaaa0a655555666555556655c55c56007777777777777700000000000000000677777000000000
33bbbbbb33babbab33babbab0000000000000000000000000000000055555556555555565c51c515007777777777777700000000000000000067770000000000
03333330333333333333333300000000000000000000000000a00a00065556600655566000100100000777777777777000000000000000000006700000000000
07070070070007000000000000000000000000000000000000000000000000000000000000000000000077777777770000000000000000000000000000000000
737377b773707370050500d005000500000000000000000000000000000000000000000000000000000007777777700000000000000000000000000000000000
7b3733377bb77b770d5055500dd00d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
7777bb70073bb3b70000dd00005dd5d0000000000000000000000000000000000000000000000000007700000000000000000000000000000000000000000000
073b7700073b3b37005d0000005d5d50000000000000000000000000000000000000000000000000007700000000000000000000000000000000000000000000
0073377073b377700005500005d50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077b370737337000000d5000505500000000000000000000000000000000000000000000000000700000000000000000000000000000000000000000000000
00000770007077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00007000000707000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077700000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00007000000707000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555333333333333333344444444000440000000000000000000000000000070000000707000000000000067770000000000000000000000000000000000
555555553333333333333b3349494444000440000011110000000000000000000077000000707070000000000067770000000000000000000000000000000000
666656663333333333b3b333444449440044440001cccc1000777700000000000007770000707070007070700067770000000000000000000000000000000000
66665666333333333b33333344444444444444441cc7c7c100777000000000000007777000777770007777700067770000000000000000000000000000000000
55555555333333333333b33344944494444444441cc0c0c100777700000000000607777060777770067777706677777700000000000000000000000000000000
6656666633333333333b33b344449444004444001cccccc100707700000000000667777066777770067777700677777000000000000000000000000000000000
665666663333333333b33b33944444440004400001cccc1000000000000000000066677006667770006677700067770000000000000000000000000000000000
55555555333333333333333344444494000440000011110000000000000000000000666000066600000666000006700000000000000000000000000000000000
00000000000aa0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000aaaaaa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000aaaaaaaaa0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000aaaaaaaaaa90000007a00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000aaaaaaaaaa99900000aa7a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
009aaaaaaaa999900000aaaa7a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0a99aaaaa99990000009aaaaa7a00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
9aa99aa999997a0000099aaaaa7a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
99aa9999999aa7a0000099aaaaa7a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
099aa999a9aaaa7a00aa999aaaaa7a00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0099aaaa7a9aaaa909aaa999aaaaa7a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00099aaaa7a9a990099aaa999aaaa990000000000000000000000000000000000000050060000000000000000000000000000000000000000000000000000000
000099aaaa9999000099aa9999aa9900000000000000000000000000000000000000500650500000000000000000000000000000000000000000000000000000
0000099aa99000000009999909999000000000000000000000000000000000000000506505060000000000000000000000000000000000000000000000000000
00000099990000000000990000990000000000000000000000000000000000000006056655565000000000000000000000000000000000000000000000000000
00000009900000000000000000000000000000000000000000000000000000000000066666505000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000060566dd6650000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000006056dddd650500000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000056dddd650500000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000566dd6650000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000056666500000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000005555000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000033333333333333333333b3333333333300000000000000000003303300000000000dd000000000005555555555555555
00000000000000000000000000000000333333b3333b3333333b3333333333b300000000000bbb00000333300000000000deed00000000005666666666666665
0000000000000000000000000000000033b3333b3333b333333b333333333b330000000000bbb0000333b000000000000deeeed3000000005666666666666665
00000000000000000000000000000000333b3333b3333b3333bb33333b333b330b0000b0000bb000330bb0330000000000deed30000000005666666666666665
009900099000990000000000000000003333b3333333333333333333b333bb330bbbbbb0000bbb00000b333000000000033dd000000000005666666666666665
0049000490004900000000000000000033333333333333333333b333b3333333000bb00000bbb0000333b30000033033330bb033000000005666666666666665
004900049000490000000000000000003b33333b333b3333333b333bb333333300000000000bb000330bb00000033330000b3330000000005666666666666665
9949999499994999000000000000000033b33333b333b333333b3333333333b30000000000000000000bb0000333b0000333b000000000005666666666666665
44444444444444440000000000000000333b33333b333b3333bb333333333b33000000000000000000000000330bb03300000000000000005666666666666665
004900049000490000000000000000003333333333333333333333333b333b33000000000000000000000000000b333000000000000000005666666666666665
004900049000490000000000000000003b33333b3333333333333333b333bb330000000000000000000000000333b30000000000000000005666666666666665
0049000490004900000000000000000033b33333b33b33333333b333b3333333000000000000000000000000330bb00000000000000000005666666666666665
99499994999949990000000000000000333b33333b33b333333b333bb33333b3000000000000000000000000000bb00000000000000000005666666666666665
4444444444444444000000000000000033333b3333333b33333b333333333b330000000000000000000000000000000000000000000000005666666666666665
00490004900049000000000000000000333333b33333333333bb333333333b330000000000000000000000000000000000000000000000005666666666666665
004900049000490000000000000000003333333b33333333333333333333bb330000000000000000000000000000000000000000000000005555555555555555
33333399993333330000000000000000000000000000000000000000000000004444444444444444444444444444444400000000000000000000000000000000
33333349493333330000000000000000000000000000000000000000000000004444444444444444444444444444444400000000000000000000000000000000
3333339999333333000000000000000000000000000000000000000000000000449999999999994444444aaaaaa4444400000000000000000000000000000000
333333494933333300000000000000000000000000000000000000000000000044999999999999444444a99999aa444400000000000000000000000000000000
33333399993333330000000000000000000000000000000000000000000000004499999999999944444a9999999aa44400000000000000000000000000000000
33333349493333330000000000000000000000000000000000000000000000004499999999999944449999999999aa4400000000000000000000000000000000
333333999933333300000000000000000000000000000000000000000000000044999999999999444499999999999a4400000000000000000000000000000000
33333349493333330000000000000000000000000000000000000000000000004499bb9999bb99444499999999999a4400000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000044999bbbbbb999444499999999999a4400000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000004499999bb99999444499999999999a4400000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000044999999999999444499999999999a4400000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000004499999999999944444999999999944400000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000004499999999999944444499999999444400000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000004499999999999944444449999994444400000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000004444444444444444444444444444444400000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000004444444444444444444444444444444400000000000000000000000000000000
99999999222222225555555544444444555555555555555555555555555555550000000000000000000000000000000000000000000000000000000000000000
99999999222222225555555544444444555555555555555555555555555555550000000000000000000000000000000000000000000000000000000000000000
99999999222222225555555544444444555555555555555555555555555555550000000000000000000000000000000000000000000000000000000000000000
99999999222222225555555544444444555555555555555555555555555555550000000000000000000000000000000000000000000000000004444449900000
999999992222222255555555444444445555555ddddddddd55555555555555550000000000000000000000000000000000000000000000000044994949999000
9999999922222222555555554444444455555ddddddddddddd555555555555550000000000000000000000000000000000000000000000000444999944599900
999999992222222255555555444444445555dddd1111111dddd55555555555550000000000000000000000000000000000000000000000004444444445559990
99999999222222225555555544444444555ddd1111111111dddd555555555555000000000000000000000000000000000000000000000000454611d645556999
99999999111111115566665544666644555dd111111111111dddd555555555550000000000000000000000000000000000000000000000004441111d45556560
9999999911111111556666554466664455ddd1112222111111dddd55555555550000000000000000000000000000000000000000000000004041181d45656560
9999999911111111556666554466664455dd111222222111111dddd5555555550000000000000000000000000000000000000000000000004041111144656560
9999999911111111556666554466664455dd1112222222111111ddd5555555550000000000000000000000000000000000000000000000004049999944656460
9999999911111111556666554466664455d11122222222211111dddd555555550000000000000000000000000000000000000000000000000044444444646400
9999999911111111556666554466664455d111222222222211111ddd555555550000000000000000000000000000000000000000000000000044444444446400
4444444411111111556666554466664455d111222222222211111dddd55555550000000000000000000000000000000000000000000000000044444444444400
4444444411111111556666554466664455d1112222882222111111ddd55555550000000000000000000000000000000000000000000000000000000000000000
9999999999999999999999999999999955d1112228888222111111dddd5555550000000000000000000000000000000000000000000000000000000000000000
9999999999999999999998999999999955d11122288882221111111ddd5555550000000000000000000000000000000000000000000000000000ddddd0000000
9989999999999999999998999999999955d11122228822221111111dddd55555000000000000000000000000000000000000000000000000000dd111ddd00000
9989998888899999989998888999899955dd11122222222211111111ddd5555500000000000000000000000000000000000000000000000000dd111111dd0000
99899999988999999899999999998999555d11122222222211111111dddd555500000000000000000000000000000000000000000000000000d11111111d0000
99999999889999999999999998898899555dd11122222221111111111ddd555500000000000000000000000000000000000000000000000000d11222111dd000
988898999999998899988999989999995555d11112222221111111111dddd5550000000000000000000000000000000000000000000000000d1122222111d000
999899899998999999988889989999995555dd11112222111111111111ddd5550000000000000000000000000000000000000000000000000d1128822111dd00
9988998899989889999999999899998955555d11111111111111111111ddd5550000000000000000000000000000000000000000000000000d11288221111d00
9988999888989989999999998899988955555d111111111111111111111ddd5500000000000000000000000000000000000000000000000000d1222221111d00
9999999998989899998888998999899955555d111111111111111111111ddd5500000000000000000000000000000000000000000000000000d1122211111dd0
9999999999988899998889998999899955555d111111111111111111111ddd55000000000000000000000000000000000000000000000000000d111111111dd0
998899999999989999989999998889995555dd1111111111111111111111ddd5000000000000000000000000000000000000000000000000000d1111111111dd
999999999999999999998999999999995555dd1111111111111111111111ddd5000000000000000000000000000000000000000000000000000d1111111111dd
999999999999999999999999999999995555d11111111111111111111111ddd500000000000000000000000000000000000000000000000000d11111111111dd
99999999999999999999999999999999555dd11111111111111111111111ddd50000000000000000000000000000000000000000000000000d111111111111dd
__gff__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
41414141414141414141414147474747c3c3c3c3c3c3c3c3c3c3c3c3c3c3c3c3414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
41414141414141414141414147474747c3c0c0e0e0e1e2e3c0c0c0c3c3c3c2c3414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a041414141414141414141a147474747c3c0c0c0f0f1f2f3f3c0c0c3c3c2c2d2414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a086878687868786878687a147474747c3c3c3c3c3c3c3c3c3c3c3c3c3c2d2d2414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a096979697969796979697a147474747c3c2c2c2c2c2c2c2c4c5c6c7c3d2d2d2414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a086878687868786878687a147474747c3c2c8c8c8c80000d4d5d6d7c3d2d2d2414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a096979697969796979697a147474747c3c2c8c8c8c80000e4e5e6e7c3d2d2d2414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a086878687868786878687a147474747c3c2c2c2c2c2c2c2f4f5f6f7c3d3d2d2414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a041979697969796979697a147474747c0c0c0c0c0c0c0c0c0c0c0c0c3d3c2d2414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a086878687868786878687a147474747c0c0c0c0c0c0c0c0c0c0c0c0c3d3c3d2414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a096979697969796979697a147474747c0c0c0c0c0c0c0c0c0c0c0c0c3c3c3d2414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a086878687868786878687a147474747d0d0d0d0d0d0d0d0d0d0d0d0c3c3c3d3414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a086878687868786878687a147474747d0d0d0d0d0d0d0d0d0d0d0d0c3c3c3d3414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a096979697969796979697a147474747d0d0d0d0d0d0d0d0d0d0d0d0c3c3c3d3414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
41414141414141414141414147474747d0d0d0d0d0d0d0d0d0d0d0d0c3c3c3c3414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
41414141414141414141414147474747c3c3c3c3c3c3c3c3c3c3c3c3c3c3c3c3414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4444444444444444444444444444444444444141414141414141414141414141414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4141414141414141414141414141414141414141414141414141414141414141414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4141414141414141414141414141414141414141414141414141414141414141414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4141414141414141414141414141414141414141414141414141414141414141414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4141414141414141414141414141414141414141414141414141414141414141414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4141414141414141414141414141414141414141414141414141414141414141414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4141414141414141414141414141414141414141414141414141414141414141414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4141414141414141414141414141414141414141414141414141414141414141414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4141414141414141414141414141414141414141414141414141414141414141414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4141414141414141414141414141414141414141414141414141414141414141414141414141414141414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
0109000025344253012b3442b3012c3442c30133344333012b3242b30133324333012b3142b301333143330100000000000000000000000000000000000000000000000000000000000000000000000000000000
0109000027344273012c3442c3012e3442e30137344373012e3242e30137324373012e3142e301373143730100000000000000000000000000000000000000000000000000000000000000000000000000000000
0109000031465000000000031435000000000031415000002e46500000000002e42531465000002e4253146500000000003142500000000003141500000000002b4342b4302c4442c44031454314503346433460
01090000354650000000000354350000000000354150000033465000000000033425354650000033425354650000000000354250000000000354150000000000294142b4002b4242b4002c4342c4322c4322c432
010900002e46500000000002e43500000000002e415000002c46500000000002c4252e465000002c4252e46500000000002e42500000000002e4150000000000000000000000000000002b4342c4442e45433464
0109000031465000000000031435000000000031415000002e46500000000002e4252b465000002e4252b46500000000002b42500000000002b4150000000000000000000000000000002b4002c4002e40033400
010900002e46500000000002e43500000000002e415000002c46500000000002c4252e465000002c4252e46500000000002e42500000000002e4150000000000000000000000000000002b4002c4002e40033400
01090000254340000027444000002b454000002c464000002e434000002b444000002c454000002e4640000033434000002e44400000334540000035464000003743437430374303743037432374323743037430
010900002c0750000000000274000c0752b400270752c4002b0752e400000002b4002c0752c400000002e4000c07527000270752e4002c075334002b0702b0752207537400374003740037400250002507527075
010900002c0750000000000274000d0752b400270752c4002b0752e400000002b4002c0752c400000002e4000d0700d075270752e4002c0702c0752b0702b0752207022075270753740020070200752207527000
010900002b0750000000000274000f0752b400270752c400290752e400000002b4002b0752c400000002e4000f07527000270752e4002c075334002b0702b0752207537400374003740037400250002507527075
010900002b0750000000000274000f0752b400270752c400290752e400000002b4002b0752c400000002e4000f07527000270752e4002c075334002b0702b0752207022070220722207222001250002500027000
030900003064300600006000c60024623246012461530600246232460124615306003064300600006000060024623246012461530600246232460124615306001863318611186010060000615066150c62512625
030900002464300600006000c60030623246012461530600246232460130615306003064300600006000060030623246012461530600246232460130615306001863318611186010060000615066150c62512625
030900002464300600006000c60030623246012461530600246232460130615306003064300600006000060030623246012461530600246232460130615306001863318621186111860100600066000c60012600
__music__
01 0002080c
00 0003090d
00 01040a0c
00 01050a0d
00 0002080c
00 0003090d
00 01060a0c
02 01070b0e

