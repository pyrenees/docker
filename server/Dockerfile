FROM python:3.5

# Get code
WORKDIR /tmp
ADD https://github.com/plone/plone.server/archive/master.tar.gz /tmp
RUN tar xzvf /tmp/master.tar.gz \
 && rm /tmp/master.tar.gz \
 && mv /tmp/plone.server-master /plone

# Buildout
WORKDIR /plone
RUN python bootstrap-buildout.py \
 && ./bin/buildout -v

# Expose
EXPOSE 8080

# Configure and Run
CMD ["/plone/bin/server"]
