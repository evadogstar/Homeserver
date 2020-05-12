## Required actions before running docker-compose.yml
#!/bin/bash
# Create PiHole log file
touch ${USERDIR}/docker/pihole/var-log/pihole.log

# Create Traefik files
touch $USERDIR/docker/traefik/traefik.log
touch ${USERDIR}/docker/traefik/acme.json
chmod 600 $USERDIR/docker/traefik/acme.json
wget -P $USERDIR/docker/traefik https://raw.githubusercontent.com/zilexa/Mediaserver/master/traefik/traefik.toml

# Create Firefox-Syncserver file & generate secret
touch $USERDIR/docker/firefox-syncserver/secret/secret.txt
sed -i '1s/^/[syncserver]\n/' $USERDIR/docker/firefox-syncserver/secret/secret.txt
head -c 20 /dev/urandom | sha1sum >> $USERDIR/docker/firefox-syncserver/secret/secret.txt