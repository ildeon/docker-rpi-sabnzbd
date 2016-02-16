#!/usr/bin/env bash
docker create --name sabnzbd-data -v /etc/localtime:/etc/localtime:ro ildeon7/rpi-sabnzbd /bin/true
docker run --rm --name sabnzbd --volumes-from sabnzbd-data -p 8081:8080 ildeon7/rpi-sabnzbd
