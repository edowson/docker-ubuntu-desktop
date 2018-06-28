ARG repository
ARG tag
FROM ${repository}:${tag}
LABEL maintainer "Elvis Dowson <elvis.dowson@gmail.com>"
Label description "Ubuntu-16.04 desktop with TigerVNC."

# Running:
# sudo docker run -it -p 5901:5901 ubuntu-desktop:16.04
#
# Connecting:
# vncserver :1 -depth 24 -geometry 1920x1080
#
# Disconnecting:
# vncserver -kill :1

# Setup environment variables.
ENV container docker
ENV DEBIAN_FRONTEND noninteractive
ENV USER developer
ENV HOME /home/$USER

# Create new user.
RUN adduser $USER --disabled-password --gecos ""

# Install Ubuntu desktop.
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ubuntu-desktop && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install additional software packages.
RUN apt-get update && \
    apt-get install -y \
    apt-utils \
    curl \
    gedit \
    gnome-terminal \
    iputils-ping \
    locales \
    locales-all \
    nano \
    net-tools \
    sudo \
    unity-lens-applications \
    unity-lens-files \
    unity-tweak-tool \
    wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Remove software packages
RUN apt-get remove --purge \
    unity-lens-shopping

# Set the locale.
ENV LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8

# Install TigerVNC.
RUN wget https://bintray.com/artifact/download/tigervnc/stable/ubuntu-16.04LTS/amd64/tigervncserver_1.8.0-1ubuntu1_amd64.deb -P /tmp && \
    apt-get update && \
    apt-get install -y \
    libtasn1-3-bin && \
    dpkg -i /tmp/tigervncserver_1.8.0-1ubuntu1_amd64.deb && \
    apt-get -f install && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm /tmp/tigervncserver_1.8.0-1ubuntu1_amd64.deb

# Configure VNC.
copy config/vnc/xstartup /home/$USER/.vnc/xstartup
RUN chmod 755 /home/$USER/.vnc/xstartup

# delete all the apt list files since they're big and get stale quickly
# this forces "apt-get update" in dependent images, which is also good
RUN rm -rf /var/lib/apt/lists/*

# make systemd-detect-virt return "docker"
# See: https://github.com/systemd/systemd/blob/aa0c34279ee40bce2f9681b496922dedbadfca19/src/basic/virt.c#L434
RUN mkdir -p /run/systemd && echo 'docker' > /run/systemd/container

EXPOSE 22 5901
