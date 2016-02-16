FROM armbuild/debian:jessie
MAINTAINER ildeon

RUN echo "deb http://ppa.launchpad.net/jcfp/ppa/ubuntu precise main" | tee -a /etc/apt/sources.list && \
    apt-key adv --keyserver hkp://pool.sks-keyservers.net:11371 --recv-keys 0x98703123E0F52B2BE16D586EF13930B14BB9F05F && \
    apt-get update &&\
    apt-get install python-gdbm python-cheetah python-openssl par2 unzip wget sabnzbdplus build-essential -y && \
    adduser --system -shell "/bin/bash" --uid 1000 --disabled-password --group --home /var/lib/sabnzbd sabnzbd && \
    groupadd media && \
    usermod -a -G media sabnzbd

# RAR
RUN  wget rarlab.com/rar/unrarsrc-5.2.6.tar.gz && \
  tar -xvf unrarsrc-5.2.6.tar.gz && \
  cd unrar && \
  make -f makefile && \
  install -v -m755 unrar /usr/bin && \
  rm -rf unrarsrc-5.2.6.tar.gz && rm -rf unrarsrc-5.2.6

RUN apt-get -y autoremove && \
  apt-get -y clean && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /tmp/*

RUN mkdir -p /config && chown sabnzbd:sabnzbd /config
RUN mkdir /data && chown sabnzbd:media /data

VOLUME ["/config", "/downloads"]

EXPOSE 8080 9090

USER sabnzbd

CMD ["/usr/bin/sabnzbdplus","--config-file","/config","--console","--server", "0.0.0.0:8080"]
