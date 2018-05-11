# Signal-Desktop docker 

[![N|Solid](https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Signal_Blue_Icon.png/100px-Signal_Blue_Icon.png)](http://https://signal.org/)[![N|Solid](https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Docker_%28container_engine%29_logo.svg/400px-Docker_%28container_engine%29_logo.svg.png)](http://https://docker.org/)


Thi is a silmple container with Signal save comunicator 

  - Type some Markdown on the left
  - See HTML in the right
  - Magic

# How to install!
```sh
git clone https://github.com/dzaczek/signal-desktop.git
cd signal-desktop 
docker build -t signal . 
```

# How to run!
```sh
#this version works at the moment only on X11 graphic engine
docker run -ti --rm \
       -e DISPLAY=$DISPLAY \
       -v /tmp/.X11-unix:/tmp/.X11-unix --security-opt label=type:container_runtime_t \
       signal
```

# Problems 
if you have problem with selinux, some times can help this procedure 
```sh
sudo chcon -Rt svirt_sandbox_file_t  /tmp/.X11-unix/X0
sudo chcon -Rt svirt_sandbox_file_t  /tmp/.X11-unix

```

# TODO
  - Start Config for  Wayaland
  - Updates 
  - integration with gnome 
