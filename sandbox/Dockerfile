FROM python:3.5

# Install packages
RUN apt-get update && apt-get install -y \
  gcc \
  git \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /plone

# Get code
RUN git clone https://github.com/pyrenees/sandbox.git .

# Buildout
RUN python bootstrap-buildout.py \
 && ./bin/buildout -v

# Expose

# Configure and Run
CMD ["/plone/bin/sandbox"]
