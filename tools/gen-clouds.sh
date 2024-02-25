lualut="D:\LuaLUT\LuaLUT\bin\Release\net6.0\LuaLUT.exe"

$lualut --script "./lua/clouds.lua" --out "./preview/clouds.png" --img "PNG" --format "R" --type UNSIGNED_BYTE -w 128 -h 128 -d 32 -z 8
$lualut --script "./lua/clouds.lua" --out "../src/shaders/textures/" --img "RAW" --format "RED" --type UNSIGNED_BYTE -w 128 -h 128 -d 32
