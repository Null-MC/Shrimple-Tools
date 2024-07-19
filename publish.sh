Publish () {
	echo "Copy to [$1] profile"
	mkdir -p "$2"
	cp -p -R * "$2"
}


cd src/shaders/template
./update.sh

cd ..
Publish "Fabric-Iris-1.20.1" "/f/Minecraft/Modrinth/profiles/Fabric-Iris-1.20.1/shaderpacks/Shrimple/shaders"
Publish "Fabric-Iris-1.20.4" "/f/Minecraft/Modrinth/profiles/Fabric-Iris-1.20.4/shaderpacks/Shrimple/shaders"
Publish "Create-1.20.1" "/f/Minecraft/Modrinth/profiles/Create-1.20.1/shaderpacks/Shrimple/shaders"
Publish "Create-1.20.1" "/f/Minecraft/Modrinth/profiles/Create-1.20.1/shaderpacks/Shrimple/shaders"
Publish "1.21-DH" "/f/Minecraft/Modrinth/profiles/1.21-DH/shaderpacks/Shrimple/shaders"
Publish "1.21-pre" "/f/Minecraft/Modrinth/profiles/1.21-pre/shaderpacks/Shrimple/shaders"
# Publish "Prism" "/f/Minecraft/PrismLauncher/instances/1.20.4/.minecraft/shaderpacks/Shrimple/shaders"

echo "Publish Complete!"
