=====================
Docker Barcelona 2016
=====================

ploneNG images are build on Docker HUB

Building `current_plone.yml`:

* zeo
* plone
* restapi (plone + plone.restapi)

  
Run PloneNG
===========

Quick start: 

* `docker-compose -f ploneNG.yml up`

That exposes to localhost 6543 for oauth service and 8080 for plone service

Get testing tokens for API:

* `python get_token.py http://localhost:6543`


Rebuild without cache
---------------------

Rebuild an image:

* `docker-compose -f docker-compose.yml build --no-cache` restapi

Rebuild all:

* `docker-compose -f docker-compose.yml build --no-cache`

    Rebuilding zeo or plone without cache means to build the buildout from zero 


Published ports
===============

By default the following ports are published:

* server at 8080
* client at 3000
* oauth at 6543


* plone at 9080
* restapi at 9081
 
To change the published ports, change accordingly in
`docker-compose.yml`, e.g.::

 - "9080:8080" # public:exposed_internally 
 + "9082:8080"


Plone base image
================

Builds `zeo.cfg`. It is tagged as *pyrenees_plone*.


Extend Plone base image
-----------------------

See for example the `restapi` docker image.

Create an `extra.cfg` and extend from `zeo.cfg`. Or from
`buildout.cfg` to just ignore it.

Create a `restapi/Dockerfile`::

  FROM pyrenees_plone
  COPY extra.cfg /plone
  RUN ./bin/buildout -c extra.cfg -v


Append the new container to the `docker-compose.yml`::

  restapi:
    build: ./restapi
    depends_on:
      - plone




Environment options
===================


Zeo address
-----------

Default port 8100 can be changed in `docker-compose.yml`::

  zeo:
    environment:
      - ZEO_PORT=8100
    expose:
      - "8100"

  plone:
    environment:
      - ZEO_HOST=zeo
      - ZEO_PORT=8100


Also zeo host can be changed, by default it is linked by docker networking.
