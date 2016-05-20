FROM python:3.5

# Install packages
RUN apt-get update && apt-get install -y netcat && rm -rf /var/lib/apt/lists/*

# Get code
WORKDIR /tmp
ADD https://github.com/pyrenees/plone.oauth/archive/master.tar.gz /tmp
RUN tar xzvf /tmp/master.tar.gz \
 && rm /tmp/master.tar.gz \
 && mv /tmp/plone.oauth-master /plone

# Buildout
ADD ./docker-entrypoint.sh /
WORKDIR /plone
RUN python bootstrap.py \
 && ./bin/buildout -v \
 && chmod +x /docker-entrypoint.sh

# Expose
EXPOSE 6543

# Configure and Run
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/plone/bin/gunicorn", "--paste", "/plone/production.ini", "--timeout", "200"]
