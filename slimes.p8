pico-8 cartridge // http://www.pico-8.com
version 39
__lua__
#include src/main.lua
#include src/opening_screen.lua
#include src/slime/slime.lua
#include src/slime/slime_movement.lua
#include src/slime/slime_action.lua
#include src/slime/slime_animation.lua
#include src/draw_ui.lua
#include src/helper/collision.lua
-- #include src/helper/deepcopy.lua
#include src/helper/textbox.lua
#include src/helper/click.lua
#include src/shop.lua
#include src/slime/poop.lua
#include src/cursor.lua
#include src/crops/crops.lua
__gfx__
000000000000000000bb770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000bbbbb7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000bbbb7700bbabab0000000000cccc7700899aab00abbcc100c1122800000000000000000000000000000000000000000000000000000000000000000
00000000bbbbbbb70bbbbbb000000000ccccccc7899aabbcabbcc112c11228890000000000000000000000000000000000000000000000000000000000000000
00000000bbbabbab0bbbbbb00bbbb770cc1d11dc99a7bb7cbbc71172112788790000000000000000000000000000000000000000000000000000000000000000
00000000bbbbbbbb033bbbb0bbbbbbb7c111111c9aabbcc1bcc112281228899a0000000000000000000000000000000000000000000000000000000000000000
0000000033bbbbbb0033330033babbabc111111c55bbcc1155112288558899aa0000000000000000000000000000000000000000000000000000000000000000
000000000333333000000000333333330cccccc00555555005555550055555500000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000a00a0000a00a000000000000000000000007777777700000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000077777777770000000000000000000000000000000000
000000000000000000000000000000000000000000000000a0aaaa0aa0aaaa0a0000000000666000000777777777777000000000000000000000000000000000
0bbbb770000000000000000000000000000000000000000000aaaa0000666a000066600006666660007777777777777700000000000000000000000000000000
bbbbbbb70bbbb7700000000000000000000000000000000000aaaa00066666600666666065555566007777777777777700000000000000000000000000000000
bbbabbabbbbbbbb70bbb7770000000000000000000000000a0aaaa0a655555666555556655c55c56007777777777777700000000000000000000000000000000
33bbbbbb33babbab33babbab0000000000000000000000000000000055555556555555565c51c515007777777777777700000000000000000000000000000000
03333330333333333333333300000000000000000000000000a00a00065556600655566000100100000777777777777000000000000000000000000000000000
07070070070007000000000000000000000000000000000000000bbb777000000000000000000000000077777777770000000000000000000000000000000000
737377b773707370050500d00500050000000000000000000000bbbbbbb700000000000000000000000007777777700000000000000000000000000000000000
7b3733377bb77b770d5055500dd00d000000000000000000000bbbbbbbbb70000000000000000000000000000000000000000000000000000000000000000000
7777bb70073bb3b70000dd00005dd5d00000000000000000000bbbbbbbbbb0000000000000000000007700000000000000000000000000000000000000000000
073b7700073b3b37005d0000005d5d500000000000000000000bbbbabbabb0000000000000000000007700000000000000000000000000000000000000000000
0073377073b377700005500005d50000000bbbbbb7777000000bbbbbbbbbb0000000000000000000000000000000000000000000000000000000000000000000
00077b370737337000000d500050550000bbbbbbbbbbb700000bbbbbbbbbb0000000000000000000700000000000000000000000000000000000000000000000
000007700070770000000000000000000bbbbbbbbbbbbb70000bbbbbbbbbb0000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000bbbbbbbbbbbbbb0000bbbbbbbbbb0000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000bbbbbbbabbbabb0000bbbbbbbbbb00000bbbbbbbb777700000000000000000000000000000000000000000000000000
000070000007070000000000000000000bbbbbbbbbbbbbb000033bbbbbbbb0000bbbbbbbbbbbbb70000000000000000000000000000000000000000000000000
000777000000700000000000000000000bbbbbbbbbbbbbb0000333bbbbbb3000bbbbbbbbbbbbbbb7000000000000000000000000000000000000000000000000
00007000000707000000000000000000033bbbbbbbbbbbb00000333333330000bbbbbbbbbabbbabb000000000000000000000000000000000000000000000000
000000000000000000000000000000000333bbbbbbbbbb30000003333330000033bbbbbbbbbbbbbb000000000000000000000000000000000000000000000000
0000000000000000000000000000000000333333333333000000000000000000333bbbbbbbbbbb33000000000000000000000000000000000000000000000000
00000000000000000000000000000000000333333333300000000000000000000333333333333330000000000000000000000000000000000000000000000000
005500000575755000000000006777007777777777777777777777777777777777777777777777770000000000000000999aa499044444400000000000000000
05775500057575750055555000677700566666666666666756666666666666675666666666666667000000000000000099aa4999049999400000000000000000
0557775005757575057575750067770056666666666666675666666666666667566666666666666700000000000000009aaa4999044444400000666666770000
05577775557777750577777500677700566666666006666756666666666666675666666a966666670000000000000000aaa449990499a9400006666666667000
5657777565777775567777756677777756666666060666675666666666666667566666aaaa6666670000000000000000aaa44999049999400166665555666710
566777756677777556777775067777705666666067066667566666666666666756666a9aa9a6666700000000000000009aaa4999049a994001666565b6566710
05666775566677750566777500677700566666067706666756666bbbb7766667566669aa9aa66667000000000000000099aa49990499a9400166656556566710
0055666505566650005666500006700056666067770666675666bbbbbbb7666756666aaaaa9666670000000000000000999aa499044444400066656666566600
00000000000aa000000000000000000056666067770666675666bbbabbab666756666a9a9aa66667000000000000000000000000000000000066665555666600
000000000aaaaaa0000000000000000056666607770666675666bbbbbbbb6667566669aaaa966667000000000000000000000000000000000056666666666500
0000000aaaaaaaaa00000000000000005666666077066667566633bbbbbb666756633bbbbbb33667000000000000000000000000000000000055666666665500
00000aaaaaaaaaa90000007a00000000566666660706666756666333333666675666333bb3336667000000000000000000000000000000000055555555555500
000aaaaaaaaaa99900000aa7a0000000566666666006666756666666666666675666633333366667000000000000000000000000000000000005555555555000
009aaaaaaaa999900000aaaa7a000000566666666666666756666666666666675666333333336667000000000000000000000000000000000000555555550000
0a99aaaaa99990000009aaaaa7a00000566666666666666756666666666666675666666336666667000000000000000000000000000000000000000000000000
9aa99aa999997a0000099aaaaa7a0000555555555555555555555555555555555555555555555555000000000000000000000000000000000000000000000000
99aa9999999aa7a0000099aaaaa7a000000000000000000000000000000000000000000000000000000000000000000000000000000000007777777777777777
099aa999a9aaaa7a00aa999aaaaa7a00000000000000000000000000000000000000000000000000000000000000000000000000000000005666666666666667
0099aaaa7a9aaaa909aaa999aaaaa7a0000444444444400000044444444440000000000000000000000000000000000000000066670000005669999999999667
00099aaaa7a9a990099aaa999aaaa990000499999999400000049999999940000000000000000000000000000000000000000655557000005669944444499667
000099aaaa9999000099aa9999aa9900000444444444400000044444444440000000000000000000000000000000000000000665566000005664449999499667
0000099aa99000000009999909999000000499999999400000049999999940000000000000000000000000000000000000000666666000005644444444455567
000000999900000000009900009900000004999998994000000499229999400000000000000000000000000000000000000066666666000056454611d6455567
0000000990000000000000000000000000049928888940000004999299994000000000000000000000000000000000000000666666660000564441111d465567
0000000000000000000000000000000000049928888940000004999999994000000000000000000000000000000060500000666bb6660000566441181d465567
00000000000000000000000000000000000492288899400000049999929940000000000000000000000000000606650000066665566660005664411111465567
00000000000000000000000000000000000499222299400000049999922940000000000000000000000000000056550000566666666665005664499999465667
000000000000000000000000000000000004999929994000000499299999400000000000000000000000000005666650005666d66d6665005664444444445667
0000000000000000000000000000000000049999999940000004922999994000000000000000000000000000056dd65000556666666655005664444444444667
0000000000000000000000000000000000049999999940000004999999994000000000000000000000000000056dd65000055666666550005664444444444667
00000000000000000000000000000000000444444444400000044444444440000000000000000000000000000566665000005555555500005666666666666667
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000055550000000000000000005555555555555555
0000000000000000000000000000000033333333333333333333b33333333333000000000000000000033033000dd000000dd000000000005555555555555555
00000000000000000000000000000000333333b3333b3333333b3333333333b300000000000bbb000003333000deed0000deed00000000005ffffffffffffff5
0000000000000000000000000000000033b3333b3333b333333b333333333b330000000000bbb0000333b0000deeeed30deeeed3000000005ffffffffffffff5
00000000000000000000000000000000333b3333b3333b3333bb33333b333b330b0000b0000bb000330bb03300deed3000deed30000000005ffffffffffffff5
009900099000990000000000000000003333b3333333333333333333b333bb330bbbbbb0000bbb00000b3330033dd000033dd080000000005ffffffffffffff5
0049000490004900000000000000000033333333333333333333b333b3333333000bb00000bbb0000333b300330bb033380bb033000000005ffffffffffffff5
004900049000490000000000000000003b33333b333b3333333b333bb333333300000000000bb000330bb000000b3330000b3330000000005ffffffffffffff5
9949999499994999000000000000000033b33333b333b333333b3333333333b30000000000000000000bb0000333b0000333b800000000005ffffffffffffff5
44444444444444440000000000000000333b33333b333b3333bb333333333b33000000000000000000000000000ee000380bb033000000005ffffffffffffff5
004900049000490000000000000000003333333333333333333333333b333b33000000000000000000d00600002eee00000b3338000000005ffffffffffffff5
004900049000490000000000000000003b33333b3333333333333333b333bb330000000000000000000d60000e02e0e00333b800000000005ffffffffffffff5
0049000490004900000000000000000033b33333b33b33333333b333b33333330000000000066000060d60602e02e02e3808b000000000005ffffffffffffff5
99499994999949990000000000000000333b33333b33b333333b333bb33333b3000000000d0d6060d60d60d62e22e02e000bb000000000005ffffffffffffff5
4444444444444444000000000000000033333b3333333b33333b333333333b330600006000dd660006dd60d00e22ee2000000000000000005ffffffffffffff5
00490004900049000000000000000000333333b33333333333bb333333333b3306666660000d6000d60d66d02e02ee2000000000000000005ffffffffffffff5
004900049000490000000000000000003333333b33333333333333333333bb3300066000000d6000060d60d00e02e02000000000000000005555555555555555
333333999933333300000000000000000000000000000000000000000009a0000000000000000000444444444444444400000000000000000000000000000000
333333494933333300000000000000000000000000000000000bb00000aaaa000000000000000000444444444444444400000000000000000000000000000000
333333999933333300000000000000000000000000000000000bb00000b9ab0000000000000000004444aaaaaaaa444400000000000000000000000000000000
333333494933333300000000000000000000000000000000003bbb0000baab000000000000000000444999999999a44400000000000000000000000000000000
333333999933333300000000000000000000000000000000003bbb0000b9ab0000000000000000004499999999999a4400000000000000000000000000000000
3333334949333333000000000000000000000000000bb000003bbb0000bbbb0000000000000000004499999999999a4400000000000000000000000000000000
333333999933333300000000000000000000000000bbbb00333bbbbb333bbbbb00000000000000004499999999999a4400000000000000000000000000000000
333333494933333300000000000000000000000000bbbb0003333b300333bb3000000000000000004499999999999a4400000000000000000000000000000000
33333333333b3333000000000000000000000000003bbb00003333000033330000000000000000004499999999999a4400000000000000000000000000000000
33333333333b33330000000000000000000bb0000033bb0003333bb003333bb000000000000000004499999999999a4400000000000000000000000000000000
333333333333333300000000000000000003b00000033000000330000003300000000000000000004499999999999a4400000000000000000000000000000000
33333333333333b3000000000000000000033b0000033bb000033bb000033bb000000000000000004499999999999a4400000000000000000000000000000000
33333333333333b300000000000bb000003330000333300003333000033330000000000000000000444999999999944400000000000000000000000000000000
3333333333b333330000000000033b0000033b0000033b0000033b0000033b000000000000000000444499999999444400000000000000000000000000000000
3333333333b333330000000000333000003330000033300000333000003330000000000000000000444444444444444400000000000000000000000000000000
33333333333333330000000000033000000330000003300000033000000330000000000000000000444444444444444400000000000000000000000000000000
9999999922222222444444444444444455555555555555555555555555555555555dd11111111111555dd1111111111100000000000000000000000000000000
999999992222222244444444444444445555555555555555555555555555555555ddd1111111111155ddd1111111111100077777777770000000000000000000
999999992222222244944444444444445555555555555555555555555555555555dd11112222111155dd11111111111100077777777777000000000000000000
999999992222222299444444444444445555555555555555555555555555555555dd11122222211155dd11112222111100066666666777700000050060000000
999999992222222244444554444444445555555ddddddddd555555555555555555d111122222221155d111122222211100000000000677700000500650500000
9999999922222222444994444444444455555ddddddddddddd5555555555555555d111222222222155d111122222221100000000000077700000506505060000
999999992222222244994444444444445555dddd1111111dddd555555555555555d111222222222255d111222222222100000700000077700006056655565000
99999999222222224444444444444444555ddd1111111111dddd55555555555555d111222222222255d111222222222200007700000077700000066666505000
99999999111111114444444444444444555dd111111111111dddd5555555555555d111222888822255d111222222222200077700000777700060566dd6650000
9999999911111111444444444444444455ddd1112222111111dddd555555555555d111222288222255d11112222222220077777777777770006056dddd650500
9999999911111111444444444444444455dd111222222111111dddd55555555555d111122222222255d11112222222220667777777777600000056dddd650500
9999999911111111444444444444444955dd1112222222111111ddd55555555555dd11122222222255dd11112222222100667766666660000000566dd6650000
9999999911111111444444444444449955d11122222222211111dddd55555555555d111122222221555d11111222222100066700000000000000056666500000
9999999911111111444544444444999455d111222222222211111ddd55555555555dd11112222221555dd1111122221100006600000000000000005555000000
4444444411111111445544444459444455d111222222222211111dddd55555555555d111112222115555d1111111111100000600000000000000000000000000
4444444411111111455444454444444455d1112222882222111111ddd55555555555dd11111111115555dd111111111100000000000000000000000000000000
4444444444444444444444444444444455d1112228888222111111dddd5555554494494444499494444444949494449444494949499444440000000000000000
4444dddd44444444ddddddddddd4444455d11122288882221111111ddd5555554444499499994499949449499499989999449944449444440000ddddd0000000
44ddffffddddddddffffffffffddd44455d11122228822221111111dddd55555444494999989499999999999999998999949999949494944000dd111ddd00000
4dfffffffffffffffffffffffffffdd455dd11122222222211111111ddd5555544449999998999888889999998999888899989999999444400dd111111dd0000
dfffffff6f5ffffffffffffffffffffd555d11122222222211111111dddd555544449949998999999889999998999999999989999944994400d11111111d0000
dffff6f665fffffffffffffffffffffd555dd11122222221111111111ddd555544994499999999998899999999999999988988999994494400d11222111dd000
dfffff5655fffffffffffffffffffffd5555d11112222221111111111dddd5554499999498889899999999889998899998999999994999440d1122222111d000
dffff566665ffffffffffffffffffffd5555dd11112222111111111111ddd5554444994999989989999899999998888998999999999449440d1128822111dd00
dffff56dd65ffffffffffffffffffffd55555d11111111111111111111ddd5554444944999889988999898899999999998999989994449440d11288221111d00
dffff56dd65ffffffffffffffffffffd55555d111111111111111111111ddd5544999994998899988898998999999999889998899444994400d1222221111d00
ddfff566665fffffffffffffffffffdd55555d111111111111111111111ddd5544449499999999999898989999888899899989999499944400d1122211111dd0
4dffff5555ffffffffffffffffffffd455555d111111111111111111111ddd55444449499999999999988899998889998999899999494944000d111111111dd0
44dffffffffffffffddfffffffffdd445555dd1111111111111111111111dd55449944499988999999999899999899999988899999994944000d1111111111dd
44ddfdffffffffddd44dddddffddd4445555dd1111111111111111111111dd55449994994999999999999999499989999999999494994444000d1111111111dd
444dddddddddddd444444444dd4444445555d11111111111111111111111dd5544449494449949449949999999499944494999449494444400d11111111111dd
44444444444444444444444444444444555dd11111111111111111111111dd554444994944444944444444944444949999444494999494440d111111111111dd
__map__
b1b1b1b1b1b1b1b1b1b1b1b100000000c3c3c3c3c3c3c3c3c3c3c3c3c3c3c3c3b1b1b1b1b1b1b1b1b1b1b1b10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c3c3c3c3c3c3c3c3c3c3c3c3c3c3c3c3
b1b1b1b1b1b1b1b1b1b1b1b100000000c3c3c3c3c3e8e9eaebecedc3c3c3c3c3b1b0b0b0b0b0b0b0b0b0b0b10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c3c3c3c3c3c0e0e1e2e3c0c3c3c3c3c3
a0b1b1b1b1b1b1b1b1b1b1a100000000c3c3c3c3c3f8f9fafbfcfdc3c3c3c3c3b1b0b0b0b0b0b0b0b0b0b0b10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c3c3c3c3c3c0f0f1f2f3c0c3c3c3c3c3
a086878687868786878687a100000000c3c3c3d2c3c3c3c3c3c3c3d2c3c3c3c3b1b0b0b0b0b0b0b0b0b0b0b10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c3c3c3c3c3c3c3c3c3c3c3c3c3c3c3c3
a096979697969796979697a100000000c3c7c7c7c7c7c7c7c7c7c7c4c5c6c7c3b1b0b0b0b0b0b0b0b0b0b0b10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c3c2c2c2c2c2c2c2c2c2c2c4c5c6c7c3
a086878687868786878687a100000000c3c7c7c7c7c7c7c7c7c7c7d4d5d6d7c3b1b0b0b0b0b0b0b0b0b0b0b10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c3c2c2c2c2c2c2c2c2c2c2d4d5d6d7c3
a096979697969796979697a100000000c3c7c7c7c7c7c7c7c7c7c7e4e5e6e7c3b1b0b0b0b0b0b0b0b0b0b0b10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c3c2c2c2c2c2c2c2c2c2c2e4e5e6e7c3
a086878687868786878687a100000000c3c7c7c7c7c7c7c7c7c7c7f4f5f6f7c3b1b0b0b0b0b0b0b0b0b0b0b10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c3c2c2c2c2c2c2c2c2c2c2f4f5f6f7c3
a096979697969796979697a100000000c3c0c0c0c0c0c0c0c0c0c0c0c0c0c0c2b1b0b0b0b0b0b0b0b0b0b0b10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c3c0c0c0c0c0c0c0c0c0c0c0c0c0c0c3
a086878687868786878687a100000000c3c0c0c0c0c0c0c0c0c0c0c0c0c0c0c3b1b0b0b0b0b0b0b0b0b0b0b10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c3c0c0c0c0c0c0cecfc0c0c0c0c0c0c3
a096979697969796979697a100000000d3c0c0c0c0c0c0c0c0c0c0c0c0c0c0c3b1b0b0b0b0b0b0b0b0b0b0b10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c3c0c0c0c0c0c0dedfc0c0c0c0c0c0c3
a086878687868786878687a100000000c3d0d0d0d0d0d0d0d0d0d0d0d0d0d0c3b1b0b0b0b0b0b0b0b0b0b0b10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c3d0d0d0d0d0d0d0d0d0d0d0d0d0d0c3
a086878687868786878687a100000000c3d0d0d0d0d0d0d0d0d0d0d0d0d0d0c2b1b0b0b0b0b0b0b0b0b0b0b10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c3d0d0d0d0d0d0d0d0d0d0d0d0d0d0c3
a096979697969796979697a100000000c3d0d0d0d0d0d0d0d0d0d0d0d0d0d0c3b1b0b0b0b0b0b0b0b0b0b0b10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c3d0d0d0d0d0d0d0d0d0d0d0d0d0d0c3
b1b1b1b1b1b1b1b1b1b1b1b100000000c3d0d0d0d0d0d0d0d0d0d0d0d0d0d0c3b1b0b0b0b0b0b0b0b0b0b0b10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c3d0d0d0d0d0d0d0d0d0d0d0d0d0d0c3
b1b1b1b1b1b1b1b1b1b1b1b100000000c3c3c3c3c3c3c3c3c3c3c3c3c3c3c3c3b1b1b1b1b1b1b1b1b1b1b1b10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c3c3c3c3c3c3c3c3c3c3c3c3c3c3c3c3
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
0001000034050370503b0500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000003b0503f0503f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000001015010150101501015010150101501015000000101501015000000101501015010150101500000010150101501015010150000000000000000000000000000000000000000000000000000000000000
0001000034050360502f0500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0001000030150331502f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0001000030100331002f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__music__
01 0002080c
00 0003090d
00 01040a0c
00 01050a0d
00 0002080c
00 0003090d
00 01060a0c
02 01070b0e

