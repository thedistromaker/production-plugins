#!/bin/bash
#
SLUG="immersive-vehicles"
echo " -> Fetching URL for mods..."
curl -s "https://api.modrinth.com/v2/project/$SLUG/version" | jq -r '[.[] | select(.game_versions[] == "1.20.1") | select(.loaders[] == "forge")] | first | .files[0].url' > wget-list
SLUG="minecraft-transit-railway"
curl -s "https://api.modrinth.com/v2/project/$SLUG/version" | jq -r '[.[] | select(.game_versions[] == "1.20.1") | select(.loaders[] == "forge")] | first | .files[0].url' >> wget-list
SLUG="effortless-building"
curl -s "https://api.modrinth.com/v2/project/$SLUG/version" | jq -r '[.[] | select(.game_versions[] == "1.20.1") | select(.loaders[] == "forge")] | first | .files[0].url' >> wget-list
SLUG="immersive-vehicles-official-content-pack"
curl -s "https://api.modrinth.com/v2/project/$SLUG/version" | jq -r '[.[] | select(.game_versions[] == "1.20.1") | select(.loaders[] == "forge")] | first | .files[0].url' >> wget-list
SLUG="jei"
curl -s "https://api.modrinth.com/v2/project/$SLUG/version" | jq -r '[.[] | select(.game_versions[] == "1.20.1") | select(.loaders[] == "forge")] | first | .files[0].url' >> wget-list
SLUG="cc-tweaked"
curl -s "https://api.modrinth.com/v2/project/$SLUG/version" | jq -r '[.[] | select(.game_versions[] == "1.20.1") | select(.loaders[] == "forge")] | first | .files[0].url' >> wget-list
SLUG="simple-voice-chat"
curl -s "https://api.modrinth.com/v2/project/$SLUG/version" | jq -r '[.[] | select(.game_versions[] == "1.20.1") | select(.loaders[] == "forge")] | first | .files[0].url' >> wget-list
SLUG="the-tube"
curl -s "https://api.modrinth.com/v2/project/$SLUG/version" | jq -r '[.[] | select(.game_versions[] == "1.20.1") | select(.loaders[] == "forge")] | first | .files[0].url' >> wget-list
SLUG="mtr-london-underground-trains"
curl -s "https://api.modrinth.com/v2/project/$SLUG/version" | jq -r '[.[] | select(.game_versions[] == "1.20.1") | select(.loaders[] == "forge")] | first | .files[0].url' >> wget-list
echo " -> Starting mod downloads..."
mkdir dl
wget -i wget-list -q --show-progress -P dl/
wget -q --show-progress -O dl/WorldEdit-Forge-1.20.1.jar https://www.curseforge.com/api/v1/mods/225608/files/4586218/download
cd dl/
mkdir mods
mv *.jar mods/
cd ..
wget -q --show-progress -O dl/forge-1.20.1-47.4.10.jar https://maven.minecraftforge.net/net/minecraftforge/forge/1.20.1-47.4.10/forge-1.20.1-47.4.10-installer.jar
#wget -q --show-progress -O dl/setup.bat https://raw.githubusercontent.com/thedistromaker/production-plugins/modded/scripting/setup-windows.bat
#wget -q --show-progress -O dl/setup.sh https://raw.githubusercontent.com/thedistromaker/production-plugins/modded/scripting/setup-generic.sh
echo " -> Making ZIP file for users..."
cd dl/
zip -r ../modpack-craftmodded.zip .
cd ..
echo "$(date +%d-%m-%Y_%H-%M)" > timestamp.build
mkdir build-info
mv timestamp.build build-info/
echo " -> Making build zipfiles..."
tar --zstd -cvf ../build.tar.zst .
tar -cvf ../build.tar .
zip -r ../build.zip .
exit 0
