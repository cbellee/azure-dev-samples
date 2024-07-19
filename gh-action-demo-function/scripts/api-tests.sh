# GET alertListChannels
curl https://dev-gh-action-demo-function-repysa6fou2tw.azurewebsites.net/api/alertlistchannels?code=<REDACTED> -v

# GET alertLists
curl https://dev-gh-action-demo-function-repysa6fou2tw.azurewebsites.net/api/alertlists?code=<REDACTED> -v

#
curl -X PUT https://dev-gh-action-demo-function-repysa6fou2tw.azurewebsites.net/api/alertlistchannels?code=<REDACTED> \
    -H 'Content-Type: application/json' \
    -d '[{"alertListId": "1", "alertListName": "Alert List 1","teamsChannelId": "100","teamsChannelName": "Teams Channel 100"},{"alertListId": "2", "alertListName": "Alert List 2","teamsChannelId": "200","teamsChannelName": "Teams Channel 200"},{"alertListId": "3", "alertListName": "Alert List 3","teamsChannelId": "300","teamsChannelName": "Teams Channel 300"},{"alertListId": "4", "alertListName": "Alert List 4","teamsChannelId": "400","teamsChannelName": "Teams Channel 400"}]'

