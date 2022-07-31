# Install OpenCV from repositories https://techcave.ru/posts/43-ustanovka-opencv-na-ubuntu-ili-debian.html
# ###################################
# Libraries:
# - OpenCV 4.6.0
# - Python 3.10.4
# - GStreamer
# - easyocr
# - matplotlib
# - imutils 
# - pytesseract
# ###################################
FROM ubuntu:latest
LABEL maintainer="Jeka <yaroshjeka@gmail.com>"
ENV TZ=Europe/Madrid
ENV DEBIAN_FRONTEND=noninteractive
# && add-apt-repository ppa:deadsnakes/ppa 
RUN apt-get -y update && apt install -y software-properties-common && add-apt-repository universe
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get -y update && apt-get install -y --no-install-recommends apt-utils && apt-get -y upgrade && apt-get -y dist-upgrade && apt-get -y autoremove
 
# Install GStreamer
RUN apt-get install -y libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-bad1.0-dev gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-gl gstreamer1.0-gtk3 gstreamer1.0-qt5 gstreamer1.0-pulseaudio
 
# Install Python    python3.10
RUN apt-get install -y tzdata  python3-pip && ln -s /usr/bin/python3 /usr/bin/python

# Install easyocr and remove opencv-python-headless
RUN python -mpip install easyocr && python -mpip uninstall -y opencv-python-headless

# Install OpenCV

# apt-cache policy python3-opencv
# RUN python -mpip install opencv-python==4.5.5.64
RUN apt-get install -y libopencv-dev python3-opencv python3-tk  
 
RUN python -mpip install -U matplotlib 

RUN python -mpip install -U imutils pytesseract 
  
# Install ffmpeg
RUN apt-get install -y ffmpeg 
RUN apt-get install -y v4l-utils
 
COPY test_script.py camera.py / 
EXPOSE 8000
CMD /bin/bash 


 
