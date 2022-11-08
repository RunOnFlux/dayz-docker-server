#!/bin/bash

function updateGame() {
    echo "Updating game..."
    echo "Logging in as anonymous..."
    #steamcmd +force_install_dir ${SERVER_DIR} +login ${STEAM_CMD_USER} +app_update ${APP_ID} +quit    
    steamcmd +force_install_dir /dayz/server +login anonymous +app_update 1042420 +quit
}

function startGame() {
    echo "Starting game..."
    cd ${SERVER_DIR}
    ./DayZServer -config="serverDZ.cfg" -noFilePatching -freezecheck
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
