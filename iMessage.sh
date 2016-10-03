#!/bin/bash

[ $# -eq 0 ] && { echo "Usage: ./iMessage.sh buddy message"; exit 1; }
osascript -e "tell application \"Messages\" to send \"$2\" to buddy \"$1\""
