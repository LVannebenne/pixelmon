FROM alpine:3.7

ENV Xms=1G
ENV Xmx=7G

RUN apk add --update --no-cache openjdk8-jre wget && \
mkdir -p /var/srv/tmp/mods && \
pwd

COPY ./install-server.sh /var/srv/
COPY ./mods.tar.gz /var/srv/tmp

RUN chmod +x /var/srv/install-server.sh && \
wget -O /var/srv/tmp/forge-installer.jar https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.12.2-14.23.5.2854/forge-1.12.2-14.23.5.2854-installer.jar && \
wget -O /var/srv/tmp/mods/spongeforge.jar https://repo.spongepowered.org/maven/org/spongepowered/spongeforge/1.12.2-2838-7.2.2/spongeforge-1.12.2-2838-7.2.2.jar && \
wget -O /var/srv/tmp/mods/Pixelmon-server.jar https://download.nodecdn.net/containers/reforged/server/release/8.1.2/Pixelmon-1.12.2-8.1.2-server.jar && \
tar -xvf /var/srv/tmp/mods.tar.gz -C /var/srv/tmp/mods

CMD ["/bin/sh", "/var/srv/install-server.sh"]