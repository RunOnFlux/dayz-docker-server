#!/bin/bash

function updateGame() {
    echo "Updating game..."
    echo "Logging in as anonymous"
    steamcmd +force_install_dir ${SERVER_DIR} +login ${STEAM_CMD_USER} +app_update ${APP_ID} +quit
}

function startGame() {
    echo "Starting game..."
    cd ${SERVER_DIR}
    ./DayZServer -config="serverDZ.cfg" ${EXTRA_START_ARGS}
}

case "$1" in
    start)
        updateGame
        startGame
    ;;
    update)
        updateGame
    ;;
    *)
        exec "$@"
    ;;
esac
