# Slack-Creator
Scripts to quickly spin up a new slack workspace

&nbsp;

## Slack API Resources
[conversations.create](https://api.slack.com/methods/conversations.create)

[conversations.list](https://api.slack.com/methods/conversations.list)

[conversations.invite](https://api.slack.com/methods/conversations.invite)

[users.list](https://api.slack.com/methods/users.list)

&nbsp;
***
&nbsp;

## Getting a Slack Token

1) Go to https://api.slack.com/tutorials/tracks/getting-a-token
2) Press "Create app"
3) Press "Install to Workspace"
4) At the top of the screen, select "How to quickly get and use a Slack API token".
The token will be auto-populated under "Step 1 - Using your token"

### Required permissions:

- channels:read
- channels:manage
- channels:write
- groups:read
- groups:write
- im:read
- im:write
- mpim:read
- mpim:write
- users:read

&nbsp;
***
&nbsp;

# Bash One Liner Examples

&nbsp;

## Create Channel
```bash
curl -X POST -H 'Authorization: Bearer xoxb-01234567890123-4567890123456-abcDEfghI1Jklmn2o3PQrstuv' \
-H 'Content-type: application/json; charset=utf-8' \
--data '{"name":"testchannel2"}' \
https://slack.com/api/conversations.create
```

&nbsp;

## List Channels
```bash
curl -X POST -H 'Authorization: Bearer xoxb-01234567890123-4567890123456-abcDEfghI1Jklmn2o3PQrstuv' \
-H 'Accept: application/json' \
https://slack.com/api/conversations.list
```

&nbsp;

## List Users
```bash
curl -X POST -H 'Authorization: Bearer xoxb-01234567890123-4567890123456-abcDEfghI1Jklmn2o3PQrstuv' \
-H 'Accept: application/json' \
https://slack.com/api/users.list
```

&nbsp;

## Add User to Channel

Example User ID: **A01B2CDEFGH**
Example Channel ID:**A01BCDEF23G**

```bash
curl -X POST -H 'Authorization: Bearer xoxb-01234567890123-4567890123456-abcDEfghI1Jklmn2o3PQrstuv' \
-H 'Content-type: application/json; charset=utf-8' \
--data '{"channel":"A01BCDEF23G","users":"A01B2CDEFGH"}' \
https://slack.com/api/conversations.invite
```

&nbsp;

## Extract Channel IDs
```bash
curl -s -X POST -H 'Authorization: Bearer xoxb-01234567890123-4567890123456-abcDEfghI1Jklmn2o3PQrstuv' \
-H 'Accept: application/json' \
https://slack.com/api/conversations.list | jq '.channels | .[] | .id'
```

&nbsp;

## Extract User IDs
```bash
curl -s -X POST -H 'Authorization: Bearer xoxb-01234567890123-4567890123456-abcDEfghI1Jklmn2o3PQrstuv' \
-H 'Accept: application/json' \
https://slack.com/api/users.list | jq '.members | .[] | .id'
```

&nbsp;
***
&nbsp;

# Slack Apps To Install
[RSS](https://slack.com/apps/A0F81R7U7-rss)

[Giphy](https://slack.com/apps/A0F827J2C-giphy)
