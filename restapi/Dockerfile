# derive from local image
FROM pyrenees_plone

# Get code
COPY extra.cfg /plone

# Buildout
RUN ./bin/buildout -c extra.cfg -v

# Configure and Run
# Use default
