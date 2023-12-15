#!/bin/sh

aws events put-events \
    --entries file://events.json
