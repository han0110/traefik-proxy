#!/bin/sh

ENV_DEFAULT_FILE=".env.default"
ENV_FILE=".env"

REVERSE_PROXY_NETWORK="reverse-proxy"

function use_env_if_exist() {
    if [ -f "$1" ]; then
        echo "Use env file $1"
        source $1
    fi
}

function main() {
    # Source environment files
    use_env_if_exist ${ENV_DEFAULT_FILE}
    use_env_if_exist ${ENV_FILE}
    # Create docker network for traefik and services
    docker network create ${REVERSE_PROXY_NETWORK} 2>/dev/null 
    # Start traefik
    docker-compose up -d --force-recreate
    exit 0
}

main $@
