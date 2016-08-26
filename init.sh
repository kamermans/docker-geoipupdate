#!/bin/bash -e

CONFIG_FILE="/etc/GeoIP.conf"

# Taken from Maxmind documentation: http://dev.maxmind.com/geoip/geoipupdate/
GEOIP_USER_ID=${GEOIP_USER_ID:-999999}
GEOIP_LICENSE_KEY=${GEOIP_LICENSE_KEY:-000000000000}
GEOIP_PRODUCT_IDS=${GEOIP_PRODUCT_IDS:-"GeoLite2-City GeoLite2-Country GeoLite-Legacy-IPv6-City GeoLite-Legacy-IPv6-Country 506 517 533"}

cat << EOF > $CONFIG_FILE
# GeoIP.conf file - used by geoipupdate program to update databases
# from http://www.maxmind.com
UserId $GEOIP_USER_ID
LicenseKey $GEOIP_LICENSE_KEY
ProductIds $GEOIP_PRODUCT_IDS
DatabaseDirectory /data

EOF

geoipupdate -f /etc/GeoIP.conf -v
