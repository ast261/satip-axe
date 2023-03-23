# libc6-sh4-cross doesn't contain libcrypt1 anymore, 
# see https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=993755
FROM debian:stretch-slim

WORKDIR /build

RUN apt-get -y update && \
  apt-get -y install \
    build-essential \
    python3-minimal \
    git-core \
    wget \
    u-boot-tools \
    bsdmainutils \
    patch \
    fakeroot \
    subversion \
    gcc-sh4-linux-gnu && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists
  # make gcc git python wget tar \
   #              bzip2 uboot-tools patch fakeroot \
    #             svn file autoconf automake libtool \
     #            texinfo 
     
RUN apt-get -y update && \
  apt-get -y install cpio autoconf libtool shtool pkg-config texinfo

RUN apt-get -y install libssl-dev

RUN cp /usr/include/x86_64-linux-gnu/openssl/opensslconf.h /usr/include/openssl/

#RUN dpkg --add-architecture sh4 && \
#  apt-get -y install debian-ports-archive-keyring && \
#  echo "deb http://ftp.ports.debian.org/debian-ports/ sid main" >> /etc/apt/sources.list && \
#  apt-get -y update && apt-get -y upgrade

#RUN apt-get -y install libc6:sh4

# Required for git operations when container is running as an UID that doesn't exist in /etc/passwd
ENV GIT_COMMITTER_NAME=nobody
ENV GIT_COMMITTER_EMAIL=nobody@example.com

ENTRYPOINT [ "make" ]
