#!/bin/bash

# en windows no funciona

SCRIPT_DIR=$(dirname "$(realpath "$0")")
WATCH_DIR="$SCRIPT_DIR/deno/www/app-dotlake"
COMMAND="docker restart cont-deno-dotlake"

echo "watch dir: $WATCH_DIR"
echo "command: $COMMAND"
echo ""

#m launch as listener
#r recursive
#e events to listen for
inotifywait -m -r -e modify,create,delete,move "$WATCH_DIR" |
while read -r directory events filename; do
    echo "Detected changes in $directory$filename"
    $COMMAND
done