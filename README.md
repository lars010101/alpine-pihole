Objectives:

1. Make use of Cloudflared for DNS-over-HTTPS
       - git clone this repo onto Raspberry Pi 2B
   
3. Install and run Pihole on Alpine Linux, Raspberry Pi 2B (armv7)
      - create own qemu virtual machine on PC:
        git clone https://github.com/lars010101/skill-qemu-alpine (use the armv7 folder)
      - git clone https://gitlab.com/lars010101/pi-hole
        install/compile on virtual machine to create pihole-FTL binary (--ignore-edge-repo-check)
        transfer /usr/bin/pihole-FTL from VM to Raspberry 
        install pihole on Raspberry Pi using local FTL file (--ignore-edge-repo-check --ftl-file)
          - Avoids edge repositories and stay on official release branch
          - Avoids precompiled Pihole-FTL binaries
