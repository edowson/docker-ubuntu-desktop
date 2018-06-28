## Ubuntu-16.04 desktop with TigerVNC

This repository contains a docker image for Ubuntu-16.04 desktop supporting
remote access using TigerVNC.

### Building

Start docker services and build the docker image.

```
sudo systemctl start docker
docker build --file Dockerfile --build-arg repository=ubuntu --build-arg tag=16.04 -t ubuntu-desktop:16.04 .
```
### Running

```
sudo docker run -it -p 5901:5901 ubuntu-desktop:16.04
```

### Remote Desktop

You can connect to the remote desktop using VNC.

Start the TigerVNC server, type the following commands in the docker console:
```
vncserver :1 -depth 24 -geometry 1920x1080
```

When running the VNC server for the first time, it will ask you to set a password.

Connect using a remote desktop client using `localhost:5901` and enter the password.

Display running vnc server sessions:
```
vncserver -list
```

Stop the vnc server:
```
vncserver -kill :1
```

### Related Topics

1. [Official Docker image for Ubuntu Server? - Ask Ubuntu](https://askubuntu.com/questions/707621/official-docker-image-for-ubuntu-server)

### Related Links

1. [Ubuntu 17.04 – Configure TigerVNC Server to start at boot and make it working - Griffon's IT Library](http://c-nergy.be/blog/?p=10611)
