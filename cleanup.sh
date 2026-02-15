NAME="Shrimple"

Remove () {
	echo "Removing [$1] profile"
	rm -rf "$2"
}


Remove "Fabric-Iris-1.20.1" "/f/Minecraft/Modrinth/profiles/Fabric-Iris-1.20.1/shaderpacks/$NAME"
# Remove "Fabric-Iris-1.20.4" "/f/Minecraft/Modrinth/profiles/Fabric-Iris-1.20.4/shaderpacks/$NAME"
Remove "Create-1.20.1" "/f/Minecraft/Modrinth/profiles/Create-1.20.1/shaderpacks/$NAME"
# Remove "1.21-DH" "/f/Minecraft/Modrinth/profiles/1.21-DH/shaderpacks/$NAME"
# Remove "1.21-pre" "/f/Minecraft/Modrinth/profiles/1.21-pre/shaderpacks/$NAME"
Remove "Iris 1.21.1" "/f/Minecraft/Modrinth/profiles/Iris 1.21.1/shaderpacks/$NAME"
Remove "Iris 1.21.2" "/f/Minecraft/Modrinth/profiles/Iris 1.21.2/shaderpacks/$NAME"
# Remove "Photonics" "/f/Minecraft/Modrinth/profiles/Photonics/shaderpacks/$NAME"
# Remove "Prism" "/f/Minecraft/PrismLauncher/instances/1.20.4/.minecraft/shaderpacks/$NAME"

echo "Cleanup Complete!"
