# kamermans/geoipupdate

A Dockerized version of `geoipupdate`, the MaxMind utility used for updating the GeoIP database.

## Updating the GeoIP-Lite database
The following command will download the latest GeoIP-Lite databases to `/tmp/geoip`:
```
docker run --rm -v /tmp/geoip:/data kamermans/geoipupdate
```

## Updating a paid GeoIP database
The following command will download the latest paid GeoIP databases to `/tmp/geoip`:
```
docker run --rm \
	-v /tmp/geoip:/data \
	-e "GEOIP_USER_ID=<user_id>" \
	-e "GEOIP_LICENSE_KEY=<license_key>" \
	-e "GEOIP_PRODUCT_IDS=<product_ids>" \
	kamermans/geoipupdate
```

> Note: You will need to replace `<user_id>`, `<license_key>`, and `<product_ids>` with the appropriate values from your MaxMind GeoIP license.
