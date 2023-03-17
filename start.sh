docker-compose \
    --env-file ./config/.env \
    -f ./docker/compose-cache.yml \
    -f ./docker/compose-credentials.yml \
    -f ./docker/compose-database.yml \
    -f ./docker/compose-loadbalancing.yml \
    -f ./docker/compose-web.yml \
    up -d

# -f ./docker/compose-queue.yml \