## Install OpenCV from repositories

### Build:
```
$ docker build -t jekshmek/opencv_rep --file Dockerfile .
```

#### Show OpenCV version:
```
$ docker run --rm --name opencv_rep_less -it jekshmek/opencv_rep python test_script.py
# OUTPUT:4.5.4
```

#### Run camera:
```
Check ENV DISPLAY in host machine:
$ export DISPLAY=:0.0

Check xhost:
$ sudo apt-get install x11-xserver-utils
$ xhost +

$ docker run --rm -it --env DISPLAY=$DISPLAY --privileged \
    --volume /tmp/.X11-unix:/tmp/.X11-unix --env NO_AT_BRIDGE=1 \
    --name opencv_rep_less -it jekshmek/opencv_rep python camera.py 2> .log_error
    
Help:

https://community.hpe.com/t5/System-Administration/xhost-error-unable-to-open-display/m-p/3597993#M232451

    possibility is that you are trying to run "xhost" before actually getting into X on your local machine.

    machine$ # Get into X windows.
    localmachine$ xterm &
    localmachine-xterm$ echo $DISPLAY

    if none of above, then do following to setup the DISPLAY variable.
    localmachine-xterm$ export DISPLAY="localmachine:0.0"

    localmachine-xterm$ xhost +remotehost
    "remotehost" added to access list.

    localmachine-xterm$ telnet remotehost
    ## Log into remote host

    remotehost$ export DISPLAY="localmachine:0.0"
    remotehost$ xterm

echo "export DISPLAY=:0" > .bashrc
source .bashrc 
xhost +
```

#### Use mount

```
$ cd <ABSOLUTE PATH YOUR PROJECT DIR>

Create mount:
$ docker volume create \
    --name host_data_source \
    --opt type=bind \
    --opt device=<ABSOLUTE PATH YOUR PROJECT DIR>/source \
    --opt o=bind

File <ABSOLUTE PATH YOUR PROJECT DIR>/source/test_create.py:
    
#!/usr/bin/python
# -*- coding: utf-8 -*-
import os 
with open("/container_data/new-file",'a+',encoding="utf8") as resource:
     text = resource.read()
     resource.write("hello world")
     resource.close()
     
Run Image:
$ docker run --rm \
    --name opencv_rep_less \
    --mount source=host_data_source,destination=/container_data \
    -it jekshmek/opencv_rep python /container_data/test_create.py

$ cat <ABSOLUTE PATH YOUR PROJECT DIR>/source/new-file
```



    
    

 
