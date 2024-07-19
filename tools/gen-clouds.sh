lualut="D:\LuaLUT\LuaLUT\bin\Release\net6.0\LuaLUT.exe"

$lualut --script "./lua/clouds.lua" --out "./preview/clouds-xy.png" --img "PNG" --format "R" --type UNSIGNED_BYTE -w 256 -h 256 -d 16 -z 8
$lualut --script "./lua/clouds.lua" --out "./preview/clouds-xz.png" --img "PNG" --format "R" --type UNSIGNED_BYTE -w 256 -h 256 -d 16 -y 128
$lualut --script "./lua/clouds.lua" --out "../src/shaders/textures/" --img "RAW" --format "RED" --type UNSIGNED_BYTE -w 256 -h 256 -d 16
