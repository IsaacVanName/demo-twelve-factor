FROM mariadb:10.11.2-jammy

ARG VAULT_ADDR
ARG VAULT_TOKEN

# Get the GPG key for and add the Hashicorp repo so we can grab Vault
RUN mkdir -p /usr/share/keyrings && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common \ 
        apt-transport-https curl gnupg-agent gpg wget && \
    wget -O- https://apt.releases.hashicorp.com/gpg \
        | gpg --dearmor \
        | tee /usr/share/keyrings/hashicorp-archive-keyring.gpg && \
    echo \
        "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" \
        | tee /etc/apt/sources.list.d/hashicorp.list && \
    apt-get update && \
    apt-get install -y vault

# A bit of voodoo magic to let the Vault command work in Docker without some crazy workarounds
RUN setcap -r /usr/bin/vault

# Grab the MariaDB credentials from Vault and set them to environment variables.
# _ENVIRONMENT_KEY is set in the Docker compose file and is either master or slave.
# RUN VAULT_ADDR=${VAULT_ADDR} vault login -method=token token=${VAULT_TOKEN} && \
#     export MARIADB_ROOT_PASSWORD=`vault kv get secret/demo/DATABASE_${_ENVIRONMENT_KEY}_PASSWORD_ROOT` && \
#     export MARIADB_USERNAME=`vault kv get secret/demo/DATABASE_${_ENVIRONMENT_KEY}_USERNAME` && \
#     export MARIADB_PASSWORD=`vault kv get secret/demo/DATABASE_${_ENVIRONMENT_KEY}_PASSWORD`

ENTRYPOINT ["mysqld"]