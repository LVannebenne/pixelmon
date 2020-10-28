FROM alpine:3.7

ENV Xms=1G
ENV Xmx=7G

RUN apk add --update --no-cache openjdk8-jre wget && \
mkdir -p /var/srv/tmp && \
pwd

# RUN mkdir -p /var/srv/pixelmon/mods && \
# wget -O /var/srv/pixelmon/forge-installer.jar https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.12.2-14.23.5.2854/forge-1.12.2-14.23.5.2854-installer.jar && \
# wget -O /var/srv/pixelmon/mods/spongeforge.jar https://repo.spongepowered.org/maven/org/spongepowered/spongeforge/1.12.2-2838-7.2.2/spongeforge-1.12.2-2838-7.2.2.jar && \
# wget -O /var/srv/pixelmon/mods/Pixelmon-server.jar https://download.nodecdn.net/containers/reforged/server/release/8.1.2/Pixelmon-1.12.2-8.1.2-server.jar && \
# cd /var/srv/pixelmon && \
# touch /var/srv/pixelmon/eula.txt && \
# echo eula=true >> eula.txt && \
# java -jar /var/srv/pixelmon/forge-installer.jar --installServer && \
# ln -s /var/srv/pixelmon/forge-1.12.2-14.23.5.2854-universal.jar /var/srv/pixelmon/forge.jar && \
# rm -f /var/srv/pixelmon/forge-installer.jar && \
# echo \#\!/bin/sh > /var/srv/pixelmon/start-server.sh && \
# echo cd '"$(dirname "$(readlink -fn "$0")")"' >> /var/srv/pixelmon/start-server.sh && \
# echo java -Xms${Xms} -Xmx${Xmx} -jar /var/srv/pixelmon/forge-1.12.2-14.23.5.2854.jar >> /var/srv/pixelmon/start-server.sh && \
# chmod +x /var/srv/pixelmon/start-server.sh

COPY ./install-server.sh /var/srv/

RUN chmod +x /var/srv/install-server.sh && \
wget -O /var/srv/tmp/forge-installer.jar https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.12.2-14.23.5.2854/forge-1.12.2-14.23.5.2854-installer.jar && \
wget -O /var/srv/tmp/spongeforge.jar https://repo.spongepowered.org/maven/org/spongepowered/spongeforge/1.12.2-2838-7.2.2/spongeforge-1.12.2-2838-7.2.2.jar && \
wget -O /var/srv/tmp/Pixelmon-server.jar https://download.nodecdn.net/containers/reforged/server/release/8.1.2/Pixelmon-1.12.2-8.1.2-server.jar

CMD ["/bin/sh", "/var/srv/install-server.sh"]