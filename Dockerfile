# Install OpenCV from repositories https://techcave.ru/posts/43-ustanovka-opencv-na-ubuntu-ili-debian.html
FROM ubuntu:latest
LABEL maintainer="Jeka <yaroshjeka@gmail.com>"
ENV TZ=Europe/Madrid
ENV DEBIAN_FRONTEND=noninteractive
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get -y update && apt-get -y upgrade && apt-get -y dist-upgrade && apt-get -y autoremove

RUN apt-get install -y tzdata libopencv-dev python3-opencv python3-pip python3-tk && ln -s /usr/bin/python3 /usr/bin/python
RUN python -mpip install -U matplotlib  
COPY test_script.py camera.py / 
EXPOSE 8000
CMD /bin/bash 


 
