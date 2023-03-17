FROM frolvlad/alpine-bash

# workdir should create the directory for the subsequent copy
# credentials.txt will be ignored if it doesn't exist because
#   copy targets are optional after the first
WORKDIR /tmp/scripts
COPY ./init.sh ./credentials.txt /tmp/scripts/

# Create the directory for secrets files to be shared with
#   other containers. Would prefer a more robust approach to
#   retrieving secrets via cURL or an API, but this is simple
#   to prototype.
WORKDIR /var/secrets

ENTRYPOINT ["/tmp/scripts/init.sh"]