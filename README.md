# Slack-Creator
Scripts to quickly spin up a new Slack workspace

## Getting a Slack Token

1) Go to https://api.slack.com/tutorials/tracks/getting-a-token
2) Under the header "Create a pre-configured app", Press "Create app" & select your Workspace
3) Edit permissions as desired (See [config.txt](https://github.com/Justin-Lund/Slack-Creator/blob/main/config.txt) for required permissions)
4) Press "Install to Workspace" & follow the prompts
5) At the top of the screen, select the link to go back to the "How to quickly get and use a Slack API token" page.
- The token will be auto-populated under "Step 1 - Using your token"

&nbsp;
***
&nbsp;

## Bash One Liner Examples

### Create Channel
```bash
curl -X POST -H 'Authorization: Bearer xoxb-01234567890123-4567890123456-abcDEfghI1Jklmn2o3PQrstuv' \
-H 'Content-type: application/json; charset=utf-8' \
--data '{"name":"testchannel2"}' \
https://slack.com/api/conversations.create
```

### List Channels
```bash
curl -X POST -H 'Authorization: Bearer xoxb-01234567890123-4567890123456-abcDEfghI1Jklmn2o3PQrstuv' \
-H 'Accept: application/json' \
https://slack.com/api/conversations.list
```

### List Users
```bash
curl -X POST -H 'Authorization: Bearer xoxb-01234567890123-4567890123456-abcDEfghI1Jklmn2o3PQrstuv' \
-H 'Accept: application/json' \
https://slack.com/api/users.list
```

&nbsp;

### Extract Channel IDs
```bash
curl -s -X POST -H 'Authorization: Bearer xoxb-01234567890123-4567890123456-abcDEfghI1Jklmn2o3PQrstuv' \
-H 'Accept: application/json' \
https://slack.com/api/conversations.list | jq '.channels | .[] | .id'
```

### Extract User IDs
```bash
curl -s -X POST -H 'Authorization: Bearer xoxb-01234567890123-4567890123456-abcDEfghI1Jklmn2o3PQrstuv' \
-H 'Accept: application/json' \
https://slack.com/api/users.list | jq '.members | .[] | .id'
```

### Add User to Channel

```bash
curl -X POST -H 'Authorization: Bearer xoxb-01234567890123-4567890123456-abcDEfghI1Jklmn2o3PQrstuv' \
-H 'Content-type: application/json; charset=utf-8' \
--data '{"channel":"A01BCDEF23G","users":"A01B2CDEFGH"}' \
https://slack.com/api/conversations.invite
```

&nbsp;
***
&nbsp;

## Slack Apps To Install
[RSS](https://slack.com/apps/A0F81R7U7-rss)

[Giphy](https://slack.com/apps/A0F827J2C-giphy)

&nbsp;
***
&nbsp;

## Slack API Resources
[conversations.create](https://api.slack.com/methods/conversations.create)

[conversations.list](https://api.slack.com/methods/conversations.list)

[conversations.invite](https://api.slack.com/methods/conversations.invite)

[users.list](https://api.slack.com/methods/users.list)
