FROM python:3.5

# Install packages
RUN apt-get update && apt-get install -y \
  gcc \
  git \
  wget \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /plone

# Get code
RUN git clone https://github.com/pyrenees/sandbox.git .

# Buildout
RUN wget https://bootstrap.pypa.io/bootstrap-buildout.py \
 && python bootstrap-buildout.py \
 && ./bin/buildout -v

# Expose

# Configure and Run
CMD ["/plone/bin/sandbox"]
