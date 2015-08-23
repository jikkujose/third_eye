# ThirdEye

> Real time monitoring system for crowd sourced traffic events.

## Instructions

1. Clone
2. `bundle install`
3. Install monogodb
4. `mongod`
5. `bundle exec volt server`

## Features

1. Real time Google maps backed dash baord
2. Volt powered reactive frontend that synce between multiple instances of the app.
3. Web app to post data to map.
4. SMS based system to post data to the dashboard.

## Technologies

* Volt
* Ruby

## API Documentation

Any device can send event data to the system using the following API:

`http://54.148.254.0/api/event\?sender\='GPS_Tracker'\&content\='Traffic increase'\&location\='Status'\&type\='gps_tracker'\&mobile\='989897665'`

## About

Project implemented as part of [Kerala Road Safety Hackathon](http://keralaroadsafetyhack.com/)
