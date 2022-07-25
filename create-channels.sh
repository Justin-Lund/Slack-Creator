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
