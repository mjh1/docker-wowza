#!/bin/bash

docker build -t alive-wowza .

mkdir -p $mounts_dir

docker run --name alive-wowza -d \
  --publish 1935:1935 --publish 8086:8086 \
  --publish 8087:8087 --publish 8088:8088 --publish 1044:1044 \
  --env "WOWZA_ACCEPT_LICENSE=yes" \
  --env "WOWZA_KEY=$wowza_license_key" \
  --volume $mounts_dir/alive-wowza/data:/var/lib/wowza \
  --volume $mounts_dir/alive-wowza/log:/var/log/wowza \
  alive-wowza

