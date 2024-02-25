lualut="D:\LuaLUT\LuaLUT\bin\Release\net6.0\LuaLUT.exe"

if [ "$1" == "preview" ]
then
	echo "========== Building Preview Image =========="
	$lualut --script "./lua/caustics.lua" --out "./preview/caustics-1.png" --img "PNG" --format "R" --type UNSIGNED_BYTE -w 128 -h 128 -d 32 -z 0
	$lualut --script "./lua/caustics.lua" --out "./preview/caustics-2.png" --img "PNG" --format "R" --type UNSIGNED_BYTE -w 128 -h 128 -d 32 -z 4
	$lualut --script "./lua/caustics.lua" --out "./preview/caustics-3.png" --img "PNG" --format "R" --type UNSIGNED_BYTE -w 128 -h 128 -d 32 -z 8
	$lualut --script "./lua/caustics.lua" --out "./preview/caustics-4.png" --img "PNG" --format "R" --type UNSIGNED_BYTE -w 128 -h 128 -d 32 -z 12
	$lualut --script "./lua/caustics.lua" --out "./preview/caustics-5.png" --img "PNG" --format "R" --type UNSIGNED_BYTE -w 128 -h 128 -d 32 -z 16
	$lualut --script "./lua/caustics.lua" --out "./preview/caustics-6.png" --img "PNG" --format "R" --type UNSIGNED_BYTE -w 128 -h 128 -d 32 -z 20
	$lualut --script "./lua/caustics.lua" --out "./preview/caustics-7.png" --img "PNG" --format "R" --type UNSIGNED_BYTE -w 128 -h 128 -d 32 -z 24
	$lualut --script "./lua/caustics.lua" --out "./preview/caustics-8.png" --img "PNG" --format "R" --type UNSIGNED_BYTE -w 128 -h 128 -d 32 -z 28
else
	echo "========== Building Final Image =========="
	$lualut --script "./lua/caustics.lua" --out "../src/shaders/textures/" --img "RAW" --format "R" --type UNSIGNED_BYTE -w 256 -h 256 -d 64
fi
