using './main.bicep'

param location = 'australiaeast'
param appName = 'todo-api'
param environment = 'dev'
param sqlAdminUserName = 'sqladmin'
param isPrivate = false
param containerImageName = 'todo-api'
param acrName = ''
param sqlDbName = 'todosDb'
param productApiYaml = ''
param sqlAdminUserPassword = ''

