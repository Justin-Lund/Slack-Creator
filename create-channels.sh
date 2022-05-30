#!/bin/bash

# Set Bearer Token Here
token='Authorization: Bearer xoxb-01234567890123-4567890123456-abcDEfghI1Jklmn2o3PQrstuv'

# Set Channel Names Here
channelNames=("channel1"
"channel2"
"channel3"
"channel4"
"channel5"
"channel6"
"channel7"
"channel8"
"channel9")

#############################

# Create Channels
for channelName in ${channelNames[@]}; do
        curl -X POST -H "$token" \
        -H 'Content-type: application/json; charset=utf-8' \
        --data '{"name":"'$channelName'"}' \
        https://slack.com/api/conversations.create
done
