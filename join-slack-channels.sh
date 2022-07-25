# Use this to join the app to all existing channels
# Useful if you have channels created outside of the script & need to use the script to invite all users

# Set Bearer Token Here
token='Authorization: Bearer xoxb-01234567890123-4567890123456-abcDEfghI1Jklmn2o3PQrstuv'


# Save channel names to array
channels=( $(curl -s -X POST -H "$token" \
-H 'Accept: application/json' \
https://slack.com/api/conversations.list | jq '.channels | .[] | .id' | cut -d '"' -f 2 | cut -d '"' -f 1) )

# Add users to channels
for channel in ${channels[@]}; do
        curl -X POST -H "$token" \
        -H 'Content-type: application/json; charset=utf-8' \
        --data '{"channel":"'$channel'"}' \
        https://slack.com/api/conversations.join
done
