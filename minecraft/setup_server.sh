apk update
apk add curl jq openjdk17
cd /server

LATEST_VERSION=`curl https://launchermeta.mojang.com/mc/game/version_manifest.json | jq -r '.latest.release'`

if [ -z "$VANILLA_VERSION" ] || [ "$VANILLA_VERSION" == "latest" ]; then
  MANIFEST_URL=$(curl https://launchermeta.mojang.com/mc/game/version_manifest.json | jq .versions | jq -r '.[] | select(.id == "'$LATEST_VERSION'") | .url')
else
  MANIFEST_URL=$(curl https://launchermeta.mojang.com/mc/game/version_manifest.json | jq .versions | jq -r '.[] | select(.id == "'$VANILLA_VERSION'") | .url')
fi

DOWNLOAD_URL=`curl $MANIFEST_URL | jq .downloads.server | jq -r '. | .url'`

curl -o server.jar $DOWNLOAD_URL
jar xf server.jar version.json
JAVA_VERSION=$(jq '.java_version' version.json)
rm version.json
apk del openjdk17
apk add openjdk$JAVA_VERSION