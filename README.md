## Install OpenCV from repositories

### Build:
```

    $ docker build -t jekshmek/opencv_rep --file Dockerfile .
```


#### Show OpenCV version:
```
    $ docker run --rm --name opencv_rep_ex_v3 -it jekshmek/opencv_rep python test_script.py
    # OUTPUT:4.5.4
```

#### Run camera:
```
    $ docker run --rm -it --env DISPLAY=$DISPLAY  --privileged \
        --volume /tmp/.X11-unix:/tmp/.X11-unix \
        --name opencv_rep_ex_v3 -it jekshmek/opencv_rep
    
First run:    
    $ python camera.py 2> .log_error

Second run:
    $ python camera.py 

```

#### Use mount

```
$cd <ABSOLUTE PATH YOUR PROJECT DIR>

Create mount:
    $ docker volume create \
        --name host_data_source \
        --opt type=bind \
        --opt device=<ABSOLUTE PATH YOUR PROJECT DIR>/source \
        --opt o=bind

File <ABSOLUTE PATH YOUR PROJECT DIR>/source/test_create.py:
    ```
    #!/usr/bin/python
    # -*- coding: utf-8 -*-
    import os 
    with open("/container_data/new-file",'a+',encoding="utf8") as resource:
         text = resource.read()
         resource.write("hello world")
         resource.close()
    ```

    $ docker run \
        --name opencv_rep_less \
        --mount source=host_data_source,destination=/container_data \
        -it jekshmek/opencv_rep python /container_data/test_create.py

```



    
    

 
