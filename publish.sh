NAME="Shrimple"

Publish () {
	echo "Copy to [$1] profile"
	mkdir -p "$2"
	cp -p -R * "$2"
}


cd src/shaders/template
./update.sh

cd ..
# Publish "Iris-1.18.2" "/f/Minecraft/Modrinth/profiles/Iris 1.18.2/shaderpacks/$NAME/shaders"
# Publish "Fabric-Iris-1.20.1" "/f/Minecraft/Modrinth/profiles/Fabric-Iris-1.20.1/shaderpacks/$NAME/shaders"
# Publish "Fabric-Iris-1.20.4" "/f/Minecraft/Modrinth/profiles/Fabric-Iris-1.20.4/shaderpacks/$NAME/shaders"
Publish "Create-1.20.1" "/f/Minecraft/Modrinth/profiles/Create-1.20.1/shaderpacks/$NAME/shaders"
Publish "Create-NEO" "/f/Minecraft/Modrinth/profiles/Create-NEO/shaderpacks/$NAME/shaders"
# Publish "1.21-DH" "/f/Minecraft/Modrinth/profiles/1.21-DH/shaderpacks/$NAME/shaders"
# Publish "1.21-pre" "/f/Minecraft/Modrinth/profiles/1.21-pre/shaderpacks/$NAME/shaders"
# Publish "Iris 1.21.1" "/f/Minecraft/Modrinth/profiles/Iris 1.21.1/shaderpacks/$NAME/shaders"
# Publish "Iris 1.21.4" "/f/Minecraft/Modrinth/profiles/Iris 1.21.4/shaderpacks/$NAME/shaders"
# Publish "Photonics" "/f/Minecraft/Modrinth/profiles/Photonics/shaderpacks/$NAME/shaders"
# Publish "Prism" "/f/Minecraft/PrismLauncher/instances/1.20.4/.minecraft/shaderpacks/$NAME/shaders"
# Publish "Iris 1.21.6" "/f/Minecraft/Modrinth/profiles/Iris 1.21.6/shaderpacks/$NAME/shaders"
Publish "Iris 1.21.8" "/f/Minecraft/Modrinth/profiles/Iris 1.21.8/shaderpacks/$NAME/shaders"
# Publish "Iris 1.21.9" "/f/Minecraft/Modrinth/profiles/Iris 1.21.9/shaderpacks/$NAME/shaders"
Publish "Iris 1.21.10" "/f/Minecraft/Modrinth/profiles/Iris 1.21.10/shaderpacks/$NAME/shaders"
Publish "Iris 1.21.11" "/f/Minecraft/Modrinth/profiles/Iris 1.21.11/shaderpacks/$NAME/shaders"
Publish "Voxy" "/f/Minecraft/Modrinth/profiles/Voxy/shaderpacks/$NAME/shaders"

echo "Publish Complete!"
