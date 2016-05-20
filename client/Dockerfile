FROM node

# Get code
WORKDIR /tmp
ADD https://github.com/plone/plone_client/archive/master.tar.gz /tmp
RUN tar xzvf /tmp/master.tar.gz \
 && rm /tmp/master.tar.gz \
 && mv /tmp/plone_client-master /plone

# Install
WORKDIR /plone
RUN npm install

# Expose
EXPOSE 3000

# Configure and Run
CMD ["npm", "start"]
