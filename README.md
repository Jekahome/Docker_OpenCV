## Install OpenCV from repositories

```
Build:

    $ docker build -t jekshmek/opencv_rep --file Dockerfile .

Show OpenCV version:

    $ docker run --rm --name opencv_rep_ex_v3 -it jekshmek/opencv_rep 
    # OUTPUT:4.5.4

Run camera:
$ docker run --rm -it --env DISPLAY=$DISPLAY  --privileged \
    --volume /tmp/.X11-unix:/tmp/.X11-unix \
    --name opencv_rep_ex_v3 -it jekshmek/test_cmake
    
First run:    
$ python camera.py 

Next run:
$ python camera.py 

```



    
    

 
