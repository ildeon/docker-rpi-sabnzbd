[![logo](https://raw.githubusercontent.com/ildeon/docker-rpi-sabnzbd/master/logo.png)](http://sabnzbd.org/)

# SaBnzbd for Raspberry pi. (tested on rpi 2 B)
> This docker image is installing SaBnzbd on your raspberry pi.

# How to run it
```
docker create --name sabnzdb-data \
              -v /etc/localtime:/etc/localtime:ro \
              -v <path to data>:/data \
              -v <path to config>:/config \
              ildeon7/rpi-sabnzdb /bin/true

docker run -d -p 8080:8080 --volumes-from sabnzdb-data ildeon7/rpi-sabnzdb
```
