#!/bin/bash

if [[ -x ./pkg ]]; then
  rm -fr pkg
  mkdir pkg
fi
docker build -t onedrive .
docker create --name onedrive onedrive
for i in onedrive onedrive.1 contrib/logrotate/onedrive.logrotate contrib/systemd/onedrive.service contrib/systemd/onedrive@.service README.md docs config LICENSE CHANGELOG.md; do
  docker cp onedrive:/root/onedrive/$i pkg
done
docker rm onedrive
docker rmi onedrive
