#!/bin/sh

ENV_DEFAULT_FILE=".env.default"

function main() {
    ENV_FILE=$1
    # Use default env file if not specified
    if [ ! -f "${ENV_FILE}" ]; then
        ENV_FILE=${ENV_DEFAULT_FILE}
    fi
    source ${ENV_FILE}
    # Create docker network
    docker network create $REVERSE_PROXY_NETWORK
    docker network create $SERVICES_NETWORK
    # Pull images
    docker-compose pull
    # Start proxy
    env `cat ${ENV_FILE} | grep -v '^#'` docker-compose up -d
    exit 0
}

main $@
