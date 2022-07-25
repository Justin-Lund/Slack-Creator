# create-channels.sh & add-users.sh combined

#!/bin/bash

# Set Bearer Token Here
token='Authorization: Bearer xoxb-01234567890123-4567890123456-abcDEfghI1Jklmn2o3PQrstuv'

# Set Channel Names Here
channelNames=("active_incidents"
"afk_alerts"
"audit"
"azure_dfir"
"biz"
"community"
"domain_blocks"
"gcp_dfir"
"malware"
"onboarding"
"phishing"
"policy"
"process"
"risk"
"rss_feeds"
"scripting"
"splunk"
"table_tops"
"team_building"
"threat_emulation"
"threat_hunting"
"threat_intel"
"tools"
"training"
"vuln_management"
"water_cooler"
)

#############################

# Create Channels
for channelName in ${channelNames[@]}; do
        curl -X POST -H "$token" \
        -H 'Content-type: application/json; charset=utf-8' \
        --data '{"name":"'$channelName'"}' \
        https://slack.com/api/conversations.create
done

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
