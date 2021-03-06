#! /usr/bin/env python3
import os
import requests

files=os.listdir('/data/feedback')
for f in  files:
    fb=open('/data/feedback/' + f)
    data=fb.read()
    data=data.split('\n')
    dict={"title":data[0], "name":data[1], "date":data[2], "feedback":data[3]} 
    response=requests.post('http://34.123.135.122/feedback/', json=dict)
    print(response.status_code)
