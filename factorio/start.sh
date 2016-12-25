#!/bin/bash

if [ ! "$(ls -A $SAVEGAME)" ]; then
  /opt/factorio/bin/x64/factorio --create $SAVEGAME/default_save.zip
fi

/opt/factorio/bin/x64/factorio --start-server $SAVEGAME/default_save.zip
