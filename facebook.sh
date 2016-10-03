#!/bin/bash

[ $# -eq 0 ] && { echo "Usage: ./facebook.sh status"; exit 1; }
curl -X POST -H "Content-Type: application/json" -d '{"value1":"'"$1"'"}' https://maker.ifttt.com/trigger/facebook_status/with/key/YOUR_API_KEY
