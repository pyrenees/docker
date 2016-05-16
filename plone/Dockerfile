FROM python:2.7

# Install packages
RUN apt-get update && apt-get install \
	gcc \
	libc-dev \
	libxml2-dev \
	libxslt-dev \
	libpng-dev \
 && rm -rf /var/lib/apt/lists/*

# Install entrypoint
ADD entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh

# Create base dir for user www-data
WORKDIR /plone
USER root
RUN chown www-data /plone
USER www-data

# Get code
RUN git clone https://github.com/plone/buildout.coredev .
COPY zeo.cfg /plone

# Buildout
RUN python bootstrap.py \
 && ./bin/buildout -c zeo.cfg -v

# Volumes
#VOLUME /plone/var/filestorage
#VOLUME /plone/var/blobstorage

# Expose
EXPOSE 8080
EXPOSE 8100

# Configure and Run
ENTRYPOINT ["/usr/bin/entrypoint.sh"]
CMD ["/plone/bin/instance", "fg"]
