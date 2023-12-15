#!/bin/sh

LOG_GROUP=${1:-"/aws/lambda/jedi_lambda"}

aws logs tail "$LOG_GROUP" --follow
