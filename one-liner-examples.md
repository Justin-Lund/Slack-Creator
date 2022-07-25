# Bash One Liner Examples

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

### Create Channel
```bash
curl -X POST -H 'Authorization: Bearer xoxb-01234567890123-4567890123456-abcDEfghI1Jklmn2o3PQrstuv' \
-H 'Content-type: application/json; charset=utf-8' \
--data '{"name":"testchannel2"}' \
https://slack.com/api/conversations.create
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
