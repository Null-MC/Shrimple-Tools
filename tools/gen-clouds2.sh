lualut="D:\LuaLUT\LuaLUT\bin\Release\net6.0\LuaLUT.exe"

# $lualut --script "./lua/clouds2.lua" --out "./preview/clouds2-xy.png" --img "PNG" --format "R" --type UNSIGNED_BYTE -w 256 -h 32 -d 256 -z 8
$lualut --script "./lua/clouds2.lua" --out "./preview/clouds-xz.png" --img "PNG" --format "R" --type UNSIGNED_BYTE -w 512 -h 16 -d 512 -y 16
$lualut --script "./lua/clouds2.lua" --out "../src/shaders/textures/" --img "RAW" --format "RED" --type UNSIGNED_BYTE -w 512 -h 16 -d 512
