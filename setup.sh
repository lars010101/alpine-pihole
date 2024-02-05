#!/bin/sh

# Install cloudflared
apk add bind-tools
wget https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-lin
ux-arm
mv -f ./cloudflared-linux-arm /usr/local/bin/cloudflared
mv ./init.d/cloudflared /etc/init.d/cloudflared
mv ./conf.d/cloudflared /etc/conf.d/cloudflared
chmod +x /usr/local/bin/cloudflared
chmod a+x /etc/init.d/cloudflared
adduser -s /usr/sbin/nologin -S -H cloudflared
rc-update add cloudflared default

# Verify installation
cloudflared -v
rc-service cloudflared start
dig @127.0.0.1 -p 5053 google.com

# Prepare to make persistent
lbu add /usr/local/bin/cloudflared /etc/init.d/cloudflared /etc/conf.d/cloudflared
