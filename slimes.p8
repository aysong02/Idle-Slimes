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
#include src/helper/textbox.lua
#include src/helper/click.lua
#include src/shop.lua
#include src/slime/poop.lua
#include src/cursor.lua
#include src/crops/crops.lua
__gfx__
00000000000000000000000000bb7700000000000000000000000000000000000055000005757550000000000000000000000000000000000000077777777000
000000000000000000bb77000bbbbb7000bb77000000000000000000000000000577550005757575000000000000000000000000000000000000777777777700
000000000bbbb7700bbbbb700bbabab00bbbbb70000000000abbcc100abbcc100557775005757575000066666677000000000066670000000007777777777770
00000000bbbbbbb7bbbabbab0bbbbbb00bbbbbb000000000abbcc112abbcc1120557777555777775000666666666700000000655557000000077777777777777
00000000bbbabbabbbbbbbbb0bbbbbb00bbabab00bbbb770bbc71172bbc711725657777565777775016666555566671000000665566000000077777777777777
00000000bbbbbbbb3bbbbbbb033bbbb00bbbbbb0bbbbbbb7bcc11228bcc11228566777756677777501666565b656671000000666666000000077777777777777
0000000033bbbbbb03bbbbb000333300033bbbb033babbab55112288551122880566677556667775016665655656671000006666666600000077777777777777
00000000033333300333333000000000033333303333333305555550055555500055666505566650006665666656660000006666666600000007777777777770
00000000000000000000000000a00a0000a00a00000000000000000000000000000000000067770000666655556666000000666bb66600000000777777777700
00000000000000000000000000000000000000000000000000000000000000000055555000677700005666666666650000066665566660000000077777777000
000000000000000000000000a0aaaa0aa0aaaa0a00000000006660000899aab00575757500677700005566666666550000566666666665000000000000000000
0bbbb770000000000000000000aaaa0000666a000066600006666660899aabbc05777775006777000055555555555500005666d66d6665000077000000000000
bbbbbbb70bbbb7700000000000aaaa0006666660066666606555556699a7bb7c5677777566777777000555555555500000556666666655000077000000000000
bbbabbabbbbbbbb70bbb7770a0aaaa0a655555666555556655c55c569aabbcc15677777506777770000055555555000000055666666550000000000000000000
33bbbbbb33babbab33babbab0000000055555556555555565c51c51555bbcc110566777500677700000000000000000000005555555500007000000000000000
03333330333333333333333300a00a00065556600655566000100100055555500056665000067000000000000000000000000000000000000000000000000000
07070070070007000000000000000000000000000000000000000bbb777000000000000000000000444444444444444444444444444444449999999999999999
737377b773707370050500d00500050000000000000000000000bbbbbbb700000000000000000000449999999999444444444444444444449999999999999999
7b3733377bb77b770d5055500dd00d000000000000000000000bbbbbbbbb70000000000000000000444444444444444444444444449994444444444444444444
7777bb70073bb3b70000dd00005dd5d00000000000000000000bbbbbbbbbb0000000000000000000444444444444444449999994444444444444444444444444
073b7700073b3b37005d0000005d5d500000000000000000000bbbbabbabb0000000000000000000444499999999999444444444444444444444444444444444
0073377073b377700005500005d50000000bbbbbb7777000000bbbbbbbbbb0000000000000000000444444444444444449900000000009944444444444444444
00077b370737337000000d500050550000bbbbbbbbbbb700000bbbbbbbbbb0000000000000000000444444444444444499900000000009994444499999994444
000007700070770000000000000000000bbbbbbbbbbbbb70000bbbbbbbbbb0000000000000000000999999999999444499900000000009994444499999994444
000000000000000008800880000060500bbbbbbbbbbbbbb0000bbbbbbbbbb0000000000000000000444444444444444499900000000009994444499999994444
000000000000000088888788060665000bbbbbbbabbbabb0000bbbbbbbbbb00000bbbbbbbb777700444444444444444499900000000009994444499999994444
000070000007070088888878005655000bbbbbbbbbbbbbb000033bbbbbbbb0000bbbbbbbbbbbbb70444444999999999999900000000009994444499999994444
000777000000700088888878056666500bbbbbbbbbbbbbb0000333bbbbbb3000bbbbbbbbbbbbbbb7444444444444444499900000000009994444499999494444
000070000007070088888888056dd650033bbbbbbbbbbbb00000333333330000bbbbbbbbbabbbabb444444444444444499955555555559994444499999994444
000000000000000008888880056dd6500333bbbbbbbbbb30000003333330000033bbbbbbbbbbbbbb999999999944444499955555555559994444499999994444
0000000000000000008888000566665000333333333333000000000000000000333bbbbbbbbbbb33444444444444444499955555555559994444499999994444
00000000000000000008800000555500000333333333300000000000000000000333333333333330444444444444444499333333333333994444499999994444
77777777777777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
56666666666666670000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
56699999999996670000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
56699444444996670000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
56644499994996670000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
56444444444555670000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
56454611d64555670000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
564441111d4655670000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
566441181d4655670000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
56644111114655670000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
56644999994656670000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
56644444444456670000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
56644444444446670000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
56644444444446670000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
56666666666666670000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555555555550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
77777777777777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
56666666666666670000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
56666666666666670000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
56666666666666670000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
56666666666666670000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
56666666666666670000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
56666666666666670000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
56666666666666670000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
56666666666666670000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
56666666666666670000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
56666666666666670000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
56666666666666670000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
56666666666666670000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
56666666666666670000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
56666666666666670000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555555555550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000444444440444444033333333333333333333b333333333330000000000000000000330330000000000000000000009005555555555555555
00000000000000004444444404999940333333b3333b3333333b3333333333b3000000000000000000033330000000000000000000009a005ffffffffffffff5
0000000000000000444444440444444033b3333b3333b333333b333333333b3300000000000bbb000333b00000000000000000000009aa005ffffffffffffff5
0000000000000000000400490499a940333b3333b3333b3333bb33333b333b330000000000bbb000330bb033000dd000000dd000009aaa005ffffffffffffff5
009900099000990055545549049999403333b3333333333333333333b333bb3300000000000bb000000b333000deed0000deed00009aaa005ffffffffffffff5
004900049000490055595549049a994033333333333333333333b333b33333330b0000b0000bbb000333b3000deeeed30deeeed3000aaa005ffffffffffffff5
0049000490004900333333490499a9403b33333b333b3333333b333bb33333330bbbbbb000bbb000330bb00000deed3000deed300000aa005ffffffffffffff5
9949999499994999333333490444444033b33333b333b333333b3333333333b3000bb000000bb000000bb000033dd000033dd08000000a005ffffffffffffff5
44444444444444444444455555554444333b33333b333b3333bb333333333b3300000000000a800000000000330bb033380bb033000000005ffffffffffffff5
004900049000490044444999999944443333333333333333333333333b333b330000000000a9aa0000000000000b3330000b3330000000005ffffffffffffff5
004900049000490044444999999994443b33333b3333333333333333b333bb33000000000daaada0000000000333b0000333b800000000005ffffffffffffff5
0049000490004900000409999999994433b33333b33b33333333b333b3333333000000000a2aaaa000000000330bb033380bb033000000005ffffffffffffff5
99499994999949995554544444449994333b33333b33b333333b333bb33333b30000000002aaaa5000000000000b3330000b3338000000005ffffffffffffff5
4444444444444444555959494944499933333b3333333b33333b333333333b33000000000a2aaea0000000000333b3000333b800000000005ffffffffffffff5
00490004900049003333394949494499333333b33333333333bb333333333b330000000000a2aa0000000000330bb0003808b000000000005ffffffffffffff5
004900049000490033333949494949493333333b33333333333333333333bb33000000000000000000000000000bb000000bb000000000005555555555555555
3333339999333333000000000000000000000000000000000009a000000000000000000000000000000000000000000000000000000000004444444444444444
3333334949333333000000000000000000000000000bb00000aa8a00000000000000000000002200000000000000000004444444444440004444444444444444
3333339999333333000000000000000000000000000bb00000b1ab00000000000000000000002220000444444444400004444444444440004444aaaaaaaa4444
3333334949333333000000000000000000000000003bbb0000badb0000000000000660000000022000049999999940000444aaaaaa444000444999999999a444
3333339999333333000000000000000000000000003bbb0000b2ab00000000000d0d60600022000000044444444440000449999999a440004499999999999a44
33333349493333330000000000000000000bb000003bbb0000bbbb000600006000dd66000222000000049999999940000449999999a440004499999999999a44
3333339999333333000000000000000000bbbb00333bbbbb333bbbbb06666660000d60000220000000049999999940000449999999a440004499999999999a44
3333334949333333000000000000000000bbbb0003333b300333bb3000066000000d60000000000000049999999940000449999999a440004499999999999a44
33333333333b33330000000000000000003bbb00003333000033330000000000000ee0000000000000049999999940000449999999a440004499999999999a44
33333333333b333300000000000bb0000033bb0003333bb003333bb000d00600002eee0000000800000499999999400004499999999770004499999999999a44
3333333333333333000000000003b000000330000003300000033000000d60000e02e0e000288880000499999999400004449999994770004499999999999a44
33333333333333b30000000000033b0000033bb000033bb000033bb0060d60602e02e02e00288880000499999999400004444444477777704499999999999a44
33333333333333b3000bb00000333000033330000333300003333000d60d60d62e22e02e02288800000499999999400004444444477777704449999999999444
3333333333b3333300033b0000033b0000033b0000033b0000033b0006dd60d00e22ee2000222200000499999999400000000000000770004444999999994444
3333333333b333330033300000333000003330000033300000333000d60d66d02e02ee2000002000000444444444400000000000000770004444444444444444
33333333333333330003300000033000000330000003300000033000060d60d00e02e02000000000000000000000000000000000000000004444444444444444
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
b13a3b3a3b3a3b3a3b3a3bb100000000c3c3c3c3c3c3c3c3c3c3c3c3c3c3c3c33b3a3b3a3b3a3b3e3f3a3b3a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004400000000000000000000000000000000
b12a2b2a2b2c2d2a2b2a2bb100000000c3c3c3c3c3e8e9eaebecedc3c3c3c3c3828282828282829293828282000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004400000000000000000000000000000000
a03a3b3a3b3c3d3a3b3a3ba100000000c3c3c3c3c3f8f9fafbfcfdc3c3c3c3c3b1b0b0b0b0b0b0b0b0b0b0b1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004400000000000000000000000000000000
a086878687868786878687a100000000c3c3c3d2c3c3c3c3c3c3c3d2c3c3c3c3b1b0b0b0b0b0b0b0b0b0b0b1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004400000000000000000000000000000000
a096979697969796979697a100000000c3c7c7c7c7c7c7c7c7c7c7c4c5c6c7c3b1b0b0b0b0b0b0b0b0b0b0b1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004400000000000000000000000000000000
a086878687868786878687a100000000c3c7c7c7c7c7c7c7c7c7c7d4d5d6d7c3b1b0b0b0b0b0b0b0b0b0b0b1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004400000000000000000000000000000000
a096979697969796979697a100000000c3c7c7c7c7c7c7c7c7c7c7e4e5e6e7c3b1b0b0b0b0b0b0b0b0b0b0b1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a086878687868786878687a100000000c3c7c7c7c7c7c7c7c7c7c7f4f5f6f7c3b1b0b0b0b0b0b0b0b0b0b0b1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a096979697969796979697a100000000c3c0c0c0c0c0c0c0c0c0c0c0c0c0c0c2b1b0b0b0b0b0b0b0b0b0b0b1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a086878687868786878687a100000000c3c0c0c0c0c0c0c0c0c0c0c0c0c0c0c3b1b0b0b0b0b0b0b0b0b0b0b1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a096979697969796979697a100000000d3c0c0c0c0c0c0c0c0c0c0c0c0c0c0c3b1b0b0b0b0b0b0b0b0b0b0b1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a086878687868786878687a100000000c3d0d0d0d0d0d0d0d0d0d0d0d0d0d0c3b1b0b0b0b0b0b0b0b0b0b0b1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a086878687868786878687a100000000c3d0d0d0d0d0d0d0d0d0d0d0d0d0d0c2b1b0b0b0b0b0b0b0b0b0b0b1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a096979697969796979697a100000000c3d0d0d0d0d0d0d0d0d0d0d0d0d0d0c3b1b0b0b0b0b0b0b0b0b0b0b1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
b1b1b1b1b1b1b1b1b1b1b1b100000000c3d0d0d0d0d0d0d0d0d0d0d0d0d0d0c3b1b0b0b0b0b0b0b0b0b0b0b1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
b1b1b1b1b1b1b1b1b1b1b1b100000000c3c3c3c3c3c3c3c3c3c3c3c3c3c3c3c3b1b1b1b1b1b1b1b1b1b1b1b1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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

