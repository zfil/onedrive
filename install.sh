#!/bin/bash

set -xeu

install -D pkg/onedrive /usr/local/bin/onedrive
install -D pkg/onedrive.1 /usr/local/share/man/man1/onedrive.1
for i in pkg/README.md pkg/docs/* pkg/config pkg/LICENSE pkg/CHANGELOG.md ; do install -D -m 644 $i /usr/local/share/doc/onedrive/$i ; done
install -D -m 644 pkg/onedrive.service /usr/lib/systemd/user/onedrive.service
