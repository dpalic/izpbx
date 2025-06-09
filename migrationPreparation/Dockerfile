ARG DEBIAN_VER=bookworm
#ARG RHEL_VER=8
ARG IMAGE_FROM=debian:${DEBIAN_VER}
FROM ${IMAGE_FROM}


# 1. Install key-fetching tools
RUN apt-get update && \
    apt-get install -y --no-install-recommends gnupg dirmngr \
       wget ca-certificates

# 2. Import deb-multimedia’s public key
RUN apt-key adv --keyserver keyserver.ubuntu.com \
      --recv-keys 5C808C2B65558117

# Add the deb-multimedia entry
RUN echo "deb http://www.deb-multimedia.org bookworm main non-free" \
    > /etc/apt/sources.list.d/deb-multimedia.list

# Install the keyring and update
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      deb-multimedia-keyring && \
    apt-get update

RUN apt update && apt dist-upgrade -y
#RUN set -xe && \
#  ## import system information vars
#  . /etc/os-release && export OSARCH=$(uname -m) && \
#  \
#  ## install packages

#RUN apt-get install rsync 

### STEP 1: INSTALL BASE & NETWORKING PACKAGES
RUN apt-get install -y \
    rsync \
    net-tools \
    diffutils \
    unzip \
    zip \
    bzip2 \
    netcat-openbsd \
    sudo \
    patch \
    dnsmasq \
    iproute2 \
    less \
    vim \
    procps \
    iptables \
    libnetfilter-cthelper0 \
    libnetfilter-cttimeout1 \
    libnetfilter-queue1 \
    libnetfilter-conntrack3 \
    libnfnetlink0 \
    conntrack \
    tcpdump \
    iftop \
    lsof \
    strace \
    supervisor \
    logrotate \
    binutils \
    figlet \
    wget \
    curl \
    file
    
### STEP 2: INSTALL MEDIA PACKAGES
RUN apt-get install -y \
    opus-tools \
    mpg123 \
    sox \
    libtiff6 \
    libjpeg-turbo-progs \
    audiofile-tools \
    sndfile-programs \
    libilbc3 \
    libtiff-tools \
    speex \
    libspeexdsp1 \
    libportaudio2 \
    libfftw3-bin \
    ffmpeg \
    codec2 \
    lame \
    libmp3lame0

### STEP 3: INSTALL DEVELOPMENT & RUNTIME PACKAGES
RUN true || apt-get install -y \
    apache2 \
    openssl \
    apache2-ssl-dev \
    php \
    php-mysqlnd \
    php-symfony-process \
    php-pear \
    php-mbstring \
    php-xml \
    php-json \
    php-gd \
    php-curl \
    php-ldap \
    phpmyadmin \
    jq \
    liburiparser1 \
    libunbound8 \
    freetds-bin \
    libdbd-freetds \
    libevent-2.1-7 \
    libsnmp40 \
    libneon27 \
    libproxy-tools \
    snmpd \
    lm-sensors \
    libical3 \
    libical-dev \
    icu-devtools \
    gcc \
    make \
    bc \
    libnsl2 \
    libsrtp2-1 \
    libedit2 \
    libxml2 \
    libnewt-pic \
    libuuid1 \
    libjansson4 \
    libedit2 \
    libtool \
    ncurses-bin \
    ncurses-term \
    uuid \
    libltdl7 \
    libsasl2-2 \
    libresample1 \
    libdbi-perl \
    libdbd-mysql-perl \
    libuv1 \
    gmime-bin \
    sqlite3 \
    sqlite-utils \
    unixodbc \
    odbc-mariadb \
    chrony \
    zabbix-agent \
    zabbix-agent2 \
    mtr \
    fail2ban

### STEP 4: INSTALL CUSTOM HANDLING PACKAGES
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y \
    postfix \
    msmtp


#RUN apt install $APP_INSTALL_DEPS

# keep the container alive so you can exec into it, or run your services under supervisor
CMD ["tail", "-f", "/dev/null"]
