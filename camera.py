#!/usr/bin/python
# -*- coding: utf-8 -*-
import cv2 

print(cv2.__version__)
title = "Title window"
try:   
 
    cv2.namedWindow(title) 
    vc = cv2.VideoCapture(0) # 0 - запущенная камера
    if vc.isOpened(): # try to get the first frame 
        rval, frame = vc.read() 
    else: 
        rval = False 

    while rval: 
        cv2.imshow(title, frame) 
        rval, frame = vc.read() 
        key = cv2.waitKey(20) & 0xFF
        if key == 27: # exit on ESC break 
            vc.release()
            cv2.destroyWindow(title)
except Exception as e:  
    print("Error",e)      

      
