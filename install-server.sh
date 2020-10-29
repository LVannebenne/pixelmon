#!/bin/bash

SRV="/var/srv"

if [ ! -d "$SRV/pixelmon/mods" ]; then
    mkdir -p "$SRV/pixelmon/mods"
    cp "$SRV/tmp/forge-installer.jar" "$SRV/pixelmon/"
    cp -R "$SRV/tmp/mods" "$SRV/pixelmon/"
    cd "$SRV/pixelmon" && \
    java -jar "$SRV/pixelmon/forge-installer.jar" --installServer && \
    ln -s "$SRV/pixelmon/forge-1.12.2-14.23.5.2854-universal.jar" "$SRV/pixelmon/forge.jar" && \
    rm -f "$SRV/pixelmon/forge-installer.jar" && \
    chmod +x "$SRV/pixelmon/start-server.sh"
    sh "$SRV/pixelmon/start-server.sh"
else
    echo "Server is already installed, starting..."
    cd "$SRV/pixelmon"
    sh "$SRV/pixelmon/start-server.sh"
fi
