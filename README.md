# ThirdEye

> Real time monitoring system for crowd sourced traffic events.

## Instructions

1. Clone & `cd` to directory
2. `bundle install`
3. Install monogodb
4. `mongod`
5. `bundle exec volt server`

## Features

1. Real time Google maps backed dash board
2. Volt powered reactive frontend that sync between multiple instances of the app.
3. Web app to post data to map.
4. SMS based system to post data to the dashboard.

## Technologies

* Volt
* Ruby
* Google Maps

## API Documentation

Any device can send event data to the system using the following API:

```
GET /api/event?sender=<device_id>&content=<some_text>&location=<local_place_name>&type=<event_type>&mobile=<10_digit_number>
```

## About

Project implemented as part of [Kerala Road Safety Hackathon](http://keralaroadsafetyhack.com/)

## Remarks

The project is just a proof of concept implemented in 24 hours. And there might be numerous issues and implementation/design flaws. Please use this with care.

## Team

* [Jikku Jose](http://twitter.com/jikkujose)
* [Rakesh BS](http://twitter.com/rakesh_bs)

## Result

The project [won](http://s9.postimg.org/x3g8n5njz/image.jpg) first prize in software category.
![prize](https://github.com/JikkuJose/third_eye/raw/master/README/prize.jpg)
