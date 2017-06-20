#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import urllib.request, json

city = "98203"
api_key = "f57525067de8e3639d3fa13c5158d09b"
units = "Imperial"
unit_key = "F"

weather = eval(str(urllib.request.urlopen("http://api.openweathermap.org/data/2.5/weather?q={}&APPID={}&units={}".format(city, api_key, units)).read())[2:-1])

info = weather["weather"][0]["description"].capitalize()
temp = int(float(weather["main"]["temp"]))

print("%s, %i °%s" % (info, temp, unit_key))
