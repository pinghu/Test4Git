#!/usr/bin/env python3
import os, sys
from PIL import Image

user=os.getenv('USER')
path1='/home/{}/images/'.format(user)

for image_name in os.listdir(path1):
    sys.stderr.write(image_name)
    if not image_name.startswith('.'):
        im=Image.open(path1+ image_name)
        new_name='/opt/icons/'+image_name.split('.')[0]+'.jpg'
        sys.stderr.write("\t"+ new_name+ "\n")
        im.rotate(-90).convert('RGB').resize((128,128)).save(new_name,'jpeg')
        im.close()
