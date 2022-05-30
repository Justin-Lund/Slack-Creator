#!/bin/bash

# Add all users in a Slack Workspace to all channels
# Useful after creating channels via the API

# Set Bearer Token Here
token='Authorization: Bearer xoxb-01234567890123-4567890123456-abcDEfghI1Jklmn2o3PQrstuv'

# Save usernames to array
usernames=( $(curl -s -X POST -H "$token" \
-H 'Accept: application/json' \
https://slack.com/api/users.list | jq '.members | .[] | .id' | cut -d '"' -f 2 | cut -d '"' -f 1) )

# Save channel names to array
channels=( $(curl -s -X POST -H "$token" \
-H 'Accept: application/json' \
https://slack.com/api/conversations.list | jq '.channels | .[] | .id' | cut -d '"' -f 2 | cut -d '"' -f 1) )

# Add users to channels
for user in ${usernames[@]}; do
        for channel in ${channels[@]}; do
                curl -X POST -H "$token" \
                -H 'Content-type: application/json; charset=utf-8' \
                --data '{"channel":"'$channel'","users":"'$user'"}' \
                https://slack.com/api/conversations.invite
        done
done
