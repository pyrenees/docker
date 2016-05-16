FROM node

WORKDIR /plone

# Get code and install
RUN git clone https://github.com/pyrenees/plone . && npm install

# Expose
EXPOSE 3000

# Configure and Run
CMD ["npm", "start"]
