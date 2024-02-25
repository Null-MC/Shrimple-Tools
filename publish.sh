'/d/MC-APM/MC-APM/bin/Release/net8.0/MC-APM.exe' item './src/shaders/item.properties' './src/shaders/lib/items.glsl' -t 'item-template.properties'
'/d/MC-APM/MC-APM/bin/Release/net8.0/MC-APM.exe' block './src/shaders/block.properties' './src/shaders/lib/blocks.glsl' -t 'block-template.properties'
'/d/MC-APM/MC-APM/bin/Release/net8.0/MC-APM.exe' entity './src/shaders/entity.properties' './src/shaders/lib/entities.glsl' -t 'entity-template.properties'

cd src/shaders

echo "Copy to [Fabric-Iris-1.20.1] profile"
mkdir -p "/f/Minecraft/Modrinth/profiles/Fabric-Iris-1.20.1/shaderpacks/Shrimple/shaders"
cp -p -R * "/f/Minecraft/Modrinth/profiles/Fabric-Iris-1.20.1/shaderpacks/Shrimple/shaders"

echo "Copy to [Fabric-Iris-1.20.4] profile"
mkdir -p "/f/Minecraft/Modrinth/profiles/Fabric-Iris-1.20.4/shaderpacks/Shrimple/shaders"
cp -p -R * "/f/Minecraft/Modrinth/profiles/Fabric-Iris-1.20.4/shaderpacks/Shrimple/shaders"

echo "Copy to [Create] profile"
mkdir -p "/f/Minecraft/Modrinth/profiles/Create/shaderpacks/Shrimple/shaders"
cp -p -R * "/f/Minecraft/Modrinth/profiles/Create/shaderpacks/Shrimple/shaders"

echo "Publish Complete!"
