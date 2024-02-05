#!/bin/sh
apk update
apk upgrade
apk add bind-tools

# Install cloudflared
wget https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-lin
ux-arm
mv -f ./cloudflared-linux-arm /usr/local/bin/cloudflared
mv ./init.d/cloudflared /etc/init.d/cloudflared
chmod +x /usr/local/bin/cloudflared
chmod a+x /etc/init.d/cloudflared
adduser -s /usr/sbin/nologin -S -H cloudflared
# Verify installation
cloudflared -v
/etc/init.d/cloudflared start
dig @127.0.0.1 -p 5053 google.com

# Install pihole
vi /etc/apk/repositories   # enable the edge community repository
apk update
apk add bash
git clone https://gitlab.com/yvelon/pi-hole
cd pi-hole
bash automated\ install/basic-install.sh
