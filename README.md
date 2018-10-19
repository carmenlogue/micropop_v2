# MicroPop

## Setup

    $ make setup
    $ sudo sh -c 'echo "127.0.0.1 micropop_v2.local" >> /etc/hosts'
    $ make serve
    $ open http://micropop.local:3000/

A rake task is provided for creating dummy data in local development.

    $ docker-compose run web rake dev:prime

## Mail

In order to see emails sent in the development environment browse to http://localhost:1080.
