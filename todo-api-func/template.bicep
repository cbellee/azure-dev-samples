param location string
param apimName string

resource apim 'Microsoft.ApiManagement/service@2023-03-01-preview' existing = {
  name: apimName
}

resource apim_azfun_atlasdocs_prod_001 'Microsoft.ApiManagement/service/apis@2022-09-01-preview' = {
  parent: apim
  name: 'azfun-atlasdocs-prod-001'
  properties: {
    displayName: 'azfun-atlasdocs-prod-001'
    apiRevision: '1'
    description: 'Import from "azfun-atlasdocs-prod-001" Function App'
    subscriptionRequired: true
    path: 'azfun-atlasdocs-prod-001'
    protocols: [
      'https'
    ]
    authenticationSettings: {
      oAuth2AuthenticationSettings: []
      openidAuthenticationSettings: []
    }
    subscriptionKeyParameterNames: {
      header: 'Ocp-Apim-Subscription-Key'
      query: 'subscription-key'
    }
    isCurrent: true
  }
}

resource apim_caseapi 'Microsoft.ApiManagement/service/apis@2022-09-01-preview' = {
  parent: apim
  name: 'caseapi'
  properties: {
    displayName: 'Atlas Case Api'
    apiRevision: '1'
    subscriptionRequired: false
    serviceUrl: 'https://mobileatlas.apm.net.au'
    path: 'caseapi'
    protocols: [
      'https'
    ]
    authenticationSettings: {
      oAuth2AuthenticationSettings: []
      openidAuthenticationSettings: []
    }
    subscriptionKeyParameterNames: {
      header: 'Ocp-Apim-Subscription-Key'
      query: 'subscription-key'
    }
    isCurrent: true
  }
}

resource apim_case_sharepoint_integration 'Microsoft.ApiManagement/service/apis@2022-09-01-preview' = {
  parent: apim
  name: 'case-sharepoint-integration'
  properties: {
    displayName: 'Case Sharepoint Integration'
    apiRevision: '1'
    description: 'Import from "azfun-atlasdocs-prod-001" Function App'
    subscriptionRequired: true
    path: 'case-sharepoint-integration/api'
    protocols: [
      'https'
    ]
    authenticationSettings: {
      oAuth2AuthenticationSettings: []
      openidAuthenticationSettings: []
    }
    subscriptionKeyParameterNames: {
      header: 'Ocp-Apim-Subscription-Key'
      query: 'subscription-key'
    }
    isCurrent: true
  }
}

resource apim_echo_azurestorage 'Microsoft.ApiManagement/service/apis@2022-09-01-preview' = {
  parent: apim
  name: 'echo-azurestorage'
  properties: {
    displayName: 'Echo - AzureStorage'
    apiRevision: '1'
    description: 'this API is created for accessing blob stored in Echo\'s Azure storage account stechoprod001'
    subscriptionRequired: true
    serviceUrl: 'https://apim-apm-uat.azure-api.net/echo-blob'
    path: 'echo-blob'
    protocols: [
      'https'
    ]
    authenticationSettings: {
      oAuth2AuthenticationSettings: []
      openidAuthenticationSettings: []
    }
    subscriptionKeyParameterNames: {
      header: 'Ocp-Apim-Subscription-Key'
      query: 'subscription-key'
    }
    isCurrent: true
  }
}

resource apim_echo_la_populate_echo_template 'Microsoft.ApiManagement/service/apis@2022-09-01-preview' = {
  parent: apim
  name: 'echo-la-populate-echo-template'
  properties: {
    displayName: 'Echo - la-populate-echo-template'
    apiRevision: '1'
    description: 'Azure Logic App.'
    subscriptionRequired: true
    serviceUrl: 'https://apim-apm-uat.azure-api.net/echo-la'
    path: 'echo-la'
    protocols: [
      'https'
    ]
    authenticationSettings: {
      oAuth2AuthenticationSettings: []
      openidAuthenticationSettings: []
    }
    subscriptionKeyParameterNames: {
      header: 'Ocp-Apim-Subscription-Key'
      query: 'subscription-key'
    }
    isCurrent: true
  }
}

resource apim_emailapi 'Microsoft.ApiManagement/service/apis@2022-09-01-preview' = {
  parent: apim
  name: 'emailapi'
  properties: {
    displayName: 'Email API'
    apiRevision: '1'
    description: 'Import from "azfun-emailapi-prod" Function App'
    subscriptionRequired: true
    path: 'email'
    protocols: [
      'https'
    ]
    authenticationSettings: {
      oAuth2AuthenticationSettings: []
      openidAuthenticationSettings: []
    }
    subscriptionKeyParameterNames: {
      header: 'Ocp-Apim-Subscription-Key'
      query: 'subscription-key'
    }
    isCurrent: true
  }
}

resource apim_la_html_pdf_template 'Microsoft.ApiManagement/service/apis@2022-09-01-preview' = {
  parent: apim
  name: 'la-html-pdf-template'
  properties: {
    displayName: 'la-html-pdf-template'
    apiRevision: '1'
    description: 'Azure Logic App.'
    subscriptionRequired: true
    serviceUrl: 'https://prod-14.australiaeast.logic.azure.com/workflows/c35baea64f6942269571db2845ef595d/triggers'
    path: 'htmlpdftemplate-la'
    protocols: [
      'https'
    ]
    authenticationSettings: {
      oAuth2AuthenticationSettings: []
      openidAuthenticationSettings: []
    }
    subscriptionKeyParameterNames: {
      header: 'Ocp-Apim-Subscription-Key'
      query: 'subscription-key'
    }
    isCurrent: true
  }
}

resource apim_pat 'Microsoft.ApiManagement/service/apis@2022-09-01-preview' = {
  parent: apim
  name: 'pat'
  properties: {
    displayName: 'PAT'
    apiRevision: '1'
    description: 'Import from "azfun-pat-prod-001" Function App'
    subscriptionRequired: false
    path: 'pat'
    protocols: [
      'https'
    ]
    authenticationSettings: {
      oAuth2AuthenticationSettings: []
      openidAuthenticationSettings: []
    }
    subscriptionKeyParameterNames: {
      header: 'Ocp-Apim-Subscription-Key'
      query: 'subscription-key'
    }
    isCurrent: true
  }
}

resource apim_pdf_merge 'Microsoft.ApiManagement/service/apis@2022-09-01-preview' = {
  parent: apim
  name: 'pdf-merge'
  properties: {
    displayName: 'PDF Merge'
    apiRevision: '1'
    description: 'API Documentation for PDF Merge API'
    subscriptionRequired: true
    serviceUrl: 'https://azfun-pdfmerge-prod-001.azurewebsites.net/api'
    path: 'pdfmerge'
    protocols: [
      'https'
    ]
    authenticationSettings: {
      oAuth2AuthenticationSettings: []
      openidAuthenticationSettings: []
    }
    subscriptionKeyParameterNames: {
      header: 'Ocp-Apim-Subscription-Key'
      query: 'subscription-key'
    }
    isCurrent: true
  }
}

resource apim_referrals_internal 'Microsoft.ApiManagement/service/apis@2022-09-01-preview' = {
  parent: apim
  name: 'referrals-internal'
  properties: {
    displayName: 'Referrals Internal'
    apiRevision: '1'
    description: 'Import from "azfun-referralapiinternal-prod" Function App'
    subscriptionRequired: false
    path: 'referrals-internal'
    protocols: [
      'https'
    ]
    authenticationSettings: {
      oAuth2AuthenticationSettings: []
      openidAuthenticationSettings: []
    }
    subscriptionKeyParameterNames: {
      header: 'Ocp-Apim-Subscription-Key'
      query: 'subscription-key'
    }
    isCurrent: true
  }
}

resource apim_referrals_public 'Microsoft.ApiManagement/service/apis@2022-09-01-preview' = {
  parent: apim
  name: 'referrals-public'
  properties: {
    displayName: 'Referrals Public'
    apiRevision: '1'
    description: 'Import from "azfun-referralapipublic-prod" Function App'
    subscriptionRequired: false
    path: 'referrals-public'
    protocols: [
      'https'
    ]
    authenticationSettings: {
      oAuth2AuthenticationSettings: []
      openidAuthenticationSettings: []
    }
    subscriptionKeyParameterNames: {
      header: 'Ocp-Apim-Subscription-Key'
      query: 'subscription-key'
    }
    isCurrent: true
  }
}

resource apim_sharepoint_management 'Microsoft.ApiManagement/service/apis@2022-09-01-preview' = {
  parent: apim
  name: 'sharepoint-management'
  properties: {
    displayName: 'Sharepoint Management'
    apiRevision: '1'
    description: 'Azure Logic App.'
    subscriptionRequired: true
    serviceUrl: 'https://prod-15.australiaeast.logic.azure.com/workflows/c76f1a45264a4a36b18a635d3e73d530/triggers'
    path: 'sharepoint-management'
    protocols: [
      'https'
    ]
    authenticationSettings: {
      oAuth2AuthenticationSettings: []
      openidAuthenticationSettings: []
    }
    subscriptionKeyParameterNames: {
      header: 'Ocp-Apim-Subscription-Key'
      query: 'subscription-key'
    }
    isCurrent: true
  }
}

resource apim_wordtemplate 'Microsoft.ApiManagement/service/apis@2022-09-01-preview' = {
  parent: apim
  name: 'wordtemplate'
  properties: {
    displayName: 'Word Templates (Common)'
    apiRevision: '1'
    description: 'Import from "func-wordtemplate-prod" Function App'
    subscriptionRequired: true
    path: 'wordtemplate'
    protocols: [
      'https'
    ]
    authenticationSettings: {
      oAuth2AuthenticationSettings: []
      openidAuthenticationSettings: []
    }
    subscriptionKeyParameterNames: {
      header: 'Ocp-Apim-Subscription-Key'
      query: 'subscription-key'
    }
    isCurrent: true
  }
}

resource Microsoft_ApiManagement_service_backends_apim_azfun_atlasdocs_prod_001 'Microsoft.ApiManagement/service/backends@2022-09-01-preview' = {
  parent: apim
  name: 'azfun-atlasdocs-prod-001'
  properties: {
    description: 'azfun-atlasdocs-prod-001'
    url: 'https://azfun-atlasdocs-prod-001.azurewebsites.net/api'
    protocol: 'http'
    resourceId: 'https://management.azure.com/subscriptions/ac28092f-e0a3-45b1-a9cb-e0f5165a72eb/resourceGroups/rg-atlas-prod-001/providers/Microsoft.Web/sites/azfun-atlasdocs-prod-001'
    credentials: {
      header: {
        'x-functions-key': [
          '{{azfun-atlasdocs-prod-001-key}}'
        ]
      }
    }
  }
}

resource apim_azfun_emailapi_prod 'Microsoft.ApiManagement/service/backends@2022-09-01-preview' = {
  parent: apim
  name: 'azfun-emailapi-prod'
  properties: {
    description: 'azfun-emailapi-prod'
    url: 'https://azfun-emailapi-prod.azurewebsites.net/api'
    protocol: 'http'
    resourceId: 'https://management.azure.com/subscriptions/ac28092f-e0a3-45b1-a9cb-e0f5165a72eb/resourceGroups/rg-syd-prod-emailapi-prod/providers/Microsoft.Web/sites/azfun-emailapi-prod'
    credentials: {
      header: {
        'x-functions-key': [
          '{{azfun-emailapi-prod-key}}'
        ]
      }
    }
  }
}

resource apim_azfun_pat_prod_001 'Microsoft.ApiManagement/service/backends@2022-09-01-preview' = {
  parent: apim
  name: 'azfun-pat-prod-001'
  properties: {
    description: 'azfun-pat-prod-001'
    url: 'https://azfun-pat-prod-001.azurewebsites.net/api'
    protocol: 'http'
    resourceId: 'https://management.azure.com/subscriptions/ac28092f-e0a3-45b1-a9cb-e0f5165a72eb/resourceGroups/rg-pat-prod-001/providers/Microsoft.Web/sites/azfun-pat-prod-001'
    credentials: {
      header: {
        'x-functions-key': [
          '{{azfun-pat-prod-001-key}}'
        ]
      }
    }
  }
}

resource apim_azfun_referralapiinternal_prod 'Microsoft.ApiManagement/service/backends@2022-09-01-preview' = {
  parent: apim
  name: 'azfun-referralapiinternal-prod'
  properties: {
    description: 'azfun-referralapiinternal-prod'
    url: 'https://azfun-referralapiinternal-prod.azurewebsites.net/api'
    protocol: 'http'
    resourceId: 'https://management.azure.com/subscriptions/ac28092f-e0a3-45b1-a9cb-e0f5165a72eb/resourceGroups/rg-syd-prod-referralapi-prod/providers/Microsoft.Web/sites/azfun-referralapiinternal-prod'
    credentials: {
      header: {
        'x-functions-key': [
          '{{azfun-referralapiinternal-prod-key}}'
        ]
      }
    }
  }
}

resource apim_azfun_referralapipublic_prod 'Microsoft.ApiManagement/service/backends@2022-09-01-preview' = {
  parent: apim
  name: 'azfun-referralapipublic-prod'
  properties: {
    description: 'azfun-referralapipublic-prod'
    url: 'https://azfun-referralapipublic-prod.azurewebsites.net/api'
    protocol: 'http'
    resourceId: 'https://management.azure.com/subscriptions/ac28092f-e0a3-45b1-a9cb-e0f5165a72eb/resourceGroups/rg-syd-prod-referralapi-prod/providers/Microsoft.Web/sites/azfun-referralapipublic-prod'
    credentials: {
      header: {
        'x-functions-key': [
          '{{azfun-referralapipublic-prod-key}}'
        ]
      }
    }
  }
}

resource apim_func_wordtemplate_prod 'Microsoft.ApiManagement/service/backends@2022-09-01-preview' = {
  parent: apim
  name: 'func-wordtemplate-prod'
  properties: {
    description: 'func-wordtemplate-prod'
    url: 'https://func-wordtemplate-prod.azurewebsites.net/api'
    protocol: 'http'
    resourceId: 'https://management.azure.com/subscriptions/ac28092f-e0a3-45b1-a9cb-e0f5165a72eb/resourceGroups/rg-syd-prod-templates/providers/Microsoft.Web/sites/func-wordtemplate-prod'
    credentials: {
      header: {
        'x-functions-key': [
          '{{func-wordtemplate-prod-key}}'
        ]
      }
    }
  }
}

resource apim_LogicApp_la_html_pdf_template_rg_echo_prod_001_ac28092fe0a345b1a9cbe0f5165a72eb 'Microsoft.ApiManagement/service/backends@2022-09-01-preview' = {
  parent: apim
  name: 'LogicApp_la-html-pdf-template_rg-echo-prod-001_ac28092fe0a345b1a9cbe0f5165a72eb'
  properties: {
    description: 'la-html-pdf-template'
    url: 'https://prod-14.australiaeast.logic.azure.com/workflows/c35baea64f6942269571db2845ef595d/triggers'
    protocol: 'http'
    resourceId: 'https://management.azure.com/subscriptions/ac28092f-e0a3-45b1-a9cb-e0f5165a72eb/resourceGroups/rg-echo-prod-001/providers/Microsoft.Logic/workflows/la-html-pdf-template'
  }
}

resource apim_LogicApp_la_populate_echo_template_rg_echo_pr_b08ffab61f61234ee50b567cec542972 'Microsoft.ApiManagement/service/backends@2022-09-01-preview' = {
  parent: apim
  name: 'LogicApp_la-populate-echo-template_rg-echo-pr_b08ffab61f61234ee50b567cec542972'
  properties: {
    description: 'la-populate-echo-template'
    url: 'https://prod-23.australiaeast.logic.azure.com/workflows/ca6be067f6094ad8a9a42fbefcc46b19/triggers'
    protocol: 'http'
    resourceId: 'https://management.azure.com/subscriptions/ac28092f-e0a3-45b1-a9cb-e0f5165a72eb/resourceGroups/rg-echo-prod-001/providers/Microsoft.Logic/workflows/la-populate-echo-template'
  }
}

resource apim_LogicApp_la_sharepoint_management_download_do_da91f2ae1dc410600a1240209e9d0b47 'Microsoft.ApiManagement/service/backends@2022-09-01-preview' = {
  parent: apim
  name: 'LogicApp_la-sharepoint-management-download-do_da91f2ae1dc410600a1240209e9d0b47'
  properties: {
    description: 'la-sharepoint-management-download-document'
    url: 'https://prod-15.australiaeast.logic.azure.com/workflows/c76f1a45264a4a36b18a635d3e73d530/triggers'
    protocol: 'http'
    resourceId: 'https://management.azure.com/subscriptions/ac28092f-e0a3-45b1-a9cb-e0f5165a72eb/resourceGroups/rg-sharepoint/providers/Microsoft.Logic/workflows/la-sharepoint-management-download-document'
  }
}

resource apim_LogicApp_la_sharepoint_management_upload_docu_4b284751ff52c9dc943493bedfd740ae 'Microsoft.ApiManagement/service/backends@2022-09-01-preview' = {
  parent: apim
  name: 'LogicApp_la-sharepoint-management-upload-docu_4b284751ff52c9dc943493bedfd740ae'
  properties: {
    description: 'la-sharepoint-management-upload-document'
    url: 'https://prod-17.australiaeast.logic.azure.com/workflows/f31a1367356548c5a78ab3d9821a2b23/triggers'
    protocol: 'http'
    resourceId: 'https://management.azure.com/subscriptions/ac28092f-e0a3-45b1-a9cb-e0f5165a72eb/resourceGroups/rg-sharepoint/providers/Microsoft.Logic/workflows/la-sharepoint-management-upload-document'
  }
}

resource apim_LogicApp_logic_sharepoint_download_document_p_19d26e4b3e09ab8fef9fc463b1b53b7a 'Microsoft.ApiManagement/service/backends@2022-09-01-preview' = {
  parent: apim
  name: 'LogicApp_logic-sharepoint-download-document-p_19d26e4b3e09ab8fef9fc463b1b53b7a'
  properties: {
    description: 'logic-sharepoint-download-document-prod-001'
    url: 'https://prod-07.australiaeast.logic.azure.com/workflows/98d849387050436c9042736b2af74193/triggers'
    protocol: 'http'
    resourceId: 'https://management.azure.com/subscriptions/ac28092f-e0a3-45b1-a9cb-e0f5165a72eb/resourceGroups/rg-sharepoint/providers/Microsoft.Logic/workflows/logic-sharepoint-download-document-prod-001'
  }
}

resource apim_LogicApp_logic_sharepoint_upload_document_pro_f4253d39106e90d2f05853e01f21e285 'Microsoft.ApiManagement/service/backends@2022-09-01-preview' = {
  parent: apim
  name: 'LogicApp_logic-sharepoint-upload-document-pro_f4253d39106e90d2f05853e01f21e285'
  properties: {
    description: 'logic-sharepoint-upload-document-prod-001'
    url: 'https://prod-20.australiaeast.logic.azure.com/workflows/4dd274400bea42428db6a00ceb5ecc34/triggers'
    protocol: 'http'
    resourceId: 'https://management.azure.com/subscriptions/ac28092f-e0a3-45b1-a9cb-e0f5165a72eb/resourceGroups/rg-sharepoint/providers/Microsoft.Logic/workflows/logic-sharepoint-upload-document-prod-001'
  }
}

resource apim_ai_atlas_prod_001 'Microsoft.ApiManagement/service/loggers@2022-09-01-preview' = {
  parent: apim
  name: 'ai-atlas-prod-001'
  properties: {
    loggerType: 'applicationInsights'
    credentials: {
      instrumentationKey: '{{Logger-Credentials--607ac551b8f67a1144c3d230}}'
    }
    isBuffered: true
    resourceId: '/subscriptions/ac28092f-e0a3-45b1-a9cb-e0f5165a72eb/resourceGroups/rg-atlas-prod-001/providers/microsoft.insights/components/ai-atlas-prod-001'
  }
}

resource apim_ai_pat_prod_001 'Microsoft.ApiManagement/service/loggers@2022-09-01-preview' = {
  parent: apim
  name: 'ai-pat-prod-001'
  properties: {
    loggerType: 'applicationInsights'
    credentials: {
      instrumentationKey: '{{Logger-Credentials--6070225c0af0f00c78f36616}}'
    }
    isBuffered: true
    resourceId: '/subscriptions/ac28092f-e0a3-45b1-a9cb-e0f5165a72eb/resourceGroups/rg-pat-prod-001/providers/microsoft.insights/components/ai-pat-prod-001'
  }
}

resource apim_ai_referralapi_prod 'Microsoft.ApiManagement/service/loggers@2022-09-01-preview' = {
  parent: apim
  name: 'ai-referralapi-prod'
  properties: {
    loggerType: 'applicationInsights'
    credentials: {
      instrumentationKey: '{{Logger-Credentials--6285df0ab8f67a0dd02b1a30}}'
    }
    isBuffered: true
    resourceId: '/subscriptions/ac28092f-e0a3-45b1-a9cb-e0f5165a72eb/resourceGroups/rg-syd-prod-referralapi-prod/providers/microsoft.insights/components/ai-referralapi-prod'
  }
}

resource apim_appi_apim 'Microsoft.ApiManagement/service/loggers@2022-09-01-preview' = {
  parent: apim
  name: 'appi-apim-apm-prod'
  properties: {
    loggerType: 'applicationInsights'
    description: 'Application insight production'
    credentials: {
      instrumentationKey: '{{Logger-Credentials--645b2196277a9713a809ec14}}'
    }
    isBuffered: true
    resourceId: '/subscriptions/ac28092f-e0a3-45b1-a9cb-e0f5165a72eb/resourceGroups/rg-syd-prod-common-prd/providers/microsoft.insights/components/appi-apim-apm-prod'
  }
}

resource apim_azuremonitor 'Microsoft.ApiManagement/service/loggers@2022-09-01-preview' = {
  parent: apim
  name: 'azuremonitor'
  properties: {
    loggerType: 'azureMonitor'
    isBuffered: true
  }
}

resource apim_6070225c0af0f00c78f36615 'Microsoft.ApiManagement/service/namedValues@2022-09-01-preview' = {
  parent: apim
  name: '6070225c0af0f00c78f36615'
  properties: {
    displayName: 'Logger-Credentials--6070225c0af0f00c78f36616'
    secret: true
  }
}

resource apim_607ac551b8f67a1144c3d22f 'Microsoft.ApiManagement/service/namedValues@2022-09-01-preview' = {
  parent: apim
  name: '607ac551b8f67a1144c3d22f'
  properties: {
    displayName: 'Logger-Credentials--607ac551b8f67a1144c3d230'
    secret: true
  }
}

resource apim_6285df0ab8f67a0dd02b1a2f 'Microsoft.ApiManagement/service/namedValues@2022-09-01-preview' = {
  parent: apim
  name: '6285df0ab8f67a0dd02b1a2f'
  properties: {
    displayName: 'Logger-Credentials--6285df0ab8f67a0dd02b1a30'
    secret: true
  }
}

resource apim_62f32a33dea76176bcf3f012 'Microsoft.ApiManagement/service/namedValues@2022-09-01-preview' = {
  parent: apim
  name: '62f32a33dea76176bcf3f012'
  properties: {
    displayName: 'echo-la-populate-echo-template_manual-invoke_62f32a33dea76176bcf3f012'
    tags: []
    secret: true
  }
}

resource apim_6340142a6098941d9f54d1f4 'Microsoft.ApiManagement/service/namedValues@2022-09-01-preview' = {
  parent: apim
  name: '6340142a6098941d9f54d1f4'
  properties: {
    displayName: 'la-html-pdf-template_manual-invoke_6340142a6098941d9f54d1f4'
    tags: []
    secret: true
  }
}

resource apim_63cf5c9d33691b8dbd7f8308 'Microsoft.ApiManagement/service/namedValues@2022-09-01-preview' = {
  parent: apim
  name: '63cf5c9d33691b8dbd7f8308'
  properties: {
    displayName: 'sharepoint-management_request-invoke_63cf5c9d33691b8dbd7f8308'
    tags: []
    secret: true
  }
}

resource apim_63cf5f0da6665dcc2be07967 'Microsoft.ApiManagement/service/namedValues@2022-09-01-preview' = {
  parent: apim
  name: '63cf5f0da6665dcc2be07967'
  properties: {
    displayName: 'sharepoint-management-upload-document_request-invoke_63cf5f0da6665dcc2be07967'
    tags: []
    secret: true
  }
}

resource apim_63cf60c091d8402108d34107 'Microsoft.ApiManagement/service/namedValues@2022-09-01-preview' = {
  parent: apim
  name: '63cf60c091d8402108d34107'
  properties: {
    displayName: 'sharepoint-management_63cf608a4ea4fbdb8b7f0f65_63cf60c091d8402108d34107'
    tags: []
    secret: true
  }
}

resource apim_63eb11b56a9a0219aacc38c4 'Microsoft.ApiManagement/service/namedValues@2022-09-01-preview' = {
  parent: apim
  name: '63eb11b56a9a0219aacc38c4'
  properties: {
    displayName: 'sharepoint-management_request-invoke_63eb11b56a9a0219aacc38c4'
    tags: []
    secret: true
  }
}

resource apim_63eb11cd96d6ad814a2d145a 'Microsoft.ApiManagement/service/namedValues@2022-09-01-preview' = {
  parent: apim
  name: '63eb11cd96d6ad814a2d145a'
  properties: {
    displayName: 'sharepoint-management_63cf608a4ea4fbdb8b7f0f65_63eb11cd96d6ad814a2d145a'
    tags: []
    secret: true
  }
}

resource apim_645b2196277a9713a809ec13 'Microsoft.ApiManagement/service/namedValues@2022-09-01-preview' = {
  parent: apim
  name: '645b2196277a9713a809ec13'
  properties: {
    displayName: 'Logger-Credentials--645b2196277a9713a809ec14'
    secret: true
  }
}

resource apim_authorizationserver 'Microsoft.ApiManagement/service/namedValues@2022-09-01-preview' = {
  parent: apim
  name: 'authorizationserver'
  properties: {
    displayName: 'authorizationServer'
    value: 'https://login.microsoftonline.com/apm.net.au/oauth2/v2.0/token'
    tags: []
    secret: false
  }
}

resource apim_azfun_atlasdocs_prod_001_key 'Microsoft.ApiManagement/service/namedValues@2022-09-01-preview' = {
  parent: apim
  name: 'azfun-atlasdocs-prod-001-key'
  properties: {
    displayName: 'azfun-atlasdocs-prod-001-key'
    tags: [
      'key'
      'function'
      'auto'
    ]
    secret: true
  }
}

resource apim_azfun_emailapi_prod_key 'Microsoft.ApiManagement/service/namedValues@2022-09-01-preview' = {
  parent: apim
  name: 'azfun-emailapi-prod-key'
  properties: {
    displayName: 'azfun-emailapi-prod-key'
    tags: [
      'key'
      'function'
      'auto'
    ]
    secret: true
  }
}

resource apim_azfun_pat_prod_001_key 'Microsoft.ApiManagement/service/namedValues@2022-09-01-preview' = {
  parent: apim
  name: 'azfun-pat-prod-001-key'
  properties: {
    displayName: 'azfun-pat-prod-001-key'
    tags: [
      'key'
      'function'
      'auto'
    ]
    secret: true
  }
}

resource apim_azfun_referralapiinternal_prod_key 'Microsoft.ApiManagement/service/namedValues@2022-09-01-preview' = {
  parent: apim
  name: 'azfun-referralapiinternal-prod-key'
  properties: {
    displayName: 'azfun-referralapiinternal-prod-key'
    tags: [
      'key'
      'function'
      'auto'
    ]
    secret: true
  }
}

resource apim_azfun_referralapipublic_prod_key 'Microsoft.ApiManagement/service/namedValues@2022-09-01-preview' = {
  parent: apim
  name: 'azfun-referralapipublic-prod-key'
  properties: {
    displayName: 'azfun-referralapipublic-prod-key'
    tags: [
      'key'
      'function'
      'auto'
    ]
    secret: true
  }
}

resource apim_clientid 'Microsoft.ApiManagement/service/namedValues@2022-09-01-preview' = {
  parent: apim
  name: 'clientid'
  properties: {
    displayName: 'clientId'
    value: 'b9331dd2-08db-48ad-83e8-b888ecf99271'
    tags: []
    secret: false
  }
}

resource apim_clientsecret 'Microsoft.ApiManagement/service/namedValues@2022-09-01-preview' = {
  parent: apim
  name: 'clientsecret'
  properties: {
    displayName: 'clientSecret'
    tags: []
    secret: true
  }
}

resource apim_func_wordtemplate_prod_key 'Microsoft.ApiManagement/service/namedValues@2022-09-01-preview' = {
  parent: apim
  name: 'func-wordtemplate-prod-key'
  properties: {
    displayName: 'func-wordtemplate-prod-key'
    tags: [
      'key'
      'function'
      'auto'
    ]
    secret: true
  }
}

resource apim_scope 'Microsoft.ApiManagement/service/namedValues@2022-09-01-preview' = {
  parent: apim
  name: 'scope'
  properties: {
    displayName: 'scope'
    value: 'https://advancedpersonnelmanagement.onmicrosoft.com/7c140808-ed30-4af1-b4b7-665e41d1fc19/.default'
    tags: []
    secret: false
  }
}

resource apim_AccountClosedPublisher 'Microsoft.ApiManagement/service/notifications@2022-09-01-preview' = {
  parent: apim
  name: 'AccountClosedPublisher'
}

resource apim_BCC 'Microsoft.ApiManagement/service/notifications@2022-09-01-preview' = {
  parent: apim
  name: 'BCC'
}

resource apim_NewApplicationNotificationMessage 'Microsoft.ApiManagement/service/notifications@2022-09-01-preview' = {
  parent: apim
  name: 'NewApplicationNotificationMessage'
}

resource apim_NewIssuePublisherNotificationMessage 'Microsoft.ApiManagement/service/notifications@2022-09-01-preview' = {
  parent: apim
  name: 'NewIssuePublisherNotificationMessage'
}

resource apim_PurchasePublisherNotificationMessage 'Microsoft.ApiManagement/service/notifications@2022-09-01-preview' = {
  parent: apim
  name: 'PurchasePublisherNotificationMessage'
}

resource apim_QuotaLimitApproachingPublisherNotificationMessage 'Microsoft.ApiManagement/service/notifications@2022-09-01-preview' = {
  parent: apim
  name: 'QuotaLimitApproachingPublisherNotificationMessage'
}

resource apim_RequestPublisherNotificationMessage 'Microsoft.ApiManagement/service/notifications@2022-09-01-preview' = {
  parent: apim
  name: 'RequestPublisherNotificationMessage'
}

resource apim_policy 'Microsoft.ApiManagement/service/policies@2022-09-01-preview' = {
  parent: apim
  name: 'policy'
  properties: {
    value: '<!--\r\n    IMPORTANT:\r\n    - Policy elements can appear only within the <inbound>, <outbound>, <backend> section elements.\r\n    - Only the <forward-request> policy element can appear within the <backend> section element.\r\n    - To apply a policy to the incoming request (before it is forwarded to the backend service), place a corresponding policy element within the <inbound> section element.\r\n    - To apply a policy to the outgoing response (before it is sent back to the caller), place a corresponding policy element within the <outbound> section element.\r\n    - To add a policy position the cursor at the desired insertion point and click on the round button associated with the policy.\r\n    - To remove a policy, delete the corresponding policy statement from the policy document.\r\n    - Policies are applied in the order of their appearance, from the top down.\r\n-->\r\n<policies>\r\n  <inbound />\r\n  <backend>\r\n    <forward-request />\r\n  </backend>\r\n  <outbound />\r\n</policies>'
    format: 'xml'
  }
}

resource apim_default 'Microsoft.ApiManagement/service/portalconfigs@2022-09-01-preview' = {
  parent: apim
  name: 'default'
  properties: {
    enableBasicAuth: false
    signin: {
      require: false
    }
    signup: {
      termsOfService: {
        requireConsent: false
      }
    }
    delegation: {
      delegateRegistration: false
      delegateSubscription: false
    }
    cors: {
      allowedOrigins: []
    }
    csp: {
      mode: 'enabled'
      reportUri: []
      allowedSources: []
    }
  }
}

resource apim_20221212114956 'Microsoft.ApiManagement/service/portalRevisions@2022-09-01-preview' = {
  parent: apim
  name: '20221212114956'
  properties: {
    isCurrent: true
  }
}

resource apim_delegation 'Microsoft.ApiManagement/service/portalsettings@2022-09-01-preview' = {
  parent: apim
  name: 'delegation'
  properties: {
    subscriptions: {
      enabled: false
    }
    userRegistration: {
      enabled: false
    }
  }
}

resource apim_signin 'Microsoft.ApiManagement/service/portalsettings@2022-09-01-preview' = {
  parent: apim
  name: 'signin'
  properties: {
    enabled: false
  }
}

resource apim_signup 'Microsoft.ApiManagement/service/portalsettings@2022-09-01-preview' = {
  parent: apim
  name: 'signup'
  properties: {
    enabled: false
    termsOfService: {
      enabled: false
      consentRequired: false
    }
  }
}

resource apim_corporate_info_and_apps_shared_apis 'Microsoft.ApiManagement/service/products@2022-09-01-preview' = {
  parent: apim
  name: 'corporate-info-and-apps-shared-apis'
  properties: {
    displayName: 'Corporate Info and Apps - Shared APIs'
    description: 'APIs created by Corporate Info and Apps Teams to be shared by multiple applications'
    subscriptionRequired: true
    approvalRequired: false
    state: 'notPublished'
  }
}

resource apim_sherpa 'Microsoft.ApiManagement/service/products@2022-09-01-preview' = {
  parent: apim
  name: 'sherpa'
  properties: {
    displayName: 'Sherpa'
    description: 'Sherpa product'
    subscriptionRequired: true
    approvalRequired: false
    state: 'notPublished'
  }
}

resource apim_starter 'Microsoft.ApiManagement/service/products@2022-09-01-preview' = {
  parent: apim
  name: 'starter'
  properties: {
    displayName: 'Starter'
    description: 'Subscribers will be able to run 5 calls/minute up to a maximum of 100 calls/week.'
    subscriptionRequired: true
    approvalRequired: false
    subscriptionsLimit: 1
    state: 'published'
  }
}

resource apim_unlimited 'Microsoft.ApiManagement/service/products@2022-09-01-preview' = {
  parent: apim
  name: 'unlimited'
  properties: {
    displayName: 'Unlimited'
    description: 'Subscribers have completely unlimited access to the API. Administrator approval is required.'
    subscriptionRequired: true
    approvalRequired: true
    subscriptionsLimit: 1
    state: 'published'
  }
}

resource Microsoft_ApiManagement_service_properties_apim_6070225c0af0f00c78f36615 'Microsoft.ApiManagement/service/properties@2019-01-01' = {
  parent: apim
  name: '6070225c0af0f00c78f36615'
  properties: {
    displayName: 'Logger-Credentials--6070225c0af0f00c78f36616'
    value: '011f3a53-98df-468d-96b5-6ebf7dca9b9d'
    secret: true
  }
}

resource Microsoft_ApiManagement_service_properties_apim_607ac551b8f67a1144c3d22f 'Microsoft.ApiManagement/service/properties@2019-01-01' = {
  parent: apim
  name: '607ac551b8f67a1144c3d22f'
  properties: {
    displayName: 'Logger-Credentials--607ac551b8f67a1144c3d230'
    value: '906cc646-ded8-4b9f-8b59-2629ba31cd1f'
    secret: true
  }
}

resource Microsoft_ApiManagement_service_properties_apim_6285df0ab8f67a0dd02b1a2f 'Microsoft.ApiManagement/service/properties@2019-01-01' = {
  parent: apim
  name: '6285df0ab8f67a0dd02b1a2f'
  properties: {
    displayName: 'Logger-Credentials--6285df0ab8f67a0dd02b1a30'
    value: '32059da7-cc2a-4dbc-9467-20cbd368df01'
    secret: true
  }
}

resource Microsoft_ApiManagement_service_properties_apim_62f32a33dea76176bcf3f012 'Microsoft.ApiManagement/service/properties@2019-01-01' = {
  parent: apim
  name: '62f32a33dea76176bcf3f012'
  properties: {
    displayName: 'echo-la-populate-echo-template_manual-invoke_62f32a33dea76176bcf3f012'
    value: 'LsRdqujFlKvSEpb7k4FbfKGpY8OdHXlSvvweEcBshI4'
    tags: []
    secret: true
  }
}

resource Microsoft_ApiManagement_service_properties_apim_6340142a6098941d9f54d1f4 'Microsoft.ApiManagement/service/properties@2019-01-01' = {
  parent: apim
  name: '6340142a6098941d9f54d1f4'
  properties: {
    displayName: 'la-html-pdf-template_manual-invoke_6340142a6098941d9f54d1f4'
    value: '4kvqf7R3zOB2YC0iykUywFPQBLxyixOBPkhFUbTfuUA'
    tags: []
    secret: true
  }
}

resource Microsoft_ApiManagement_service_properties_apim_63cf5c9d33691b8dbd7f8308 'Microsoft.ApiManagement/service/properties@2019-01-01' = {
  parent: apim
  name: '63cf5c9d33691b8dbd7f8308'
  properties: {
    displayName: 'sharepoint-management_request-invoke_63cf5c9d33691b8dbd7f8308'
    value: 'h-FGYZ6V8jpO3DvWUsffRu_3iX9YZ3v2PlQzA-0EvXA'
    tags: []
    secret: true
  }
}

resource Microsoft_ApiManagement_service_properties_apim_63cf5f0da6665dcc2be07967 'Microsoft.ApiManagement/service/properties@2019-01-01' = {
  parent: apim
  name: '63cf5f0da6665dcc2be07967'
  properties: {
    displayName: 'sharepoint-management-upload-document_request-invoke_63cf5f0da6665dcc2be07967'
    value: 'gUyMP2hKGrY2lSlAwMTVHRe2p0pcMVxyA2iPV-jBMkQ'
    tags: []
    secret: true
  }
}

resource Microsoft_ApiManagement_service_properties_apim_63cf60c091d8402108d34107 'Microsoft.ApiManagement/service/properties@2019-01-01' = {
  parent: apim
  name: '63cf60c091d8402108d34107'
  properties: {
    displayName: 'sharepoint-management_63cf608a4ea4fbdb8b7f0f65_63cf60c091d8402108d34107'
    value: 'gUyMP2hKGrY2lSlAwMTVHRe2p0pcMVxyA2iPV-jBMkQ'
    tags: []
    secret: true
  }
}

resource Microsoft_ApiManagement_service_properties_apim_63eb11b56a9a0219aacc38c4 'Microsoft.ApiManagement/service/properties@2019-01-01' = {
  parent: apim
  name: '63eb11b56a9a0219aacc38c4'
  properties: {
    displayName: 'sharepoint-management_request-invoke_63eb11b56a9a0219aacc38c4'
    value: '4mOI7trMPeDNTVjOwzdwzPb5o2WNShZNJPP64jTRGwM'
    tags: []
    secret: true
  }
}

resource Microsoft_ApiManagement_service_properties_apim_63eb11cd96d6ad814a2d145a 'Microsoft.ApiManagement/service/properties@2019-01-01' = {
  parent: apim
  name: '63eb11cd96d6ad814a2d145a'
  properties: {
    displayName: 'sharepoint-management_63cf608a4ea4fbdb8b7f0f65_63eb11cd96d6ad814a2d145a'
    value: 'ti9u0K8A0tEuxk0SuWBCjYMujMaheOzz79zZRf-JVhA'
    tags: []
    secret: true
  }
}

resource Microsoft_ApiManagement_service_properties_apim_645b2196277a9713a809ec13 'Microsoft.ApiManagement/service/properties@2019-01-01' = {
  parent: apim
  name: '645b2196277a9713a809ec13'
  properties: {
    displayName: 'Logger-Credentials--645b2196277a9713a809ec14'
    value: 'b8f50329-b2b0-41da-be78-906c9317692b'
    secret: true
  }
}

resource Microsoft_ApiManagement_service_properties_apim_authorizationserver 'Microsoft.ApiManagement/service/properties@2019-01-01' = {
  parent: apim
  name: 'authorizationserver'
  properties: {
    displayName: 'authorizationServer'
    value: 'https://login.microsoftonline.com/apm.net.au/oauth2/v2.0/token'
    tags: []
    secret: false
  }
}

resource Microsoft_ApiManagement_service_properties_apim_azfun_atlasdocs_prod_001_key 'Microsoft.ApiManagement/service/properties@2019-01-01' = {
  parent: apim
  name: 'azfun-atlasdocs-prod-001-key'
  properties: {
    displayName: 'azfun-atlasdocs-prod-001-key'
    value: 'mZ9TVyQ6QbZsxhm4jr42XcSkrA/4xY00luZh8CsvumvIzRyBsW1ChQ=='
    tags: [
      'key'
      'function'
      'auto'
    ]
    secret: true
  }
}

resource Microsoft_ApiManagement_service_properties_apim_azfun_emailapi_prod_key 'Microsoft.ApiManagement/service/properties@2019-01-01' = {
  parent: apim
  name: 'azfun-emailapi-prod-key'
  properties: {
    displayName: 'azfun-emailapi-prod-key'
    value: 'IqmVmbQWh00KeVqcriHD1QkgB+hHa0FpEexOpI9jMY/IXgbVRrNLHQ=='
    tags: [
      'key'
      'function'
      'auto'
    ]
    secret: true
  }
}

resource Microsoft_ApiManagement_service_properties_apim_azfun_pat_prod_001_key 'Microsoft.ApiManagement/service/properties@2019-01-01' = {
  parent: apim
  name: 'azfun-pat-prod-001-key'
  properties: {
    displayName: 'azfun-pat-prod-001-key'
    value: 'REqZjfKXgQ5z9w8J0VRhvdcm+wBQwy0mj5NTj9lwudm85cxJTOYVmQ=='
    tags: [
      'key'
      'function'
      'auto'
    ]
    secret: true
  }
}

resource Microsoft_ApiManagement_service_properties_apim_azfun_referralapiinternal_prod_key 'Microsoft.ApiManagement/service/properties@2019-01-01' = {
  parent: apim
  name: 'azfun-referralapiinternal-prod-key'
  properties: {
    displayName: 'azfun-referralapiinternal-prod-key'
    value: '3odLr3yEdTCdn2iCuUJAe1ORPHCKmkxH/HND6wQuv5kSXmu6efaspg=='
    tags: [
      'key'
      'function'
      'auto'
    ]
    secret: true
  }
}

resource Microsoft_ApiManagement_service_properties_apim_azfun_referralapipublic_prod_key 'Microsoft.ApiManagement/service/properties@2019-01-01' = {
  parent: apim
  name: 'azfun-referralapipublic-prod-key'
  properties: {
    displayName: 'azfun-referralapipublic-prod-key'
    value: 'maGkqyDurxRFGh5eJ9Rrt56plaV1DOPSsXrPvbBaaAOrON2oqgstng=='
    tags: [
      'key'
      'function'
      'auto'
    ]
    secret: true
  }
}

resource Microsoft_ApiManagement_service_properties_apim_clientid 'Microsoft.ApiManagement/service/properties@2019-01-01' = {
  parent: apim
  name: 'clientid'
  properties: {
    displayName: 'clientId'
    value: 'b9331dd2-08db-48ad-83e8-b888ecf99271'
    tags: []
    secret: false
  }
}

resource Microsoft_ApiManagement_service_properties_apim_clientsecret 'Microsoft.ApiManagement/service/properties@2019-01-01' = {
  parent: apim
  name: 'clientsecret'
  properties: {
    displayName: 'clientSecret'
    value: 'P62FLwE8wZPYYsHY1Azd4Lwtv0V6IEbilFw7lGK9/S0='
    tags: []
    secret: true
  }
}

resource Microsoft_ApiManagement_service_properties_apim_func_wordtemplate_prod_key 'Microsoft.ApiManagement/service/properties@2019-01-01' = {
  parent: apim
  name: 'func-wordtemplate-prod-key'
  properties: {
    displayName: 'func-wordtemplate-prod-key'
    value: 'h8LA+Dgn262biUg4en319sn3YfE+1jVvFK+9kRXpEeBLBxT7TWnBMA=='
    tags: [
      'key'
      'function'
      'auto'
    ]
    secret: true
  }
}

resource Microsoft_ApiManagement_service_properties_apim_scope 'Microsoft.ApiManagement/service/properties@2019-01-01' = {
  parent: apim
  name: 'scope'
  properties: {
    displayName: 'scope'
    value: 'https://advancedpersonnelmanagement.onmicrosoft.com/7c140808-ed30-4af1-b4b7-665e41d1fc19/.default'
    tags: []
    secret: false
  }
}

resource apim_master 'Microsoft.ApiManagement/service/subscriptions@2022-09-01-preview' = {
  parent: apim
  name: 'master'
  properties: {
    scope: '${apim.id}/'
    displayName: 'Built-in all-access subscription'
    state: 'active'
    allowTracing: false
  }
}

resource apim_Sharepoint_Prod 'Microsoft.ApiManagement/service/subscriptions@2022-09-01-preview' = {
  parent: apim
  name: 'Sharepoint-Prod'
  properties: {
    scope: '${apim.id}/apis'
    displayName: 'Sharepoint-Prod'
    state: 'active'
    allowTracing: false
  }
}

resource apim_Apmiq 'Microsoft.ApiManagement/service/tags@2022-09-01-preview' = {
  parent: apim
  name: 'Apmiq'
  properties: {
    displayName: 'Apmiq'
  }
}

resource apim_AtlasCaseSearch 'Microsoft.ApiManagement/service/tags@2022-09-01-preview' = {
  parent: apim
  name: 'AtlasCaseSearch'
  properties: {
    displayName: 'AtlasCaseSearch'
  }
}

resource apim_Case 'Microsoft.ApiManagement/service/tags@2022-09-01-preview' = {
  parent: apim
  name: 'Case'
  properties: {
    displayName: 'Case'
  }
}

resource apim_CaseNote 'Microsoft.ApiManagement/service/tags@2022-09-01-preview' = {
  parent: apim
  name: 'CaseNote'
  properties: {
    displayName: 'CaseNote'
  }
}

resource apim_Consultant 'Microsoft.ApiManagement/service/tags@2022-09-01-preview' = {
  parent: apim
  name: 'Consultant'
  properties: {
    displayName: 'Consultant'
  }
}

resource apim_echo 'Microsoft.ApiManagement/service/tags@2022-09-01-preview' = {
  parent: apim
  name: 'echo'
  properties: {
    displayName: 'Echo'
  }
}

resource apim_PdfMerge 'Microsoft.ApiManagement/service/tags@2022-09-01-preview' = {
  parent: apim
  name: 'PdfMerge'
  properties: {
    displayName: 'PdfMerge'
  }
}

resource apim_Referral 'Microsoft.ApiManagement/service/tags@2022-09-01-preview' = {
  parent: apim
  name: 'Referral'
  properties: {
    displayName: 'Referral'
  }
}

resource apim_Service 'Microsoft.ApiManagement/service/tags@2022-09-01-preview' = {
  parent: apim
  name: 'Service'
  properties: {
    displayName: 'Service'
  }
}

resource apim_Tac 'Microsoft.ApiManagement/service/tags@2022-09-01-preview' = {
  parent: apim
  name: 'Tac'
  properties: {
    displayName: 'Tac'
  }
}

resource apim_TacIndex 'Microsoft.ApiManagement/service/tags@2022-09-01-preview' = {
  parent: apim
  name: 'TacIndex'
  properties: {
    displayName: 'TacIndex'
  }
}

resource apim_AccountClosedDeveloper 'Microsoft.ApiManagement/service/templates@2022-09-01-preview' = {
  parent: apim
  name: 'AccountClosedDeveloper'
  properties: {
    subject: 'Thank you for using the $OrganizationName API!'
    body: '<!DOCTYPE html >\r\n<html>\r\n  <head />\r\n  <body>\r\n    <p style="font-size:12pt;font-family:\'Segoe UI\'">Dear $DevFirstName $DevLastName,</p>\r\n    <p style="font-size:12pt;font-family:\'Segoe UI\'">\r\n          On behalf of $OrganizationName and our customers we thank you for giving us a try. Your $OrganizationName API account is now closed.\r\n        </p>\r\n    <p style="font-size:12pt;font-family:\'Segoe UI\'">Thank you,</p>\r\n    <p style="font-size:12pt;font-family:\'Segoe UI\'">Your $OrganizationName Team</p>\r\n    <a href="$DevPortalUrl">$DevPortalUrl</a>\r\n    <p />\r\n  </body>\r\n</html>'
    title: 'Developer farewell letter'
    description: 'Developers receive this farewell email after they close their account.'
    parameters: [
      {
        name: 'DevFirstName'
        title: 'Developer first name'
      }
      {
        name: 'DevLastName'
        title: 'Developer last name'
      }
      {
        name: 'OrganizationName'
        title: 'Organization name'
      }
      {
        name: 'DevPortalUrl'
        title: 'Developer portal URL'
      }
    ]
  }
}

resource apim_ApplicationApprovedNotificationMessage 'Microsoft.ApiManagement/service/templates@2022-09-01-preview' = {
  parent: apim
  name: 'ApplicationApprovedNotificationMessage'
  properties: {
    subject: 'Your application $AppName is published in the application gallery'
    body: '<!DOCTYPE html >\r\n<html>\r\n  <head />\r\n  <body>\r\n    <p style="font-size:12pt;font-family:\'Segoe UI\'">Dear $DevFirstName $DevLastName,</p>\r\n    <p style="font-size:12pt;font-family:\'Segoe UI\'">\r\n          We are happy to let you know that your request to publish the $AppName application in the application gallery has been approved. Your application has been published and can be viewed <a href="http://$DevPortalUrl/Applications/Details/$AppId">here</a>.\r\n        </p>\r\n    <p style="font-size:12pt;font-family:\'Segoe UI\'">Best,</p>\r\n    <p style="font-size:12pt;font-family:\'Segoe UI\'">The $OrganizationName API Team</p>\r\n  </body>\r\n</html>'
    title: 'Application gallery submission approved (deprecated)'
    description: 'Developers who submitted their application for publication in the application gallery on the developer portal receive this email after their submission is approved.'
    parameters: [
      {
        name: 'AppId'
        title: 'Application id'
      }
      {
        name: 'AppName'
        title: 'Application name'
      }
      {
        name: 'DevFirstName'
        title: 'Developer first name'
      }
      {
        name: 'DevLastName'
        title: 'Developer last name'
      }
      {
        name: 'OrganizationName'
        title: 'Organization name'
      }
      {
        name: 'DevPortalUrl'
        title: 'Developer portal URL'
      }
    ]
  }
}

resource apim_ConfirmSignUpIdentityDefault 'Microsoft.ApiManagement/service/templates@2022-09-01-preview' = {
  parent: apim
  name: 'ConfirmSignUpIdentityDefault'
  properties: {
    subject: 'Please confirm your new $OrganizationName API account'
    body: '<!DOCTYPE html >\r\n<html>\r\n  <head>\r\n    <meta charset="UTF-8" />\r\n    <title>Letter</title>\r\n  </head>\r\n  <body>\r\n    <table width="100%">\r\n      <tr>\r\n        <td>\r\n          <p style="font-size:12pt;font-family:\'Segoe UI\'">Dear $DevFirstName $DevLastName,</p>\r\n          <p style="font-size:12pt;font-family:\'Segoe UI\'"></p>\r\n          <p style="font-size:12pt;font-family:\'Segoe UI\'">Thank you for joining the $OrganizationName API program! We host a growing number of cool APIs and strive to provide an awesome experience for API developers.</p>\r\n          <p style="font-size:12pt;font-family:\'Segoe UI\'">First order of business is to activate your account and get you going. To that end, please click on the following link:</p>\r\n          <p style="font-size:12pt;font-family:\'Segoe UI\'">\r\n            <a id="confirmUrl" href="$ConfirmUrl" style="text-decoration:none">\r\n              <strong>$ConfirmUrl</strong>\r\n            </a>\r\n          </p>\r\n          <p style="font-size:12pt;font-family:\'Segoe UI\'">If clicking the link does not work, please copy-and-paste or re-type it into your browser\'s address bar and hit "Enter".</p>\r\n          <p style="font-size:12pt;font-family:\'Segoe UI\'">Thank you,</p>\r\n          <p style="font-size:12pt;font-family:\'Segoe UI\'">$OrganizationName API Team</p>\r\n          <p style="font-size:12pt;font-family:\'Segoe UI\'">\r\n            <a href="$DevPortalUrl">$DevPortalUrl</a>\r\n          </p>\r\n        </td>\r\n      </tr>\r\n    </table>\r\n  </body>\r\n</html>'
    title: 'New developer account confirmation'
    description: 'Developers receive this email to confirm their e-mail address after they sign up for a new account.'
    parameters: [
      {
        name: 'DevFirstName'
        title: 'Developer first name'
      }
      {
        name: 'DevLastName'
        title: 'Developer last name'
      }
      {
        name: 'OrganizationName'
        title: 'Organization name'
      }
      {
        name: 'DevPortalUrl'
        title: 'Developer portal URL'
      }
      {
        name: 'ConfirmUrl'
        title: 'Developer activation URL'
      }
      {
        name: 'DevPortalHost'
        title: 'Developer portal hostname'
      }
      {
        name: 'ConfirmQuery'
        title: 'Query string part of the activation URL'
      }
    ]
  }
}

resource apim_EmailChangeIdentityDefault 'Microsoft.ApiManagement/service/templates@2022-09-01-preview' = {
  parent: apim
  name: 'EmailChangeIdentityDefault'
  properties: {
    subject: 'Please confirm the new email associated with your $OrganizationName API account'
    body: '<!DOCTYPE html >\r\n<html>\r\n  <head>\r\n    <meta charset="UTF-8" />\r\n    <title>Letter</title>\r\n  </head>\r\n  <body>\r\n    <table width="100%">\r\n      <tr>\r\n        <td>\r\n          <p style="font-size:12pt;font-family:\'Segoe UI\'">Dear $DevFirstName $DevLastName,</p>\r\n          <p style="font-size:12pt;font-family:\'Segoe UI\'"></p>\r\n          <p style="font-size:12pt;font-family:\'Segoe UI\'">You are receiving this email because you made a change to the email address on your $OrganizationName API account.</p>\r\n          <p style="font-size:12pt;font-family:\'Segoe UI\'">Please click on the following link to confirm the change:</p>\r\n          <p style="font-size:12pt;font-family:\'Segoe UI\'">\r\n            <a id="confirmUrl" href="$ConfirmUrl" style="text-decoration:none">\r\n              <strong>$ConfirmUrl</strong>\r\n            </a>\r\n          </p>\r\n          <p style="font-size:12pt;font-family:\'Segoe UI\'">If clicking the link does not work, please copy-and-paste or re-type it into your browser\'s address bar and hit "Enter".</p>\r\n          <p style="font-size:12pt;font-family:\'Segoe UI\'">Thank you,</p>\r\n          <p style="font-size:12pt;font-family:\'Segoe UI\'">$OrganizationName API Team</p>\r\n          <p style="font-size:12pt;font-family:\'Segoe UI\'">\r\n            <a href="$DevPortalUrl">$DevPortalUrl</a>\r\n          </p>\r\n        </td>\r\n      </tr>\r\n    </table>\r\n  </body>\r\n</html>'
    title: 'Email change confirmation'
    description: 'Developers receive this email to confirm a new e-mail address after they change their existing one associated with their account.'
    parameters: [
      {
        name: 'DevFirstName'
        title: 'Developer first name'
      }
      {
        name: 'DevLastName'
        title: 'Developer last name'
      }
      {
        name: 'OrganizationName'
        title: 'Organization name'
      }
      {
        name: 'DevPortalUrl'
        title: 'Developer portal URL'
      }
      {
        name: 'ConfirmUrl'
        title: 'Developer confirmation URL'
      }
      {
        name: 'DevPortalHost'
        title: 'Developer portal hostname'
      }
      {
        name: 'ConfirmQuery'
        title: 'Query string part of the confirmation URL'
      }
    ]
  }
}

resource apim_InviteUserNotificationMessage 'Microsoft.ApiManagement/service/templates@2022-09-01-preview' = {
  parent: apim
  name: 'InviteUserNotificationMessage'
  properties: {
    subject: 'You are invited to join the $OrganizationName developer network'
    body: '<!DOCTYPE html >\r\n<html>\r\n  <head />\r\n  <body>\r\n    <p style="font-size:12pt;font-family:\'Segoe UI\'">Dear $DevFirstName $DevLastName,</p>\r\n    <p style="font-size:12pt;font-family:\'Segoe UI\'">\r\n          Your account has been created. Please follow the link below to visit the $OrganizationName developer portal and claim it:\r\n        </p>\r\n    <p style="font-size:12pt;font-family:\'Segoe UI\'">\r\n      <a href="$ConfirmUrl">$ConfirmUrl</a>\r\n    </p>\r\n    <p style="font-size:12pt;font-family:\'Segoe UI\'">Best,</p>\r\n    <p style="font-size:12pt;font-family:\'Segoe UI\'">The $OrganizationName API Team</p>\r\n  </body>\r\n</html>'
    title: 'Invite user'
    description: 'An e-mail invitation to create an account, sent on request by API publishers.'
    parameters: [
      {
        name: 'OrganizationName'
        title: 'Organization name'
      }
      {
        name: 'DevFirstName'
        title: 'Developer first name'
      }
      {
        name: 'DevLastName'
        title: 'Developer last name'
      }
      {
        name: 'ConfirmUrl'
        title: 'Confirmation link'
      }
      {
        name: 'DevPortalHost'
        title: 'Developer portal hostname'
      }
      {
        name: 'ConfirmQuery'
        title: 'Query string part of the confirmation link'
      }
    ]
  }
}

resource apim_NewCommentNotificationMessage 'Microsoft.ApiManagement/service/templates@2022-09-01-preview' = {
  parent: apim
  name: 'NewCommentNotificationMessage'
  properties: {
    subject: '$IssueName issue has a new comment'
    body: '<!DOCTYPE html >\r\n<html>\r\n  <head />\r\n  <body>\r\n    <p style="font-size:12pt;font-family:\'Segoe UI\'">Dear $DevFirstName $DevLastName,</p>\r\n    <p style="font-size:12pt;font-family:\'Segoe UI\'">This is a brief note to let you know that $CommenterFirstName $CommenterLastName made the following comment on the issue $IssueName you created:</p>\r\n    <p style="font-size:12pt;font-family:\'Segoe UI\'">$CommentText</p>\r\n    <p style="font-size:12pt;font-family:\'Segoe UI\'">\r\n          To view the issue on the developer portal click <a href="http://$DevPortalUrl/issues/$IssueId">here</a>.\r\n        </p>\r\n    <p style="font-size:12pt;font-family:\'Segoe UI\'">Best,</p>\r\n    <p style="font-size:12pt;font-family:\'Segoe UI\'">The $OrganizationName API Team</p>\r\n  </body>\r\n</html>'
    title: 'New comment added to an issue (deprecated)'
    description: 'Developers receive this email when someone comments on the issue they created on the Issues page of the developer portal.'
    parameters: [
      {
        name: 'DevFirstName'
        title: 'Developer first name'
      }
      {
        name: 'DevLastName'
        title: 'Developer last name'
      }
      {
        name: 'CommenterFirstName'
        title: 'Commenter first name'
      }
      {
        name: 'CommenterLastName'
        title: 'Commenter last name'
      }
      {
        name: 'IssueId'
        title: 'Issue id'
      }
      {
        name: 'IssueName'
        title: 'Issue name'
      }
      {
        name: 'CommentText'
        title: 'Comment text'
      }
      {
        name: 'OrganizationName'
        title: 'Organization name'
      }
      {
        name: 'DevPortalUrl'
        title: 'Developer portal URL'
      }
    ]
  }
}

resource apim_NewDeveloperNotificationMessage 'Microsoft.ApiManagement/service/templates@2022-09-01-preview' = {
  parent: apim
  name: 'NewDeveloperNotificationMessage'
  properties: {
    subject: 'Welcome to the $OrganizationName API!'
    body: '<!DOCTYPE html >\r\n<html>\r\n  <head>\r\n    <meta charset="UTF-8" />\r\n    <title>Letter</title>\r\n  </head>\r\n  <body>\r\n    <h1 style="color:#000505;font-size:18pt;font-family:\'Segoe UI\'">\r\n          Welcome to <span style="color:#003363">$OrganizationName API!</span></h1>\r\n    <p style="font-size:12pt;font-family:\'Segoe UI\'">Dear $DevFirstName $DevLastName,</p>\r\n    <p style="font-size:12pt;font-family:\'Segoe UI\'">Your $OrganizationName API program registration is completed and we are thrilled to have you as a customer. Here are a few important bits of information for your reference:</p>\r\n    <table width="100%" style="margin:20px 0">\r\n      <tr>\r\n            #if ($IdentityProvider == "Basic")\r\n            <td width="50%" style="height:40px;vertical-align:top;font-family:\'Segoe UI\';font-size:12pt">\r\n              Please use the following <strong>username</strong> when signing into any of the \${OrganizationName}-hosted developer portals:\r\n            </td><td style="vertical-align:top;font-family:\'Segoe UI\';font-size:12pt"><strong>$DevUsername</strong></td>\r\n            #else\r\n            <td width="50%" style="height:40px;vertical-align:top;font-family:\'Segoe UI\';font-size:12pt">\r\n              Please use the following <strong>$IdentityProvider account</strong> when signing into any of the \${OrganizationName}-hosted developer portals:\r\n            </td><td style="vertical-align:top;font-family:\'Segoe UI\';font-size:12pt"><strong>$DevUsername</strong></td>            \r\n            #end\r\n          </tr>\r\n      <tr>\r\n        <td style="height:40px;vertical-align:top;font-family:\'Segoe UI\';font-size:12pt">\r\n              We will direct all communications to the following <strong>email address</strong>:\r\n            </td>\r\n        <td style="vertical-align:top;font-family:\'Segoe UI\';font-size:12pt">\r\n          <a href="mailto:$DevEmail" style="text-decoration:none">\r\n            <strong>$DevEmail</strong>\r\n          </a>\r\n        </td>\r\n      </tr>\r\n    </table>\r\n    <p style="font-size:12pt;font-family:\'Segoe UI\'">Best of luck in your API pursuits!</p>\r\n    <p style="font-size:12pt;font-family:\'Segoe UI\'">$OrganizationName API Team</p>\r\n    <p style="font-size:12pt;font-family:\'Segoe UI\'">\r\n      <a href="http://$DevPortalUrl">$DevPortalUrl</a>\r\n    </p>\r\n  </body>\r\n</html>'
    title: 'Developer welcome letter'
    description: 'Developers receive this “welcome” email after they confirm their new account.'
    parameters: [
      {
        name: 'DevFirstName'
        title: 'Developer first name'
      }
      {
        name: 'DevLastName'
        title: 'Developer last name'
      }
      {
        name: 'DevUsername'
        title: 'Developer user name'
      }
      {
        name: 'DevEmail'
        title: 'Developer email'
      }
      {
        name: 'OrganizationName'
        title: 'Organization name'
      }
      {
        name: 'DevPortalUrl'
        title: 'Developer portal URL'
      }
      {
        name: 'IdentityProvider'
        title: 'Identity Provider selected by Organization'
      }
    ]
  }
}

resource apim_NewIssueNotificationMessage 'Microsoft.ApiManagement/service/templates@2022-09-01-preview' = {
  parent: apim
  name: 'NewIssueNotificationMessage'
  properties: {
    subject: 'Your request $IssueName was received'
    body: '<!DOCTYPE html >\r\n<html>\r\n  <head />\r\n  <body>\r\n    <p style="font-size:12pt;font-family:\'Segoe UI\'">Dear $DevFirstName $DevLastName,</p>\r\n    <p style="font-size:12pt;font-family:\'Segoe UI\'">Thank you for contacting us. Our API team will review your issue and get back to you soon.</p>\r\n    <p style="font-size:12pt;font-family:\'Segoe UI\'">\r\n          Click this <a href="http://$DevPortalUrl/issues/$IssueId">link</a> to view or edit your request.\r\n        </p>\r\n    <p style="font-size:12pt;font-family:\'Segoe UI\'">Best,</p>\r\n    <p style="font-size:12pt;font-family:\'Segoe UI\'">The $OrganizationName API Team</p>\r\n  </body>\r\n</html>'
    title: 'New issue received (deprecated)'
    description: 'This email is sent to developers after they create a new topic on the Issues page of the developer portal.'
    parameters: [
      {
        name: 'DevFirstName'
        title: 'Developer first name'
      }
      {
        name: 'DevLastName'
        title: 'Developer last name'
      }
      {
        name: 'IssueId'
        title: 'Issue id'
      }
      {
        name: 'IssueName'
        title: 'Issue name'
      }
      {
        name: 'OrganizationName'
        title: 'Organization name'
      }
      {
        name: 'DevPortalUrl'
        title: 'Developer portal URL'
      }
    ]
  }
}

resource apim_PasswordResetByAdminNotificationMessage 'Microsoft.ApiManagement/service/templates@2022-09-01-preview' = {
  parent: apim
  name: 'PasswordResetByAdminNotificationMessage'
  properties: {
    subject: 'Your password was reset'
    body: '<!DOCTYPE html >\r\n<html>\r\n  <head />\r\n  <body>\r\n    <table width="100%">\r\n      <tr>\r\n        <td>\r\n          <p style="font-size:12pt;font-family:\'Segoe UI\'">Dear $DevFirstName $DevLastName,</p>\r\n          <p style="font-size:12pt;font-family:\'Segoe UI\'"></p>\r\n          <p style="font-size:12pt;font-family:\'Segoe UI\'">The password of your $OrganizationName API account has been reset, per your request.</p>\r\n          <p style="font-size:12pt;font-family:\'Segoe UI\'">\r\n                Your new password is: <strong>$DevPassword</strong></p>\r\n          <p style="font-size:12pt;font-family:\'Segoe UI\'">Please make sure to change it next time you sign in.</p>\r\n          <p style="font-size:12pt;font-family:\'Segoe UI\'">Thank you,</p>\r\n          <p style="font-size:12pt;font-family:\'Segoe UI\'">$OrganizationName API Team</p>\r\n          <p style="font-size:12pt;font-family:\'Segoe UI\'">\r\n            <a href="$DevPortalUrl">$DevPortalUrl</a>\r\n          </p>\r\n        </td>\r\n      </tr>\r\n    </table>\r\n  </body>\r\n</html>'
    title: 'Password reset by publisher notification (Password reset by admin)'
    description: 'Developers receive this email when the publisher resets their password.'
    parameters: [
      {
        name: 'DevFirstName'
        title: 'Developer first name'
      }
      {
        name: 'DevLastName'
        title: 'Developer last name'
      }
      {
        name: 'DevPassword'
        title: 'New Developer password'
      }
      {
        name: 'OrganizationName'
        title: 'Organization name'
      }
      {
        name: 'DevPortalUrl'
        title: 'Developer portal URL'
      }
    ]
  }
}

resource apim_PasswordResetIdentityDefault 'Microsoft.ApiManagement/service/templates@2022-09-01-preview' = {
  parent: apim
  name: 'PasswordResetIdentityDefault'
  properties: {
    subject: 'Your password change request'
    body: '<!DOCTYPE html >\r\n<html>\r\n  <head>\r\n    <meta charset="UTF-8" />\r\n    <title>Letter</title>\r\n  </head>\r\n  <body>\r\n    <table width="100%">\r\n      <tr>\r\n        <td>\r\n          <p style="font-size:12pt;font-family:\'Segoe UI\'">Dear $DevFirstName $DevLastName,</p>\r\n          <p style="font-size:12pt;font-family:\'Segoe UI\'"></p>\r\n          <p style="font-size:12pt;font-family:\'Segoe UI\'">You are receiving this email because you requested to change the password on your $OrganizationName API account.</p>\r\n          <p style="font-size:12pt;font-family:\'Segoe UI\'">Please click on the link below and follow instructions to create your new password:</p>\r\n          <p style="font-size:12pt;font-family:\'Segoe UI\'">\r\n            <a id="resetUrl" href="$ConfirmUrl" style="text-decoration:none">\r\n              <strong>$ConfirmUrl</strong>\r\n            </a>\r\n          </p>\r\n          <p style="font-size:12pt;font-family:\'Segoe UI\'">If clicking the link does not work, please copy-and-paste or re-type it into your browser\'s address bar and hit "Enter".</p>\r\n          <p style="font-size:12pt;font-family:\'Segoe UI\'">Thank you,</p>\r\n          <p style="font-size:12pt;font-family:\'Segoe UI\'">$OrganizationName API Team</p>\r\n          <p style="font-size:12pt;font-family:\'Segoe UI\'">\r\n            <a href="$DevPortalUrl">$DevPortalUrl</a>\r\n          </p>\r\n        </td>\r\n      </tr>\r\n    </table>\r\n  </body>\r\n</html>'
    title: 'Password change confirmation'
    description: 'Developers receive this email when they request a password change of their account. The purpose of the email is to verify that the account owner made the request and to provide a one-time perishable URL for changing the password.'
    parameters: [
      {
        name: 'DevFirstName'
        title: 'Developer first name'
      }
      {
        name: 'DevLastName'
        title: 'Developer last name'
      }
      {
        name: 'OrganizationName'
        title: 'Organization name'
      }
      {
        name: 'DevPortalUrl'
        title: 'Developer portal URL'
      }
      {
        name: 'ConfirmUrl'
        title: 'Developer new password instruction URL'
      }
      {
        name: 'DevPortalHost'
        title: 'Developer portal hostname'
      }
      {
        name: 'ConfirmQuery'
        title: 'Query string part of the instruction URL'
      }
    ]
  }
}

resource apim_PurchaseDeveloperNotificationMessage 'Microsoft.ApiManagement/service/templates@2022-09-01-preview' = {
  parent: apim
  name: 'PurchaseDeveloperNotificationMessage'
  properties: {
    subject: 'Your subscription to the $ProdName'
    body: '<!DOCTYPE html >\r\n<html>\r\n  <head />\r\n  <body>\r\n    <p style="font-size:12pt;font-family:\'Segoe UI\'">Greetings $DevFirstName $DevLastName!</p>\r\n    <p style="font-size:12pt;font-family:\'Segoe UI\'">\r\n          Thank you for subscribing to the <a href="http://$DevPortalUrl/products/$ProdId"><strong>$ProdName</strong></a> and welcome to the $OrganizationName developer community. We are delighted to have you as part of the team and are looking forward to the amazing applications you will build using our API!\r\n        </p>\r\n    <p style="font-size:12pt;font-family:\'Segoe UI\'">Below are a few subscription details for your reference:</p>\r\n    <p style="font-size:12pt;font-family:\'Segoe UI\'">\r\n      <ul>\r\n            #if ($SubStartDate != "")\r\n            <li style="font-size:12pt;font-family:\'Segoe UI\'">Start date: $SubStartDate</li>\r\n            #end\r\n            \r\n            #if ($SubTerm != "")\r\n            <li style="font-size:12pt;font-family:\'Segoe UI\'">Subscription term: $SubTerm</li>\r\n            #end\r\n          </ul>\r\n    </p>\r\n    <p style="font-size:12pt;font-family:\'Segoe UI\'">\r\n            Visit the developer <a href="http://$DevPortalUrl/developer">profile area</a> to manage your subscription and subscription keys\r\n        </p>\r\n    <p style="font-size:12pt;font-family:\'Segoe UI\'">A couple of pointers to help get you started:</p>\r\n    <p style="font-size:12pt;font-family:\'Segoe UI\'">\r\n      <strong>\r\n        <a href="http://$DevPortalUrl/docs/services?product=$ProdId">Learn about the API</a>\r\n      </strong>\r\n    </p>\r\n    <p style="font-size:12pt;font-family:\'Segoe UI\'">The API documentation provides all information necessary to make a request and to process a response. Code samples are provided per API operation in a variety of languages. Moreover, an interactive console allows making API calls directly from the developer portal without writing any code.</p>\r\n    <p style="font-size:12pt;font-family:\'Segoe UI\'">\r\n      <strong>\r\n        <a href="http://$DevPortalUrl/applications">Feature your app in the app gallery</a>\r\n      </strong>\r\n    </p>\r\n    <p style="font-size:12pt;font-family:\'Segoe UI\'">You can publish your application on our gallery for increased visibility to potential new users.</p>\r\n    <p style="font-size:12pt;font-family:\'Segoe UI\'">\r\n      <strong>\r\n        <a href="http://$DevPortalUrl/issues">Stay in touch</a>\r\n      </strong>\r\n    </p>\r\n    <p style="font-size:12pt;font-family:\'Segoe UI\'">\r\n          If you have an issue, a question, a suggestion, a request, or if you just want to tell us something, go to the <a href="http://$DevPortalUrl/issues">Issues</a> page on the developer portal and create a new topic.\r\n        </p>\r\n    <p style="font-size:12pt;font-family:\'Segoe UI\'">Happy hacking,</p>\r\n    <p style="font-size:12pt;font-family:\'Segoe UI\'">The $OrganizationName API Team</p>\r\n    <a style="font-size:12pt;font-family:\'Segoe UI\'" href="http://$DevPortalUrl">$DevPortalUrl</a>\r\n  </body>\r\n</html>'
    title: 'New subscription activated'
    description: 'Developers receive this acknowledgement email after subscribing to a product.'
    parameters: [
      {
        name: 'DevFirstName'
        title: 'Developer first name'
      }
      {
        name: 'DevLastName'
        title: 'Developer last name'
      }
      {
        name: 'ProdId'
        title: 'Product ID'
      }
      {
        name: 'ProdName'
        title: 'Product name'
      }
      {
        name: 'OrganizationName'
        title: 'Organization name'
      }
      {
        name: 'SubStartDate'
        title: 'Subscription start date'
      }
      {
        name: 'SubTerm'
        title: 'Subscription term'
      }
      {
        name: 'DevPortalUrl'
        title: 'Developer portal URL'
      }
    ]
  }
}

resource apim_QuotaLimitApproachingDeveloperNotificationMessage 'Microsoft.ApiManagement/service/templates@2022-09-01-preview' = {
  parent: apim
  name: 'QuotaLimitApproachingDeveloperNotificationMessage'
  properties: {
    subject: 'You are approaching an API quota limit'
    body: '<!DOCTYPE html >\r\n<html>\r\n  <head>\r\n    <style>\r\n          body {font-size:12pt; font-family:"Segoe UI","Segoe WP","Tahoma","Arial","sans-serif";}\r\n          .alert { color: red; }\r\n          .child1 { padding-left: 20px; }\r\n          .child2 { padding-left: 40px; }\r\n          .number { text-align: right; }\r\n          .text { text-align: left; }\r\n          th, td { padding: 4px 10px; min-width: 100px; }\r\n          th { background-color: #DDDDDD;}\r\n        </style>\r\n  </head>\r\n  <body>\r\n    <p>Greetings $DevFirstName $DevLastName!</p>\r\n    <p>\r\n          You are approaching the quota limit on you subscription to the <strong>$ProdName</strong> product (primary key $SubPrimaryKey).\r\n          #if ($QuotaResetDate != "")\r\n          This quota will be renewed on $QuotaResetDate.\r\n          #else\r\n          This quota will not be renewed.\r\n          #end\r\n        </p>\r\n    <p>Below are details on quota usage for the subscription:</p>\r\n    <p>\r\n      <table>\r\n        <thead>\r\n          <th class="text">Quota Scope</th>\r\n          <th class="number">Calls</th>\r\n          <th class="number">Call Quota</th>\r\n          <th class="number">Bandwidth</th>\r\n          <th class="number">Bandwidth Quota</th>\r\n        </thead>\r\n        <tbody>\r\n          <tr>\r\n            <td class="text">Subscription</td>\r\n            <td class="number">\r\n                  #if ($CallsAlert == true)\r\n                  <span class="alert">$Calls</span>\r\n                  #else\r\n                  $Calls\r\n                  #end\r\n                </td>\r\n            <td class="number">$CallQuota</td>\r\n            <td class="number">\r\n                  #if ($BandwidthAlert == true)\r\n                  <span class="alert">$Bandwidth</span>\r\n                  #else\r\n                  $Bandwidth\r\n                  #end\r\n                </td>\r\n            <td class="number">$BandwidthQuota</td>\r\n          </tr>\r\n              #foreach ($api in $Apis)\r\n              <tr><td class="child1 text">API: $api.Name</td><td class="number">\r\n                  #if ($api.CallsAlert == true)\r\n                  <span class="alert">$api.Calls</span>\r\n                  #else\r\n                  $api.Calls\r\n                  #end\r\n                </td><td class="number">$api.CallQuota</td><td class="number">\r\n                  #if ($api.BandwidthAlert == true)\r\n                  <span class="alert">$api.Bandwidth</span>\r\n                  #else\r\n                  $api.Bandwidth\r\n                  #end\r\n                </td><td class="number">$api.BandwidthQuota</td></tr>\r\n              #foreach ($operation in $api.Operations)\r\n              <tr><td class="child2 text">Operation: $operation.Name</td><td class="number">\r\n                  #if ($operation.CallsAlert == true)\r\n                  <span class="alert">$operation.Calls</span>\r\n                  #else\r\n                  $operation.Calls\r\n                  #end\r\n                </td><td class="number">$operation.CallQuota</td><td class="number">\r\n                  #if ($operation.BandwidthAlert == true)\r\n                  <span class="alert">$operation.Bandwidth</span>\r\n                  #else\r\n                  $operation.Bandwidth\r\n                  #end\r\n                </td><td class="number">$operation.BandwidthQuota</td></tr>\r\n              #end\r\n              #end\r\n            </tbody>\r\n      </table>\r\n    </p>\r\n    <p>Thank you,</p>\r\n    <p>$OrganizationName API Team</p>\r\n    <a href="$DevPortalUrl">$DevPortalUrl</a>\r\n    <p />\r\n  </body>\r\n</html>'
    title: 'Developer quota limit approaching notification'
    description: 'Developers receive this email to alert them when they are approaching a quota limit.'
    parameters: [
      {
        name: 'DevFirstName'
        title: 'Developer first name'
      }
      {
        name: 'DevLastName'
        title: 'Developer last name'
      }
      {
        name: 'ProdName'
        title: 'Product name'
      }
      {
        name: 'OrganizationName'
        title: 'Organization name'
      }
      {
        name: 'SubPrimaryKey'
        title: 'Primary Subscription key'
      }
      {
        name: 'DevPortalUrl'
        title: 'Developer portal URL'
      }
      {
        name: 'QuotaResetDate'
        title: 'Quota reset date'
      }
    ]
  }
}

resource apim_RejectDeveloperNotificationMessage 'Microsoft.ApiManagement/service/templates@2022-09-01-preview' = {
  parent: apim
  name: 'RejectDeveloperNotificationMessage'
  properties: {
    subject: 'Your subscription request for the $ProdName'
    body: '<!DOCTYPE html >\r\n<html>\r\n  <head />\r\n  <body>\r\n    <p style="font-size:12pt;font-family:\'Segoe UI\'">Dear $DevFirstName $DevLastName,</p>\r\n    <p style="font-size:12pt;font-family:\'Segoe UI\'">\r\n          We would like to inform you that we reviewed your subscription request for the <strong>$ProdName</strong>.\r\n        </p>\r\n        #if ($SubDeclineReason == "")\r\n        <p style="font-size:12pt;font-family:\'Segoe UI\'">Regretfully, we were unable to approve it, as subscriptions are temporarily suspended at this time.</p>\r\n        #else\r\n        <p style="font-size:12pt;font-family:\'Segoe UI\'">\r\n          Regretfully, we were unable to approve it at this time for the following reason:\r\n          <div style="margin-left: 1.5em;"> $SubDeclineReason </div></p>\r\n        #end\r\n        <p style="font-size:12pt;font-family:\'Segoe UI\'"> We truly appreciate your interest. </p><p style="font-size:12pt;font-family:\'Segoe UI\'">All the best,</p><p style="font-size:12pt;font-family:\'Segoe UI\'">The $OrganizationName API Team</p><a style="font-size:12pt;font-family:\'Segoe UI\'" href="http://$DevPortalUrl">$DevPortalUrl</a></body>\r\n</html>'
    title: 'Subscription request declined'
    description: 'This email is sent to developers when their subscription requests for products requiring publisher approval is declined.'
    parameters: [
      {
        name: 'DevFirstName'
        title: 'Developer first name'
      }
      {
        name: 'DevLastName'
        title: 'Developer last name'
      }
      {
        name: 'SubDeclineReason'
        title: 'Reason for declining subscription'
      }
      {
        name: 'ProdName'
        title: 'Product name'
      }
      {
        name: 'OrganizationName'
        title: 'Organization name'
      }
      {
        name: 'DevPortalUrl'
        title: 'Developer portal URL'
      }
    ]
  }
}

resource apim_RequestDeveloperNotificationMessage 'Microsoft.ApiManagement/service/templates@2022-09-01-preview' = {
  parent: apim
  name: 'RequestDeveloperNotificationMessage'
  properties: {
    subject: 'Your subscription request for the $ProdName'
    body: '<!DOCTYPE html >\r\n<html>\r\n  <head />\r\n  <body>\r\n    <p style="font-size:12pt;font-family:\'Segoe UI\'">Dear $DevFirstName $DevLastName,</p>\r\n    <p style="font-size:12pt;font-family:\'Segoe UI\'">\r\n          Thank you for your interest in our <strong>$ProdName</strong> API product!\r\n        </p>\r\n    <p style="font-size:12pt;font-family:\'Segoe UI\'">\r\n          We were delighted to receive your subscription request. We will promptly review it and get back to you at <strong>$DevEmail</strong>.\r\n        </p>\r\n    <p style="font-size:12pt;font-family:\'Segoe UI\'">Thank you,</p>\r\n    <p style="font-size:12pt;font-family:\'Segoe UI\'">The $OrganizationName API Team</p>\r\n    <a style="font-size:12pt;font-family:\'Segoe UI\'" href="http://$DevPortalUrl">$DevPortalUrl</a>\r\n  </body>\r\n</html>'
    title: 'Subscription request received'
    description: 'This email is sent to developers to acknowledge receipt of their subscription requests for products requiring publisher approval.'
    parameters: [
      {
        name: 'DevFirstName'
        title: 'Developer first name'
      }
      {
        name: 'DevLastName'
        title: 'Developer last name'
      }
      {
        name: 'DevEmail'
        title: 'Developer email'
      }
      {
        name: 'ProdName'
        title: 'Product name'
      }
      {
        name: 'OrganizationName'
        title: 'Organization name'
      }
      {
        name: 'DevPortalUrl'
        title: 'Developer portal URL'
      }
    ]
  }
}

resource apim_1 'Microsoft.ApiManagement/service/users@2022-09-01-preview' = {
  parent: apim
  name: '1'
  properties: {
    firstName: 'Administrator'
    email: 'dawid.karszniewicz@apm.net.au'
    state: 'active'
    identities: [
      {
        provider: 'Azure'
        id: 'dawid.karszniewicz@apm.net.au'
      }
    ]
    lastName: null
  }
}

resource apim_azfun_atlasdocs_prod_001_get_apmiqdocdata 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_azfun_atlasdocs_prod_001
  name: 'get-apmiqdocdata'
  properties: {
    displayName: 'APMIQDOCDATA'
    method: 'GET'
    urlTemplate: '/APMIQDOCDATA'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_azfun_atlasdocs_prod_001_get_casesearchsharepointgetdocumenttitles 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_azfun_atlasdocs_prod_001
  name: 'get-casesearchsharepointgetdocumenttitles'
  properties: {
    displayName: 'CaseSearchSharepointGetDocumentTitles'
    method: 'GET'
    urlTemplate: '/CaseSearchSharepointGetDocumentTitles'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_azfun_atlasdocs_prod_001_get_getchartimages 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_azfun_atlasdocs_prod_001
  name: 'get-getchartimages'
  properties: {
    displayName: 'GetChartImages'
    method: 'GET'
    urlTemplate: '/GetChartImages'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_azfun_atlasdocs_prod_001_get_lifeindexquestionnaire 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_azfun_atlasdocs_prod_001
  name: 'get-lifeindexquestionnaire'
  properties: {
    displayName: 'LifeIndexQuestionnaire'
    method: 'GET'
    urlTemplate: '/LifeIndexQuestionnaire'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_azfun_atlasdocs_prod_001_options_casesearchsharepointgetdocumenttitles 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_azfun_atlasdocs_prod_001
  name: 'options-casesearchsharepointgetdocumenttitles'
  properties: {
    displayName: 'CaseSearchSharepointGetDocumentTitles'
    method: 'OPTIONS'
    urlTemplate: '/CaseSearchSharepointGetDocumentTitles'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_azfun_atlasdocs_prod_001_options_getchartimages 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_azfun_atlasdocs_prod_001
  name: 'options-getchartimages'
  properties: {
    displayName: 'GetChartImages'
    method: 'OPTIONS'
    urlTemplate: '/GetChartImages'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_63b7c6384869c8d036d34940 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: '63b7c6384869c8d036d34940'
  properties: {
    displayName: '/api/AtlasCaseSearch/savemobiledocumenttosharepoint'
    method: 'POST'
    urlTemplate: '/api/AtlasCaseSearch/savemobiledocumenttosharepoint'
    templateParameters: []
    description: '/api/AtlasCaseSearch/savemobiledocumenttosharepoint'
    request: {
      queryParameters: [
        {
          name: 'CaseId'
          type: 'string'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiAtlasCaseSearchSavemobiledocumenttoblobstoragePostRequest'
        }
        {
          name: 'LibraryName'
          type: 'string'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiAtlasCaseSearchSavemobiledocumenttoblobstoragePostRequest-1'
        }
        {
          name: 'DocumentName'
          type: 'string'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiAtlasCaseSearchSavemobiledocumenttoblobstoragePostRequest-2'
        }
        {
          name: 'UserName'
          type: 'string'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiAtlasCaseSearchSavemobiledocumenttoblobstoragePostRequest-3'
        }
        {
          name: 'emailId'
          type: 'string'
          values: []
        }
        {
          name: 'AtlasPID'
          type: 'string'
          values: []
        }
      ]
      headers: [
        {
          name: 'apmtoken-preferred_username'
          type: 'string'
          values: []
        }
      ]
      representations: [
        {
          contentType: 'multipart/form-data'
        }
      ]
    }
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: []
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_ApmiqScoreV2_Ticks 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'ApmiqScoreV2_Ticks'
  properties: {
    displayName: 'ApmiqScoreV2_Ticks'
    method: 'GET'
    urlTemplate: '/api/Case/{caseId}/apmiqscorev2/{ticks}'
    templateParameters: [
      {
        name: 'caseId'
        description: 'Format - int32.'
        type: 'integer'
        required: true
        values: []
        schemaId: '6079449db8f67a1144c3d201'
        typeName: 'ApiCase-caseId-Apmiqscorev2-ticks-GetRequest'
      }
      {
        name: 'ticks'
        description: 'Format - int64.'
        type: 'integer'
        required: true
        values: []
        schemaId: '6079449db8f67a1144c3d201'
        typeName: 'ApiCase-caseId-Apmiqscorev2-ticks-GetRequest-1'
      }
    ]
    description: 'ApmiqScoreV2_Ticks'
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'ApimqScoreResponse'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: '{\r\n  "processedDate": "string",\r\n  "score": 0.0,\r\n  "answers": [\r\n    {\r\n      "text": "string",\r\n      "answerScore": 0.0\r\n    }\r\n  ],\r\n  "previousScores": [\r\n    {\r\n      "processedDate": "string",\r\n      "score": 0.0\r\n    }\r\n  ],\r\n  "processedTimeStamp": 0,\r\n  "error": "string"\r\n}'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'ApimqScoreResponse'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: '{\r\n  "processedDate": "string",\r\n  "score": 0.0,\r\n  "answers": [\r\n    {\r\n      "text": "string",\r\n      "answerScore": 0.0\r\n    }\r\n  ],\r\n  "previousScores": [\r\n    {\r\n      "processedDate": "string",\r\n      "score": 0.0\r\n    }\r\n  ],\r\n  "processedTimeStamp": 0,\r\n  "error": "string"\r\n}'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'ApimqScoreResponse'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_atlascasesearch_doesuserhaveaccess 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-atlascasesearch-doesuserhaveaccess'
  properties: {
    displayName: '/api/AtlasCaseSearch/doesuserhaveaccess - GET'
    method: 'GET'
    urlTemplate: '/api/AtlasCaseSearch/doesuserhaveaccess'
    templateParameters: []
    description: '/api/AtlasCaseSearch/doesuserhaveaccess - GET'
    request: {
      queryParameters: [
        {
          name: 'caseID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiAtlasCaseSearchDoesuserhaveaccessGetRequest'
        }
      ]
      headers: [
        {
          name: 'apmtoken-preferred_username'
          type: 'string'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiAtlasCaseSearchDoesuserhaveaccessGetRequest-1'
        }
      ]
      representations: []
    }
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'ApiAtlasCaseSearchDoesuserhaveaccessGet200TextPlainResponse'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: 'True'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'ApiAtlasCaseSearchDoesuserhaveaccessGet200ApplicationJsonResponse'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: 'True'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'ApiAtlasCaseSearchDoesuserhaveaccessGet200TextJsonResponse'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_atlascasesearch_getcasedatedetails 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-atlascasesearch-getcasedatedetails'
  properties: {
    displayName: '/api/AtlasCaseSearch/getcasedatedetails - GET'
    method: 'GET'
    urlTemplate: '/api/AtlasCaseSearch/getcasedatedetails'
    templateParameters: []
    description: '/api/AtlasCaseSearch/getcasedatedetails - GET'
    request: {
      queryParameters: [
        {
          name: 'UserID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiAtlasCaseSearchGetcasedatedetailsGetRequest'
        }
        {
          name: 'CaseID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiAtlasCaseSearchGetcasedatedetailsGetRequest-1'
        }
      ]
      headers: []
      representations: []
    }
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_CaseDateDetailsArray'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "id": 0,\r\n    "caseID": 0,\r\n    "dateTypeID": 0,\r\n    "date": "string",\r\n    "rtwTime": "string",\r\n    "rtwStatus": "string",\r\n    "rtwStatusDesc": "string",\r\n    "dateTypeDesc": "string",\r\n    "serviceID": 0,\r\n    "serviceDesc": "string",\r\n    "recordCreatedBy": 0,\r\n    "recordCreatedDate": "string"\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_CaseDateDetailsArray'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "id": 0,\r\n    "caseID": 0,\r\n    "dateTypeID": 0,\r\n    "date": "string",\r\n    "rtwTime": "string",\r\n    "rtwStatus": "string",\r\n    "rtwStatusDesc": "string",\r\n    "dateTypeDesc": "string",\r\n    "serviceID": 0,\r\n    "serviceDesc": "string",\r\n    "recordCreatedBy": 0,\r\n    "recordCreatedDate": "string"\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_CaseDateDetailsArray'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_atlascasesearch_getcasedatestatus 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-atlascasesearch-getcasedatestatus'
  properties: {
    displayName: '/api/AtlasCaseSearch/getcasedatestatus - GET'
    method: 'GET'
    urlTemplate: '/api/AtlasCaseSearch/getcasedatestatus'
    templateParameters: []
    description: '/api/AtlasCaseSearch/getcasedatestatus - GET'
    request: {
      queryParameters: [
        {
          name: 'UserID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiAtlasCaseSearchGetcasedatestatusGetRequest'
        }
      ]
      headers: []
      representations: []
    }
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_CaseDateStatusArray'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "codeID": 0,\r\n    "codeDesc": "string"\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_CaseDateStatusArray'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "codeID": 0,\r\n    "codeDesc": "string"\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_CaseDateStatusArray'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_atlascasesearch_getriskynote 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-atlascasesearch-getriskynote'
  properties: {
    displayName: '/api/AtlasCaseSearch/getriskynote - GET'
    method: 'GET'
    urlTemplate: '/api/AtlasCaseSearch/getriskynote'
    templateParameters: []
    description: '/api/AtlasCaseSearch/getriskynote - GET'
    request: {
      queryParameters: [
        {
          name: 'CaseID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiAtlasCaseSearchGetriskynoteGetRequest'
        }
        {
          name: 'ClientID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiAtlasCaseSearchGetriskynoteGetRequest-1'
        }
      ]
      headers: []
      representations: []
    }
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_CaseRiskyNoteArray'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "riskyNote": "string"\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_CaseRiskyNoteArray'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "riskyNote": "string"\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_CaseRiskyNoteArray'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_atlascasesearch_getuploadtypes 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-atlascasesearch-getuploadtypes'
  properties: {
    displayName: '/api/AtlasCaseSearch/getuploadtypes - GET'
    method: 'GET'
    urlTemplate: '/api/AtlasCaseSearch/getuploadtypes'
    templateParameters: []
    description: '/api/AtlasCaseSearch/getuploadtypes - GET'
    request: {
      queryParameters: []
      headers: [
        {
          name: 'apmtoken-preferred_username'
          type: 'string'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiAtlasCaseSearchGetuploadtypesGetRequest'
        }
      ]
      representations: []
    }
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_UploadTypeArray'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "uploadTypeValue": "string",\r\n    "uploadTypeText": "string"\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_UploadTypeArray'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "uploadTypeValue": "string",\r\n    "uploadTypeText": "string"\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_UploadTypeArray'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_atlascasesearch_mycasemasterdetails 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-atlascasesearch-mycasemasterdetails'
  properties: {
    displayName: '/api/AtlasCaseSearch/mycasemasterdetails - GET'
    method: 'GET'
    urlTemplate: '/api/AtlasCaseSearch/mycasemasterdetails'
    templateParameters: []
    description: '/api/AtlasCaseSearch/mycasemasterdetails - GET'
    request: {
      queryParameters: [
        {
          name: 'CaseID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiAtlasCaseSearchMycasemasterdetailsGetRequest'
        }
      ]
      headers: []
      representations: []
    }
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_CaseMasterDetailsArray'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "busnClassCode": "string",\r\n    "jurisdictionCode": "string",\r\n    "caseStatusCode": "string",\r\n    "caseStatusUpdateDate": "string",\r\n    "rtwGoalCID": 0,\r\n    "rtwGoalUpdateDate": "string",\r\n    "currentHours": 0.0,\r\n    "currentDutiesCID": 0,\r\n    "goalHours": 0.0,\r\n    "goalDutiesCID": 0,\r\n    "initialReferralID": 0,\r\n    "caseAdditionalComment": "string",\r\n    "caseWhiteBoard": "string",\r\n    "caseCostToDate": 0.0,\r\n    "caseReOpenDate": "string",\r\n    "fundingExpiryDate": "string",\r\n    "approvedFunding": 0.0,\r\n    "datePlanApproved": "string",\r\n    "referralOfficeSourceCID": 0,\r\n    "caseReference": "string",\r\n    "initialReferralDate": "string",\r\n    "initialReferralTime": "string",\r\n    "dateValidFrom": "string",\r\n    "dateValidTo": "string",\r\n    "caseDesc": "string",\r\n    "caseClosedBy": 0,\r\n    "currentHrsPerDay": 0.0,\r\n    "currentDaysPerWeek": 0.0,\r\n    "acknowledgementDate": "string",\r\n    "acknowledgementBy": 0,\r\n    "workCapacityCID": 0,\r\n    "workCapacityUpdateDate": "string",\r\n    "recordCreatedDate": "string",\r\n    "recordCreatorID": 0,\r\n    "recordModifiedDate": "string",\r\n    "recordModifierID": 0,\r\n    "apmCaseID": 0,\r\n    "initialCaseState": "string",\r\n    "primaryConsultantID": 0,\r\n    "cmCostToDate": 0.0,\r\n    "caseStatusUpdatedBy": 0,\r\n    "caseActionStatus": "string",\r\n    "closedCapacityCID": 0,\r\n    "closedGoalAchievedDate": "string",\r\n    "closedGoalCID": 0,\r\n    "closedGoalIsAchieved": true,\r\n    "closedGoalNotAchievedReasonCID": 0,\r\n    "closedOutcomeCID": 0,\r\n    "currentReferralDate": "string",\r\n    "currentReferralID": 0,\r\n    "fitness": "string",\r\n    "isAPMClosureOutcome": "string",\r\n    "isAPMClosureOutcomeDesc": "string",\r\n    "archiveStatus": 0,\r\n    "goalAchieved": true,\r\n    "closedEmployer": 0,\r\n    "closedDuties": 0,\r\n    "closedHours": 0,\r\n    "caseServiceCompanyID": 0,\r\n    "externalCaseid": "string",\r\n    "autoGeneratedBy": "string",\r\n    "doNotDeDupe": true,\r\n    "iCareApprovedTravelFunding": 0.0,\r\n    "userDefinedCaseCloseDate": "string",\r\n    "udCaseClosedModifierPID": 0,\r\n    "allowMultipleSameService": true,\r\n    "allowMultipleSameServiceModifierID": 0,\r\n    "closedOutcomeWhy": "string",\r\n    "isArchived": true,\r\n    "closedClientEmployer": "string",\r\n    "closediCareOutcomeId": 0,\r\n    "isVIP": true\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_CaseMasterDetailsArray'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "busnClassCode": "string",\r\n    "jurisdictionCode": "string",\r\n    "caseStatusCode": "string",\r\n    "caseStatusUpdateDate": "string",\r\n    "rtwGoalCID": 0,\r\n    "rtwGoalUpdateDate": "string",\r\n    "currentHours": 0.0,\r\n    "currentDutiesCID": 0,\r\n    "goalHours": 0.0,\r\n    "goalDutiesCID": 0,\r\n    "initialReferralID": 0,\r\n    "caseAdditionalComment": "string",\r\n    "caseWhiteBoard": "string",\r\n    "caseCostToDate": 0.0,\r\n    "caseReOpenDate": "string",\r\n    "fundingExpiryDate": "string",\r\n    "approvedFunding": 0.0,\r\n    "datePlanApproved": "string",\r\n    "referralOfficeSourceCID": 0,\r\n    "caseReference": "string",\r\n    "initialReferralDate": "string",\r\n    "initialReferralTime": "string",\r\n    "dateValidFrom": "string",\r\n    "dateValidTo": "string",\r\n    "caseDesc": "string",\r\n    "caseClosedBy": 0,\r\n    "currentHrsPerDay": 0.0,\r\n    "currentDaysPerWeek": 0.0,\r\n    "acknowledgementDate": "string",\r\n    "acknowledgementBy": 0,\r\n    "workCapacityCID": 0,\r\n    "workCapacityUpdateDate": "string",\r\n    "recordCreatedDate": "string",\r\n    "recordCreatorID": 0,\r\n    "recordModifiedDate": "string",\r\n    "recordModifierID": 0,\r\n    "apmCaseID": 0,\r\n    "initialCaseState": "string",\r\n    "primaryConsultantID": 0,\r\n    "cmCostToDate": 0.0,\r\n    "caseStatusUpdatedBy": 0,\r\n    "caseActionStatus": "string",\r\n    "closedCapacityCID": 0,\r\n    "closedGoalAchievedDate": "string",\r\n    "closedGoalCID": 0,\r\n    "closedGoalIsAchieved": true,\r\n    "closedGoalNotAchievedReasonCID": 0,\r\n    "closedOutcomeCID": 0,\r\n    "currentReferralDate": "string",\r\n    "currentReferralID": 0,\r\n    "fitness": "string",\r\n    "isAPMClosureOutcome": "string",\r\n    "isAPMClosureOutcomeDesc": "string",\r\n    "archiveStatus": 0,\r\n    "goalAchieved": true,\r\n    "closedEmployer": 0,\r\n    "closedDuties": 0,\r\n    "closedHours": 0,\r\n    "caseServiceCompanyID": 0,\r\n    "externalCaseid": "string",\r\n    "autoGeneratedBy": "string",\r\n    "doNotDeDupe": true,\r\n    "iCareApprovedTravelFunding": 0.0,\r\n    "userDefinedCaseCloseDate": "string",\r\n    "udCaseClosedModifierPID": 0,\r\n    "allowMultipleSameService": true,\r\n    "allowMultipleSameServiceModifierID": 0,\r\n    "closedOutcomeWhy": "string",\r\n    "isArchived": true,\r\n    "closedClientEmployer": "string",\r\n    "closediCareOutcomeId": 0,\r\n    "isVIP": true\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_CaseMasterDetailsArray'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_atlascasesearch_mycasesearchcasecontact 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-atlascasesearch-mycasesearchcasecontact'
  properties: {
    displayName: '/api/AtlasCaseSearch/mycasesearchcasecontact - GET'
    method: 'GET'
    urlTemplate: '/api/AtlasCaseSearch/mycasesearchcasecontact'
    templateParameters: []
    description: '/api/AtlasCaseSearch/mycasesearchcasecontact - GET'
    request: {
      queryParameters: [
        {
          name: 'CaseID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiAtlasCaseSearchMycasesearchcasecontactGetRequest'
        }
      ]
      headers: []
      representations: []
    }
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_CaseContactArray'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "pid": 0,\r\n    "service": "string",\r\n    "contact": "string",\r\n    "workEmail": "string",\r\n    "mobilePhone": "string",\r\n    "phone": "string",\r\n    "role": "string"\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_CaseContactArray'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "pid": 0,\r\n    "service": "string",\r\n    "contact": "string",\r\n    "workEmail": "string",\r\n    "mobilePhone": "string",\r\n    "phone": "string",\r\n    "role": "string"\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_CaseContactArray'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_atlascasesearch_mycasesearchcases 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-atlascasesearch-mycasesearchcases'
  properties: {
    displayName: '/api/AtlasCaseSearch/mycasesearchcases - GET'
    method: 'GET'
    urlTemplate: '/api/AtlasCaseSearch/mycasesearchcases'
    templateParameters: []
    description: '/api/AtlasCaseSearch/mycasesearchcases - GET'
    request: {
      queryParameters: [
        {
          name: 'searchtext'
          type: 'string'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiAtlasCaseSearchMycasesearchcasesGetRequest'
        }
        {
          name: 'primaryconsultant'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiAtlasCaseSearchMycasesearchcasesGetRequest-1'
        }
        {
          name: 'showclosed'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiAtlasCaseSearchMycasesearchcasesGetRequest-2'
        }
        {
          name: 'isprimcons'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiAtlasCaseSearchMycasesearchcasesGetRequest-3'
        }
        {
          name: 'isusersearch'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiAtlasCaseSearchMycasesearchcasesGetRequest-4'
        }
      ]
      headers: [
        {
          name: 'apmtoken-preferred_username'
          type: 'string'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiAtlasCaseSearchMycasesearchcasesGetRequest-5'
        }
      ]
      representations: []
    }
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_DisplayAllMyCasesArray'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "caseId": 0,\r\n    "injuryWorkerId": 0,\r\n    "displayRiskyWarning": "string",\r\n    "riskyNote": "string",\r\n    "primaryConsultant": "string",\r\n    "navURL": "string",\r\n    "navTOURL": "string"\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_DisplayAllMyCasesArray'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "caseId": 0,\r\n    "injuryWorkerId": 0,\r\n    "displayRiskyWarning": "string",\r\n    "riskyNote": "string",\r\n    "primaryConsultant": "string",\r\n    "navURL": "string",\r\n    "navTOURL": "string"\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_DisplayAllMyCasesArray'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_atlascasesearch_mycasesearchcasesdetails 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-atlascasesearch-mycasesearchcasesdetails'
  properties: {
    displayName: '/api/AtlasCaseSearch/mycasesearchcasesdetails - GET'
    method: 'GET'
    urlTemplate: '/api/AtlasCaseSearch/mycasesearchcasesdetails'
    templateParameters: []
    description: '/api/AtlasCaseSearch/mycasesearchcasesdetails - GET'
    request: {
      queryParameters: [
        {
          name: 'searchtext'
          type: 'string'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiAtlasCaseSearchMycasesearchcasesdetailsGetRequest'
        }
        {
          name: 'primaryconsultant'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiAtlasCaseSearchMycasesearchcasesdetailsGetRequest-1'
        }
        {
          name: 'showclosed'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiAtlasCaseSearchMycasesearchcasesdetailsGetRequest-2'
        }
        {
          name: 'isprimcons'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiAtlasCaseSearchMycasesearchcasesdetailsGetRequest-3'
        }
        {
          name: 'isusersearch'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiAtlasCaseSearchMycasesearchcasesdetailsGetRequest-4'
        }
      ]
      headers: [
        {
          name: 'apmtoken-preferred_username'
          type: 'string'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiAtlasCaseSearchMycasesearchcasesdetailsGetRequest-5'
        }
      ]
      representations: []
    }
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_DisplayAllMyCaseDetailsArray'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "caseId": 0,\r\n    "busnClassCode": "string",\r\n    "jurisdictionCode": "string",\r\n    "initialReferralDate": "string",\r\n    "caseStatusDesc": "string",\r\n    "caseCostToDate": 0.0,\r\n    "costToDate": 0.0,\r\n    "claimNumber": "string",\r\n    "employeeName": "string",\r\n    "incidentDate": "string",\r\n    "injuryWorkerID": 0,\r\n    "totActivityRed": 0,\r\n    "totActivityYellow": 0,\r\n    "totActivityGreen": 0,\r\n    "navURL": "string",\r\n    "navToURL": "string",\r\n    "recordCreatedDate": "string",\r\n    "claimant": "string",\r\n    "isViewDetail": 0,\r\n    "employerInsurerInfo": "string",\r\n    "fundername": "string",\r\n    "lastCaseNoteDate": "string",\r\n    "fundingAvailable": 0.0,\r\n    "fundingExpiryDate": "string",\r\n    "caseActionStatus": "string",\r\n    "caseRTWGoal": "string",\r\n    "caseNoteCaseID": 0\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_DisplayAllMyCaseDetailsArray'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "caseId": 0,\r\n    "busnClassCode": "string",\r\n    "jurisdictionCode": "string",\r\n    "initialReferralDate": "string",\r\n    "caseStatusDesc": "string",\r\n    "caseCostToDate": 0.0,\r\n    "costToDate": 0.0,\r\n    "claimNumber": "string",\r\n    "employeeName": "string",\r\n    "incidentDate": "string",\r\n    "injuryWorkerID": 0,\r\n    "totActivityRed": 0,\r\n    "totActivityYellow": 0,\r\n    "totActivityGreen": 0,\r\n    "navURL": "string",\r\n    "navToURL": "string",\r\n    "recordCreatedDate": "string",\r\n    "claimant": "string",\r\n    "isViewDetail": 0,\r\n    "employerInsurerInfo": "string",\r\n    "fundername": "string",\r\n    "lastCaseNoteDate": "string",\r\n    "fundingAvailable": 0.0,\r\n    "fundingExpiryDate": "string",\r\n    "caseActionStatus": "string",\r\n    "caseRTWGoal": "string",\r\n    "caseNoteCaseID": 0\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_DisplayAllMyCaseDetailsArray'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_atlascasesearch_mycasesearchworkgroupconsultantlist 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-atlascasesearch-mycasesearchworkgroupconsultantlist'
  properties: {
    displayName: '/api/AtlasCaseSearch/mycasesearchworkgroupconsultantlist - GET'
    method: 'GET'
    urlTemplate: '/api/AtlasCaseSearch/mycasesearchworkgroupconsultantlist'
    templateParameters: []
    description: '/api/AtlasCaseSearch/mycasesearchworkgroupconsultantlist - GET'
    request: {
      queryParameters: [
        {
          name: 'WorkGroupID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiAtlasCaseSearchMycasesearchworkgroupconsultantlistGetRequest'
        }
      ]
      headers: [
        {
          name: 'apmtoken-preferred_username'
          type: 'string'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiAtlasCaseSearchMycasesearchworkgroupconsultantlistGetRequest-1'
        }
      ]
      representations: []
    }
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_WorkGroupConsultantListArray'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "pid": 0,\r\n    "pName": "string"\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_WorkGroupConsultantListArray'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "pid": 0,\r\n    "pName": "string"\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_WorkGroupConsultantListArray'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_atlascasesearch_mycasesearchworkgroupdetails 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-atlascasesearch-mycasesearchworkgroupdetails'
  properties: {
    displayName: '/api/AtlasCaseSearch/mycasesearchworkgroupdetails - GET'
    method: 'GET'
    urlTemplate: '/api/AtlasCaseSearch/mycasesearchworkgroupdetails'
    templateParameters: []
    description: '/api/AtlasCaseSearch/mycasesearchworkgroupdetails - GET'
    request: {
      queryParameters: []
      headers: [
        {
          name: 'apmtoken-preferred_username'
          type: 'string'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiAtlasCaseSearchMycasesearchworkgroupdetailsGetRequest'
        }
      ]
      representations: []
    }
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_WorkGroupDetailsArray'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "workgroupId": 0,\r\n    "workGroupName": "string"\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_WorkGroupDetailsArray'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "workgroupId": 0,\r\n    "workGroupName": "string"\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_WorkGroupDetailsArray'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_atlascasesearch_mycasetasks 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-atlascasesearch-mycasetasks'
  properties: {
    displayName: '/api/AtlasCaseSearch/mycasetasks - GET'
    method: 'GET'
    urlTemplate: '/api/AtlasCaseSearch/mycasetasks'
    templateParameters: []
    description: '/api/AtlasCaseSearch/mycasetasks - GET'
    request: {
      queryParameters: [
        {
          name: 'CaseID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiAtlasCaseSearchMycasetasksGetRequest'
        }
      ]
      headers: []
      representations: []
    }
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_CaseTaskArray'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "taskID": 0,\r\n    "taskType": "string",\r\n    "taskDesc": "string",\r\n    "taskAssigedRoleID": 0,\r\n    "taskStatusCode": "string",\r\n    "taskComments": "string",\r\n    "taskDuedate": "string",\r\n    "caseID": 0,\r\n    "referralID": 0,\r\n    "serviceID": 0,\r\n    "workflowID": 0\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_CaseTaskArray'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "taskID": 0,\r\n    "taskType": "string",\r\n    "taskDesc": "string",\r\n    "taskAssigedRoleID": 0,\r\n    "taskStatusCode": "string",\r\n    "taskComments": "string",\r\n    "taskDuedate": "string",\r\n    "caseID": 0,\r\n    "referralID": 0,\r\n    "serviceID": 0,\r\n    "workflowID": 0\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_CaseTaskArray'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_atlascasesearch_myddldatetypes 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-atlascasesearch-myddldatetypes'
  properties: {
    displayName: '/api/AtlasCaseSearch/myddldatetypes - GET'
    method: 'GET'
    urlTemplate: '/api/AtlasCaseSearch/myddldatetypes'
    templateParameters: []
    description: '/api/AtlasCaseSearch/myddldatetypes - GET'
    request: {
      queryParameters: [
        {
          name: 'CaseID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiAtlasCaseSearchMyddldatetypesGetRequest'
        }
      ]
      headers: []
      representations: []
    }
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_DateTypesArray'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "codeId": 0,\r\n    "code": "string",\r\n    "codeDesc": "string"\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_DateTypesArray'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "codeId": 0,\r\n    "code": "string",\r\n    "codeDesc": "string"\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_DateTypesArray'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_atlascasesearch_myddlhours 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-atlascasesearch-myddlhours'
  properties: {
    displayName: '/api/AtlasCaseSearch/myddlhours - GET'
    method: 'GET'
    urlTemplate: '/api/AtlasCaseSearch/myddlhours'
    templateParameters: []
    description: '/api/AtlasCaseSearch/myddlhours - GET'
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_HoursArray'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "codeDesc": "string"\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_HoursArray'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "codeDesc": "string"\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_HoursArray'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_atlascasesearch_myddlminutes 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-atlascasesearch-myddlminutes'
  properties: {
    displayName: '/api/AtlasCaseSearch/myddlminutes - GET'
    method: 'GET'
    urlTemplate: '/api/AtlasCaseSearch/myddlminutes'
    templateParameters: []
    description: '/api/AtlasCaseSearch/myddlminutes - GET'
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_MinutesArray'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "codeDesc": "string"\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_MinutesArray'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "codeDesc": "string"\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_MinutesArray'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_atlascasesearch_myddlservice 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-atlascasesearch-myddlservice'
  properties: {
    displayName: '/api/AtlasCaseSearch/myddlservice - GET'
    method: 'GET'
    urlTemplate: '/api/AtlasCaseSearch/myddlservice'
    templateParameters: []
    description: '/api/AtlasCaseSearch/myddlservice - GET'
    request: {
      queryParameters: [
        {
          name: 'CaseID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiAtlasCaseSearchMyddlserviceGetRequest'
        }
      ]
      headers: []
      representations: []
    }
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_DDLServiceArray'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "serviceId": 0,\r\n    "serviceDesc": "string"\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_DDLServiceArray'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "serviceId": 0,\r\n    "serviceDesc": "string"\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_DDLServiceArray'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_case_caseid 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-case-caseid'
  properties: {
    displayName: 'Get a case response'
    method: 'GET'
    urlTemplate: '/api/Case/{caseId}'
    templateParameters: [
      {
        name: 'caseId'
        description: 'Format - int32.'
        type: 'integer'
        required: true
        values: []
        schemaId: '6079449db8f67a1144c3d201'
        typeName: 'ApiCase-caseId-GetRequest'
      }
    ]
    description: 'Get a case response'
    responses: [
      {
        statusCode: 201
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'CaseViewResponse'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: '{\r\n  "client": {\r\n    "title": "string",\r\n    "firstName": "string",\r\n    "lastName": "string",\r\n    "address": {\r\n      "address": "string",\r\n      "state": "string",\r\n      "postCode": "string",\r\n      "suburb": "string",\r\n      "suburbStatePostCode": "string",\r\n      "fullAddress": "string"\r\n    },\r\n    "fullName": "string",\r\n    "addressee": "string",\r\n    "mobile": "string",\r\n    "dateOfBirth": "string",\r\n    "phone": "string"\r\n  },\r\n  "caseId": 0,\r\n  "incidentDate": "string",\r\n  "claimNumber": "string",\r\n  "libraryName": "string"\r\n}'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'CaseViewResponse'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: '{\r\n  "client": {\r\n    "title": "string",\r\n    "firstName": "string",\r\n    "lastName": "string",\r\n    "address": {\r\n      "address": "string",\r\n      "state": "string",\r\n      "postCode": "string",\r\n      "suburb": "string",\r\n      "suburbStatePostCode": "string",\r\n      "fullAddress": "string"\r\n    },\r\n    "fullName": "string",\r\n    "addressee": "string",\r\n    "mobile": "string",\r\n    "dateOfBirth": "string",\r\n    "phone": "string"\r\n  },\r\n  "caseId": 0,\r\n  "incidentDate": "string",\r\n  "claimNumber": "string",\r\n  "libraryName": "string"\r\n}'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'CaseViewResponse'
          }
        ]
        headers: []
      }
      {
        statusCode: 400
        description: 'Bad Request'
        representations: [
          {
            contentType: 'text/plain'
          }
          {
            contentType: 'application/json'
          }
          {
            contentType: 'text/json'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_case_caseid_apmiqscore 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-case-caseid-apmiqscore'
  properties: {
    displayName: '/api/Case/{caseId}/apmiqscore - GET'
    method: 'GET'
    urlTemplate: '/api/Case/{caseId}/apmiqscore'
    templateParameters: [
      {
        name: 'caseId'
        description: 'Format - int32.'
        type: 'integer'
        required: true
        values: []
        schemaId: '6079449db8f67a1144c3d201'
        typeName: 'ApiCase-caseId-ApmiqscoreGetRequest'
      }
    ]
    description: '/api/Case/{caseId}/apmiqscore - GET'
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'ApimqScoreResponse'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: '{\r\n  "processedDate": "string",\r\n  "score": 0.0,\r\n  "answers": [\r\n    {\r\n      "text": "string",\r\n      "answerScore": 0.0\r\n    }\r\n  ],\r\n  "previousScores": [\r\n    {\r\n      "processedDate": "string",\r\n      "score": 0.0\r\n    }\r\n  ],\r\n  "processedTimeStamp": 0,\r\n  "error": "string"\r\n}'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'ApimqScoreResponse'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: '{\r\n  "processedDate": "string",\r\n  "score": 0.0,\r\n  "answers": [\r\n    {\r\n      "text": "string",\r\n      "answerScore": 0.0\r\n    }\r\n  ],\r\n  "previousScores": [\r\n    {\r\n      "processedDate": "string",\r\n      "score": 0.0\r\n    }\r\n  ],\r\n  "processedTimeStamp": 0,\r\n  "error": "string"\r\n}'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'ApimqScoreResponse'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_case_caseid_apmiqscorev2 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-case-caseid-apmiqscorev2'
  properties: {
    displayName: '/api/Case/{caseId}/apmiqscorev2 - GET'
    method: 'GET'
    urlTemplate: '/api/Case/{caseId}/apmiqscorev2'
    templateParameters: [
      {
        name: 'caseId'
        description: 'Format - int32.'
        type: 'integer'
        required: true
        values: []
        schemaId: '6079449db8f67a1144c3d201'
        typeName: 'ApiCase-caseId-Apmiqscorev2GetRequest'
      }
    ]
    description: '/api/Case/{caseId}/apmiqscorev2 - GET'
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'ApimqScoreResponse'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: '{\r\n  "processedDate": "string",\r\n  "score": 0.0,\r\n  "answers": [\r\n    {\r\n      "text": "string",\r\n      "answerScore": 0.0\r\n    }\r\n  ],\r\n  "previousScores": [\r\n    {\r\n      "processedDate": "string",\r\n      "score": 0.0\r\n    }\r\n  ],\r\n  "processedTimeStamp": 0,\r\n  "error": "string"\r\n}'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'ApimqScoreResponse'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: '{\r\n  "processedDate": "string",\r\n  "score": 0.0,\r\n  "answers": [\r\n    {\r\n      "text": "string",\r\n      "answerScore": 0.0\r\n    }\r\n  ],\r\n  "previousScores": [\r\n    {\r\n      "processedDate": "string",\r\n      "score": 0.0\r\n    }\r\n  ],\r\n  "processedTimeStamp": 0,\r\n  "error": "string"\r\n}'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'ApimqScoreResponse'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_case_caseid_consultant 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-case-caseid-consultant'
  properties: {
    displayName: '/api/Case/{caseId}/consultant - GET'
    method: 'GET'
    urlTemplate: '/api/Case/{caseId}/consultant'
    templateParameters: [
      {
        name: 'caseId'
        description: 'Format - int32.'
        type: 'integer'
        required: true
        values: []
        schemaId: '6079449db8f67a1144c3d201'
        typeName: 'ApiCase-caseId-ConsultantGetRequest'
      }
    ]
    description: '/api/Case/{caseId}/consultant - GET'
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'ConsultantResponse'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: '{\r\n  "qualification": "string",\r\n  "title": "string",\r\n  "firstName": "string",\r\n  "lastName": "string",\r\n  "address": {\r\n    "address": "string",\r\n    "state": "string",\r\n    "postCode": "string",\r\n    "suburb": "string",\r\n    "suburbStatePostCode": "string",\r\n    "fullAddress": "string"\r\n  },\r\n  "fullName": "string",\r\n  "addressee": "string",\r\n  "mobile": "string",\r\n  "dateOfBirth": "string",\r\n  "phone": "string"\r\n}'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'ConsultantResponse'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: '{\r\n  "qualification": "string",\r\n  "title": "string",\r\n  "firstName": "string",\r\n  "lastName": "string",\r\n  "address": {\r\n    "address": "string",\r\n    "state": "string",\r\n    "postCode": "string",\r\n    "suburb": "string",\r\n    "suburbStatePostCode": "string",\r\n    "fullAddress": "string"\r\n  },\r\n  "fullName": "string",\r\n  "addressee": "string",\r\n  "mobile": "string",\r\n  "dateOfBirth": "string",\r\n  "phone": "string"\r\n}'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'ConsultantResponse'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_case_caseid_doctor 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-case-caseid-doctor'
  properties: {
    displayName: '/api/Case/{caseId}/doctor - GET'
    method: 'GET'
    urlTemplate: '/api/Case/{caseId}/doctor'
    templateParameters: [
      {
        name: 'caseId'
        description: 'Format - int32.'
        type: 'integer'
        required: true
        values: []
        schemaId: '6079449db8f67a1144c3d201'
        typeName: 'ApiCase-caseId-DoctorGetRequest'
      }
    ]
    description: '/api/Case/{caseId}/doctor - GET'
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'DoctorResponse'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: '{\r\n  "medicalCentreName": "string",\r\n  "title": "string",\r\n  "firstName": "string",\r\n  "lastName": "string",\r\n  "address": {\r\n    "address": "string",\r\n    "state": "string",\r\n    "postCode": "string",\r\n    "suburb": "string",\r\n    "suburbStatePostCode": "string",\r\n    "fullAddress": "string"\r\n  },\r\n  "fullName": "string",\r\n  "addressee": "string",\r\n  "mobile": "string",\r\n  "dateOfBirth": "string",\r\n  "phone": "string"\r\n}'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'DoctorResponse'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: '{\r\n  "medicalCentreName": "string",\r\n  "title": "string",\r\n  "firstName": "string",\r\n  "lastName": "string",\r\n  "address": {\r\n    "address": "string",\r\n    "state": "string",\r\n    "postCode": "string",\r\n    "suburb": "string",\r\n    "suburbStatePostCode": "string",\r\n    "fullAddress": "string"\r\n  },\r\n  "fullName": "string",\r\n  "addressee": "string",\r\n  "mobile": "string",\r\n  "dateOfBirth": "string",\r\n  "phone": "string"\r\n}'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'DoctorResponse'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_case_caseid_employer 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-case-caseid-employer'
  properties: {
    displayName: '/api/Case/{caseId}/employer - GET'
    method: 'GET'
    urlTemplate: '/api/Case/{caseId}/employer'
    templateParameters: [
      {
        name: 'caseId'
        description: 'Format - int32.'
        type: 'integer'
        required: true
        values: []
        schemaId: '6079449db8f67a1144c3d201'
        typeName: 'ApiCase-caseId-EmployerGetRequest'
      }
    ]
    description: '/api/Case/{caseId}/employer - GET'
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'CaseCompanyResponse'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: '{\r\n  "name": "string",\r\n  "address": {\r\n    "address": "string",\r\n    "state": "string",\r\n    "postCode": "string",\r\n    "suburb": "string",\r\n    "suburbStatePostCode": "string",\r\n    "fullAddress": "string"\r\n  },\r\n  "contact": {\r\n    "title": "string",\r\n    "firstName": "string",\r\n    "lastName": "string",\r\n    "address": {\r\n      "address": "string",\r\n      "state": "string",\r\n      "postCode": "string",\r\n      "suburb": "string",\r\n      "suburbStatePostCode": "string",\r\n      "fullAddress": "string"\r\n    },\r\n    "fullName": "string",\r\n    "addressee": "string",\r\n    "mobile": "string",\r\n    "dateOfBirth": "string",\r\n    "phone": "string"\r\n  }\r\n}'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'CaseCompanyResponse'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: '{\r\n  "name": "string",\r\n  "address": {\r\n    "address": "string",\r\n    "state": "string",\r\n    "postCode": "string",\r\n    "suburb": "string",\r\n    "suburbStatePostCode": "string",\r\n    "fullAddress": "string"\r\n  },\r\n  "contact": {\r\n    "title": "string",\r\n    "firstName": "string",\r\n    "lastName": "string",\r\n    "address": {\r\n      "address": "string",\r\n      "state": "string",\r\n      "postCode": "string",\r\n      "suburb": "string",\r\n      "suburbStatePostCode": "string",\r\n      "fullAddress": "string"\r\n    },\r\n    "fullName": "string",\r\n    "addressee": "string",\r\n    "mobile": "string",\r\n    "dateOfBirth": "string",\r\n    "phone": "string"\r\n  }\r\n}'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'CaseCompanyResponse'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_case_caseid_funder 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-case-caseid-funder'
  properties: {
    displayName: '/api/Case/{caseId}/funder - GET'
    method: 'GET'
    urlTemplate: '/api/Case/{caseId}/funder'
    templateParameters: [
      {
        name: 'caseId'
        description: 'Format - int32.'
        type: 'integer'
        required: true
        values: []
        schemaId: '6079449db8f67a1144c3d201'
        typeName: 'ApiCase-caseId-FunderGetRequest'
      }
    ]
    description: '/api/Case/{caseId}/funder - GET'
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'CaseCompanyResponse'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: '{\r\n  "name": "string",\r\n  "address": {\r\n    "address": "string",\r\n    "state": "string",\r\n    "postCode": "string",\r\n    "suburb": "string",\r\n    "suburbStatePostCode": "string",\r\n    "fullAddress": "string"\r\n  },\r\n  "contact": {\r\n    "title": "string",\r\n    "firstName": "string",\r\n    "lastName": "string",\r\n    "address": {\r\n      "address": "string",\r\n      "state": "string",\r\n      "postCode": "string",\r\n      "suburb": "string",\r\n      "suburbStatePostCode": "string",\r\n      "fullAddress": "string"\r\n    },\r\n    "fullName": "string",\r\n    "addressee": "string",\r\n    "mobile": "string",\r\n    "dateOfBirth": "string",\r\n    "phone": "string"\r\n  }\r\n}'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'CaseCompanyResponse'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: '{\r\n  "name": "string",\r\n  "address": {\r\n    "address": "string",\r\n    "state": "string",\r\n    "postCode": "string",\r\n    "suburb": "string",\r\n    "suburbStatePostCode": "string",\r\n    "fullAddress": "string"\r\n  },\r\n  "contact": {\r\n    "title": "string",\r\n    "firstName": "string",\r\n    "lastName": "string",\r\n    "address": {\r\n      "address": "string",\r\n      "state": "string",\r\n      "postCode": "string",\r\n      "suburb": "string",\r\n      "suburbStatePostCode": "string",\r\n      "fullAddress": "string"\r\n    },\r\n    "fullName": "string",\r\n    "addressee": "string",\r\n    "mobile": "string",\r\n    "dateOfBirth": "string",\r\n    "phone": "string"\r\n  }\r\n}'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'CaseCompanyResponse'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_case_caseid_insurer 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-case-caseid-insurer'
  properties: {
    displayName: '/api/Case/{caseId}/insurer - GET'
    method: 'GET'
    urlTemplate: '/api/Case/{caseId}/insurer'
    templateParameters: [
      {
        name: 'caseId'
        description: 'Format - int32.'
        type: 'integer'
        required: true
        values: []
        schemaId: '6079449db8f67a1144c3d201'
        typeName: 'ApiCase-caseId-InsurerGetRequest'
      }
    ]
    description: '/api/Case/{caseId}/insurer - GET'
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'CaseCompanyResponse'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: '{\r\n  "name": "string",\r\n  "address": {\r\n    "address": "string",\r\n    "state": "string",\r\n    "postCode": "string",\r\n    "suburb": "string",\r\n    "suburbStatePostCode": "string",\r\n    "fullAddress": "string"\r\n  },\r\n  "contact": {\r\n    "title": "string",\r\n    "firstName": "string",\r\n    "lastName": "string",\r\n    "address": {\r\n      "address": "string",\r\n      "state": "string",\r\n      "postCode": "string",\r\n      "suburb": "string",\r\n      "suburbStatePostCode": "string",\r\n      "fullAddress": "string"\r\n    },\r\n    "fullName": "string",\r\n    "addressee": "string",\r\n    "mobile": "string",\r\n    "dateOfBirth": "string",\r\n    "phone": "string"\r\n  }\r\n}'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'CaseCompanyResponse'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: '{\r\n  "name": "string",\r\n  "address": {\r\n    "address": "string",\r\n    "state": "string",\r\n    "postCode": "string",\r\n    "suburb": "string",\r\n    "suburbStatePostCode": "string",\r\n    "fullAddress": "string"\r\n  },\r\n  "contact": {\r\n    "title": "string",\r\n    "firstName": "string",\r\n    "lastName": "string",\r\n    "address": {\r\n      "address": "string",\r\n      "state": "string",\r\n      "postCode": "string",\r\n      "suburb": "string",\r\n      "suburbStatePostCode": "string",\r\n      "fullAddress": "string"\r\n    },\r\n    "fullName": "string",\r\n    "addressee": "string",\r\n    "mobile": "string",\r\n    "dateOfBirth": "string",\r\n    "phone": "string"\r\n  }\r\n}'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'CaseCompanyResponse'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_case_mycases 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-case-mycases'
  properties: {
    displayName: '/api/Case/mycases - GET'
    method: 'GET'
    urlTemplate: '/api/Case/mycases'
    templateParameters: []
    description: '/api/Case/mycases - GET'
    request: {
      queryParameters: []
      headers: [
        {
          name: 'apmtoken-preferred_username'
          type: 'string'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseMycasesGetRequest'
        }
      ]
      representations: []
    }
    responses: [
      {
        statusCode: 201
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'CasesEmailViewResponseArray'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "caseId": 0,\r\n    "workEmail": "string",\r\n    "claimant": "string"\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'CasesEmailViewResponseArray'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "caseId": 0,\r\n    "workEmail": "string",\r\n    "claimant": "string"\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'CasesEmailViewResponseArray'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_case_mycases_emailid 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-case-mycases-emailid'
  properties: {
    displayName: '/api/Case/mycases/{emailId} - GET'
    method: 'GET'
    urlTemplate: '/api/Case/mycases/{emailId}'
    templateParameters: [
      {
        name: 'emailId'
        type: 'string'
        required: true
        values: []
        schemaId: '6079449db8f67a1144c3d201'
        typeName: 'ApiCaseMycases-emailId-GetRequest'
      }
    ]
    description: '/api/Case/mycases/{emailId} - GET'
    responses: [
      {
        statusCode: 201
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'CasesEmailViewResponseArray'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "caseId": 0,\r\n    "workEmail": "string",\r\n    "claimant": "string"\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'CasesEmailViewResponseArray'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "caseId": 0,\r\n    "workEmail": "string",\r\n    "claimant": "string"\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'CasesEmailViewResponseArray'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_casenote_case_caseid 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-casenote-case-caseid'
  properties: {
    displayName: '/api/CaseNote/case/{caseId} - GET'
    method: 'GET'
    urlTemplate: '/api/CaseNote/case/{caseId}'
    templateParameters: [
      {
        name: 'caseId'
        description: 'Format - int32.'
        type: 'integer'
        required: true
        values: []
        schemaId: '6079449db8f67a1144c3d201'
        typeName: 'ApiCaseNoteCase-caseId-GetRequest'
      }
    ]
    description: '/api/CaseNote/case/{caseId} - GET'
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'ApiCaseNoteCaseCaseIdGet200TextPlainResponse'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: '[\r\n  "string"\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'ApiCaseNoteCaseCaseIdGet200ApplicationJsonResponse'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: '[\r\n  "string"\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'ApiCaseNoteCaseCaseIdGet200TextJsonResponse'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_casenote_casenotereferrallist 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-casenote-casenotereferrallist'
  properties: {
    displayName: '/api/CaseNote/casenotereferrallist - GET'
    method: 'GET'
    urlTemplate: '/api/CaseNote/casenotereferrallist'
    templateParameters: []
    description: '/api/CaseNote/casenotereferrallist - GET'
    request: {
      queryParameters: [
        {
          name: 'UserID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteCasenotereferrallistGetRequest'
        }
        {
          name: 'CaseID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteCasenotereferrallistGetRequest-1'
        }
      ]
      headers: [
        {
          name: 'apmtoken-preferred_username'
          type: 'string'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteCasenotereferrallistGetRequest-2'
        }
      ]
      representations: []
    }
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_NoteReferralArray'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "referralId": 0,\r\n    "recordCreatedDate": "string",\r\n    "referralInfo": "string"\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_NoteReferralArray'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "referralId": 0,\r\n    "recordCreatedDate": "string",\r\n    "referralInfo": "string"\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_NoteReferralArray'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_casenote_casenoteservicebyreferralidlist 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-casenote-casenoteservicebyreferralidlist'
  properties: {
    displayName: '/api/CaseNote/casenoteservicebyreferralidlist - GET'
    method: 'GET'
    urlTemplate: '/api/CaseNote/casenoteservicebyreferralidlist'
    templateParameters: []
    description: '/api/CaseNote/casenoteservicebyreferralidlist - GET'
    request: {
      queryParameters: [
        {
          name: 'UserID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteCasenoteservicebyreferralidlistGetRequest'
        }
        {
          name: 'ReferralID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteCasenoteservicebyreferralidlistGetRequest-1'
        }
      ]
      headers: [
        {
          name: 'apmtoken-preferred_username'
          type: 'string'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteCasenoteservicebyreferralidlistGetRequest-2'
        }
      ]
      representations: []
    }
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_NoteServiceByReferralIDArray'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "serviceId": 0,\r\n    "recordCreatedDate": "string",\r\n    "serviceDesc": "string"\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_NoteServiceByReferralIDArray'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "serviceId": 0,\r\n    "recordCreatedDate": "string",\r\n    "serviceDesc": "string"\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_NoteServiceByReferralIDArray'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_casenote_casenoteservicereferralconsultant 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-casenote-casenoteservicereferralconsultant'
  properties: {
    displayName: '/api/CaseNote/casenoteservicereferralconsultant - GET'
    method: 'GET'
    urlTemplate: '/api/CaseNote/casenoteservicereferralconsultant'
    templateParameters: []
    description: '/api/CaseNote/casenoteservicereferralconsultant - GET'
    request: {
      queryParameters: [
        {
          name: 'UserID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteCasenoteservicereferralconsultantGetRequest'
        }
        {
          name: 'ReferralID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteCasenoteservicereferralconsultantGetRequest-1'
        }
        {
          name: 'ServiceID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteCasenoteservicereferralconsultantGetRequest-2'
        }
      ]
      headers: [
        {
          name: 'apmtoken-preferred_username'
          type: 'string'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteCasenoteservicereferralconsultantGetRequest-3'
        }
      ]
      representations: []
    }
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_NoteReferralServiceConsultantArray'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "pId": 0,\r\n    "pName": "string"\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_NoteReferralServiceConsultantArray'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "pId": 0,\r\n    "pName": "string"\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_NoteReferralServiceConsultantArray'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_casenote_casenotetacindexlist 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-casenote-casenotetacindexlist'
  properties: {
    displayName: '/api/CaseNote/casenotetacindexlist - GET'
    method: 'GET'
    urlTemplate: '/api/CaseNote/casenotetacindexlist'
    templateParameters: []
    description: '/api/CaseNote/casenotetacindexlist - GET'
    request: {
      queryParameters: [
        {
          name: 'UserID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteCasenotetacindexlistGetRequest'
        }
        {
          name: 'CaseID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteCasenotetacindexlistGetRequest-1'
        }
        {
          name: 'ServiceID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteCasenotetacindexlistGetRequest-2'
        }
        {
          name: 'TACID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteCasenotetacindexlistGetRequest-3'
        }
      ]
      headers: [
        {
          name: 'apmtoken-preferred_username'
          type: 'string'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteCasenotetacindexlistGetRequest-4'
        }
      ]
      representations: []
    }
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_NoteTACIndexListArray'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "tacIndexId": 0,\r\n    "tacIndexDesc": "string"\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_NoteTACIndexListArray'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "tacIndexId": 0,\r\n    "tacIndexDesc": "string"\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_NoteTACIndexListArray'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_casenote_casenotetaclist 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-casenote-casenotetaclist'
  properties: {
    displayName: '/api/CaseNote/casenotetaclist - GET'
    method: 'GET'
    urlTemplate: '/api/CaseNote/casenotetaclist'
    templateParameters: []
    description: '/api/CaseNote/casenotetaclist - GET'
    request: {
      queryParameters: [
        {
          name: 'UserID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteCasenotetaclistGetRequest'
        }
        {
          name: 'CaseID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteCasenotetaclistGetRequest-1'
        }
        {
          name: 'ReferralID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteCasenotetaclistGetRequest-2'
        }
        {
          name: 'ServiceID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteCasenotetaclistGetRequest-3'
        }
      ]
      headers: [
        {
          name: 'apmtoken-preferred_username'
          type: 'string'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteCasenotetaclistGetRequest-4'
        }
      ]
      representations: []
    }
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_NoteTACListArray'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "tacId": 0,\r\n    "tacDesc": "string",\r\n    "coId": 0,\r\n    "svId": 0,\r\n    "bc": "string",\r\n    "jc": "string",\r\n    "isNonBillable": true\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_NoteTACListArray'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "tacId": 0,\r\n    "tacDesc": "string",\r\n    "coId": 0,\r\n    "svId": 0,\r\n    "bc": "string",\r\n    "jc": "string",\r\n    "isNonBillable": true\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_NoteTACListArray'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_casenote_doescasehavetasks 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-casenote-doescasehavetasks'
  properties: {
    displayName: '/api/CaseNote/doescasehavetasks - GET'
    method: 'GET'
    urlTemplate: '/api/CaseNote/doescasehavetasks'
    templateParameters: []
    description: '/api/CaseNote/doescasehavetasks - GET'
    request: {
      queryParameters: [
        {
          name: 'caseID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteDoescasehavetasksGetRequest'
        }
        {
          name: 'serviceID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteDoescasehavetasksGetRequest-1'
        }
      ]
      headers: [
        {
          name: 'apmtoken-preferred_username'
          type: 'string'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteDoescasehavetasksGetRequest-2'
        }
      ]
      representations: []
    }
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'ApiCaseNoteDoescasehavetasksGet200TextPlainResponse'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: 'True'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'ApiCaseNoteDoescasehavetasksGet200ApplicationJsonResponse'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: 'True'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'ApiCaseNoteDoescasehavetasksGet200TextJsonResponse'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_casenote_getcaseavailablefunding 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-casenote-getcaseavailablefunding'
  properties: {
    displayName: '/api/CaseNote/getcaseavailablefunding - GET'
    method: 'GET'
    urlTemplate: '/api/CaseNote/getcaseavailablefunding'
    templateParameters: []
    description: '/api/CaseNote/getcaseavailablefunding - GET'
    request: {
      queryParameters: [
        {
          name: 'userID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteGetcaseavailablefundingGetRequest'
        }
        {
          name: 'caseID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteGetcaseavailablefundingGetRequest-1'
        }
      ]
      headers: [
        {
          name: 'apmtoken-preferred_username'
          type: 'string'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteGetcaseavailablefundingGetRequest-2'
        }
      ]
      representations: []
    }
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_CaseAvailableFundingArray'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "cmCostToDate": 0.0,\r\n    "approvedFunding": 0.0,\r\n    "wip": 0.0,\r\n    "invoicedAmt": 0.0,\r\n    "excludedAmount": 0.0\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_CaseAvailableFundingArray'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "cmCostToDate": 0.0,\r\n    "approvedFunding": 0.0,\r\n    "wip": 0.0,\r\n    "invoicedAmt": 0.0,\r\n    "excludedAmount": 0.0\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_CaseAvailableFundingArray'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_casenote_getcaseconsultants 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-casenote-getcaseconsultants'
  properties: {
    displayName: '/api/CaseNote/getcaseconsultants - GET'
    method: 'GET'
    urlTemplate: '/api/CaseNote/getcaseconsultants'
    templateParameters: []
    description: '/api/CaseNote/getcaseconsultants - GET'
    request: {
      queryParameters: [
        {
          name: 'CaseID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteGetcaseconsultantsGetRequest'
        }
      ]
      headers: [
        {
          name: 'apmtoken-preferred_username'
          type: 'string'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteGetcaseconsultantsGetRequest-1'
        }
      ]
      representations: []
    }
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_CaseConsultantListArray'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "pId": 0,\r\n    "consultant": "string"\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_CaseConsultantListArray'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "pId": 0,\r\n    "consultant": "string"\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_CaseConsultantListArray'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_casenote_getcaseidfromnoteid 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-casenote-getcaseidfromnoteid'
  properties: {
    displayName: '/api/CaseNote/getcaseidfromnoteid - GET'
    method: 'GET'
    urlTemplate: '/api/CaseNote/getcaseidfromnoteid'
    templateParameters: []
    description: '/api/CaseNote/getcaseidfromnoteid - GET'
    request: {
      queryParameters: [
        {
          name: 'NoteID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteGetcaseidfromnoteidGetRequest'
        }
      ]
      headers: [
        {
          name: 'apmtoken-preferred_username'
          type: 'string'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteGetcaseidfromnoteidGetRequest-1'
        }
      ]
      representations: []
    }
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: []
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_casenote_getexceptionalservicecount 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-casenote-getexceptionalservicecount'
  properties: {
    displayName: '/api/CaseNote/getexceptionalservicecount - GET'
    method: 'GET'
    urlTemplate: '/api/CaseNote/getexceptionalservicecount'
    templateParameters: []
    description: '/api/CaseNote/getexceptionalservicecount - GET'
    request: {
      queryParameters: [
        {
          name: 'userID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteGetexceptionalservicecountGetRequest'
        }
        {
          name: 'caseID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteGetexceptionalservicecountGetRequest-1'
        }
      ]
      headers: [
        {
          name: 'apmtoken-preferred_username'
          type: 'string'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteGetexceptionalservicecountGetRequest-2'
        }
      ]
      representations: []
    }
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'ApiCaseNoteGetexceptionalservicecountGet200TextPlainResponse'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: '0'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'ApiCaseNoteGetexceptionalservicecountGet200ApplicationJsonResponse'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: '0'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'ApiCaseNoteGetexceptionalservicecountGet200TextJsonResponse'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_casenote_getlatestreferralandserviceid 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-casenote-getlatestreferralandserviceid'
  properties: {
    displayName: '/api/CaseNote/getlatestreferralandserviceid - GET'
    method: 'GET'
    urlTemplate: '/api/CaseNote/getlatestreferralandserviceid'
    templateParameters: []
    description: '/api/CaseNote/getlatestreferralandserviceid - GET'
    request: {
      queryParameters: [
        {
          name: 'CaseID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteGetlatestreferralandserviceidGetRequest'
        }
      ]
      headers: [
        {
          name: 'apmtoken-preferred_username'
          type: 'string'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteGetlatestreferralandserviceidGetRequest-1'
        }
      ]
      representations: []
    }
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_GetLatestReferralAndServiceIDArray'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "referralID": 0,\r\n    "serviceID": 0\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_GetLatestReferralAndServiceIDArray'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "referralID": 0,\r\n    "serviceID": 0\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_GetLatestReferralAndServiceIDArray'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_casenote_getloggedinconsultantatlaspid 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-casenote-getloggedinconsultantatlaspid'
  properties: {
    displayName: '/api/CaseNote/getloggedinconsultantatlaspid - GET'
    method: 'GET'
    urlTemplate: '/api/CaseNote/getloggedinconsultantatlaspid'
    templateParameters: []
    description: '/api/CaseNote/getloggedinconsultantatlaspid - GET'
    request: {
      queryParameters: []
      headers: [
        {
          name: 'apmtoken-preferred_username'
          type: 'string'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteGetloggedinconsultantatlaspidGetRequest'
        }
      ]
      representations: []
    }
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_ConsultantAtlasPIDArray'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "pId": 0,\r\n    "adAccount": "string"\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_ConsultantAtlasPIDArray'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "pId": 0,\r\n    "adAccount": "string"\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_ConsultantAtlasPIDArray'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_casenote_getloggedinconsultantworkgroup 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-casenote-getloggedinconsultantworkgroup'
  properties: {
    displayName: '/api/CaseNote/getloggedinconsultantworkgroup - GET'
    method: 'GET'
    urlTemplate: '/api/CaseNote/getloggedinconsultantworkgroup'
    templateParameters: []
    description: '/api/CaseNote/getloggedinconsultantworkgroup - GET'
    request: {
      queryParameters: [
        {
          name: 'userID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteGetloggedinconsultantworkgroupGetRequest'
        }
        {
          name: 'caseID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteGetloggedinconsultantworkgroupGetRequest-1'
        }
        {
          name: 'referralID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteGetloggedinconsultantworkgroupGetRequest-2'
        }
        {
          name: 'serviceID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteGetloggedinconsultantworkgroupGetRequest-3'
        }
      ]
      headers: [
        {
          name: 'apmtoken-preferred_username'
          type: 'string'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteGetloggedinconsultantworkgroupGetRequest-4'
        }
      ]
      representations: []
    }
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_GetUserWorkGroupArray'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "workgroupId": 0,\r\n    "workGroupName": "string"\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_GetUserWorkGroupArray'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "workgroupId": 0,\r\n    "workGroupName": "string"\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_GetUserWorkGroupArray'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_casenote_getservicemaxminutes 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-casenote-getservicemaxminutes'
  properties: {
    displayName: '/api/CaseNote/getservicemaxminutes - GET'
    method: 'GET'
    urlTemplate: '/api/CaseNote/getservicemaxminutes'
    templateParameters: []
    description: '/api/CaseNote/getservicemaxminutes - GET'
    request: {
      queryParameters: [
        {
          name: 'userID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteGetservicemaxminutesGetRequest'
        }
        {
          name: 'serviceID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteGetservicemaxminutesGetRequest-1'
        }
      ]
      headers: [
        {
          name: 'apmtoken-preferred_username'
          type: 'string'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteGetservicemaxminutesGetRequest-2'
        }
      ]
      representations: []
    }
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'ApiCaseNoteGetservicemaxminutesGet200TextPlainResponse'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: '0'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'ApiCaseNoteGetservicemaxminutesGet200ApplicationJsonResponse'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: '0'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'ApiCaseNoteGetservicemaxminutesGet200TextJsonResponse'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_casenote_getserviceminutes 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-casenote-getserviceminutes'
  properties: {
    displayName: '/api/CaseNote/getserviceminutes - GET'
    method: 'GET'
    urlTemplate: '/api/CaseNote/getserviceminutes'
    templateParameters: []
    description: '/api/CaseNote/getserviceminutes - GET'
    request: {
      queryParameters: [
        {
          name: 'userID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteGetserviceminutesGetRequest'
        }
        {
          name: 'caseID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteGetserviceminutesGetRequest-1'
        }
        {
          name: 'serviceID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteGetserviceminutesGetRequest-2'
        }
      ]
      headers: [
        {
          name: 'apmtoken-preferred_username'
          type: 'string'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteGetserviceminutesGetRequest-3'
        }
      ]
      representations: []
    }
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'ApiCaseNoteGetserviceminutesGet200TextPlainResponse'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: '0'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'ApiCaseNoteGetserviceminutesGet200ApplicationJsonResponse'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: '0'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'ApiCaseNoteGetserviceminutesGet200TextJsonResponse'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_casenote_getspdocauthorname 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-casenote-getspdocauthorname'
  properties: {
    displayName: '/api/CaseNote/getspdocauthorname - GET'
    method: 'GET'
    urlTemplate: '/api/CaseNote/getspdocauthorname'
    templateParameters: []
    description: '/api/CaseNote/getspdocauthorname - GET'
    request: {
      queryParameters: [
        {
          name: 'AtlasPID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteGetspdocauthornameGetRequest'
        }
      ]
      headers: [
        {
          name: 'apmtoken-preferred_username'
          type: 'string'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteGetspdocauthornameGetRequest-1'
        }
      ]
      representations: []
    }
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: []
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_casenote_getsplibrarynameforcaseid 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-casenote-getsplibrarynameforcaseid'
  properties: {
    displayName: '/api/CaseNote/getsplibrarynameforcaseid - GET'
    method: 'GET'
    urlTemplate: '/api/CaseNote/getsplibrarynameforcaseid'
    templateParameters: []
    description: '/api/CaseNote/getsplibrarynameforcaseid - GET'
    request: {
      queryParameters: [
        {
          name: 'caseID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteGetsplibrarynameforcaseidGetRequest'
        }
      ]
      headers: [
        {
          name: 'apmtoken-preferred_username'
          type: 'string'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteGetsplibrarynameforcaseidGetRequest-1'
        }
      ]
      representations: []
    }
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: []
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_casenote_gettaskdescriptionfromtaskid 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-casenote-gettaskdescriptionfromtaskid'
  properties: {
    displayName: '/api/CaseNote/gettaskdescriptionfromtaskid - GET'
    method: 'GET'
    urlTemplate: '/api/CaseNote/gettaskdescriptionfromtaskid'
    templateParameters: []
    description: '/api/CaseNote/gettaskdescriptionfromtaskid - GET'
    request: {
      queryParameters: [
        {
          name: 'TaskID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteGettaskdescriptionfromtaskidGetRequest'
        }
      ]
      headers: [
        {
          name: 'apmtoken-preferred_username'
          type: 'string'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteGettaskdescriptionfromtaskidGetRequest-1'
        }
      ]
      representations: []
    }
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: []
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_casenote_isexcludedfromtaccap 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-casenote-isexcludedfromtaccap'
  properties: {
    displayName: '/api/CaseNote/isexcludedfromtaccap - GET'
    method: 'GET'
    urlTemplate: '/api/CaseNote/isexcludedfromtaccap'
    templateParameters: []
    description: '/api/CaseNote/isexcludedfromtaccap - GET'
    request: {
      queryParameters: [
        {
          name: 'userID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteIsexcludedfromtaccapGetRequest'
        }
        {
          name: 'tacID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteIsexcludedfromtaccapGetRequest-1'
        }
      ]
      headers: [
        {
          name: 'apmtoken-preferred_username'
          type: 'string'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteIsexcludedfromtaccapGetRequest-2'
        }
      ]
      representations: []
    }
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'ApiCaseNoteIsexcludedfromtaccapGet200TextPlainResponse'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: 'True'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'ApiCaseNoteIsexcludedfromtaccapGet200ApplicationJsonResponse'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: 'True'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'ApiCaseNoteIsexcludedfromtaccapGet200TextJsonResponse'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_casenote_isnotecaptravel 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-casenote-isnotecaptravel'
  properties: {
    displayName: '/api/CaseNote/isnotecaptravel - GET'
    method: 'GET'
    urlTemplate: '/api/CaseNote/isnotecaptravel'
    templateParameters: []
    description: '/api/CaseNote/isnotecaptravel - GET'
    request: {
      queryParameters: [
        {
          name: 'UserID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteIsnotecaptravelGetRequest'
        }
        {
          name: 'CaseID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteIsnotecaptravelGetRequest-1'
        }
        {
          name: 'ServiceID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteIsnotecaptravelGetRequest-2'
        }
        {
          name: 'TACID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteIsnotecaptravelGetRequest-3'
        }
        {
          name: 'ServiceItemID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteIsnotecaptravelGetRequest-4'
        }
      ]
      headers: [
        {
          name: 'apmtoken-preferred_username'
          type: 'string'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteIsnotecaptravelGetRequest-5'
        }
      ]
      representations: []
    }
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_IsNote_CapTravelArray'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "message": true\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_IsNote_CapTravelArray'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "message": true\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_IsNote_CapTravelArray'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_casenote_isovertaccap 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-casenote-isovertaccap'
  properties: {
    displayName: '/api/CaseNote/isovertaccap - GET'
    method: 'GET'
    urlTemplate: '/api/CaseNote/isovertaccap'
    templateParameters: []
    description: '/api/CaseNote/isovertaccap - GET'
    request: {
      queryParameters: [
        {
          name: 'caseID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteIsovertaccapGetRequest'
        }
        {
          name: 'tacID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteIsovertaccapGetRequest-1'
        }
        {
          name: 'ExceptServCount'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteIsovertaccapGetRequest-2'
        }
        {
          name: 'NewTacFee'
          description: 'Format - float.'
          type: 'number'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteIsovertaccapGetRequest-3'
        }
      ]
      headers: [
        {
          name: 'apmtoken-preferred_username'
          type: 'string'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteIsovertaccapGetRequest-4'
        }
      ]
      representations: []
    }
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'ApiCaseNoteIsovertaccapGet200TextPlainResponse'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: 'True'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'ApiCaseNoteIsovertaccapGet200ApplicationJsonResponse'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: 'True'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'ApiCaseNoteIsovertaccapGet200TextJsonResponse'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_casenote_mycasenotedetails 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-casenote-mycasenotedetails'
  properties: {
    displayName: '/api/CaseNote/mycasenotedetails - GET'
    method: 'GET'
    urlTemplate: '/api/CaseNote/mycasenotedetails'
    templateParameters: []
    description: '/api/CaseNote/mycasenotedetails - GET'
    request: {
      queryParameters: [
        {
          name: 'CaseID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteMycasenotedetailsGetRequest'
        }
      ]
      headers: [
        {
          name: 'apmtoken-preferred_username'
          type: 'string'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteMycasenotedetailsGetRequest-1'
        }
      ]
      representations: []
    }
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_GetCaseNoteDetailsArray'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "noteId": 0,\r\n    "caseId": 0,\r\n    "noteClassCode": "string",\r\n    "noteStatus": "string",\r\n    "noteDesc": "string",\r\n    "noteDescTrunc": "string",\r\n    "tac": "string",\r\n    "action": "string",\r\n    "unit": 0.0,\r\n    "rate": 0.0,\r\n    "fee": 0.0,\r\n    "service": "string",\r\n    "recordCreatedDate": "string",\r\n    "noteCreator": "string",\r\n    "recordModifiedDate": "string",\r\n    "noteModifier": "string",\r\n    "isInvoiced": "string",\r\n    "internalInvoiceNumber": 0,\r\n    "travelKM": 0,\r\n    "travelTime": 0.0,\r\n    "travelTripFrom": "string",\r\n    "travelTripTo": "string"\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_GetCaseNoteDetailsArray'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "noteId": 0,\r\n    "caseId": 0,\r\n    "noteClassCode": "string",\r\n    "noteStatus": "string",\r\n    "noteDesc": "string",\r\n    "noteDescTrunc": "string",\r\n    "tac": "string",\r\n    "action": "string",\r\n    "unit": 0.0,\r\n    "rate": 0.0,\r\n    "fee": 0.0,\r\n    "service": "string",\r\n    "recordCreatedDate": "string",\r\n    "noteCreator": "string",\r\n    "recordModifiedDate": "string",\r\n    "noteModifier": "string",\r\n    "isInvoiced": "string",\r\n    "internalInvoiceNumber": 0,\r\n    "travelKM": 0,\r\n    "travelTime": 0.0,\r\n    "travelTripFrom": "string",\r\n    "travelTripTo": "string"\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_GetCaseNoteDetailsArray'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_casenote_mycasenotesingledetail 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-casenote-mycasenotesingledetail'
  properties: {
    displayName: '/api/CaseNote/mycasenotesingledetail - GET'
    method: 'GET'
    urlTemplate: '/api/CaseNote/mycasenotesingledetail'
    templateParameters: []
    description: '/api/CaseNote/mycasenotesingledetail - GET'
    request: {
      queryParameters: [
        {
          name: 'CaseID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteMycasenotesingledetailGetRequest'
        }
        {
          name: 'NoteID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteMycasenotesingledetailGetRequest-1'
        }
      ]
      headers: [
        {
          name: 'apmtoken-preferred_username'
          type: 'string'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteMycasenotesingledetailGetRequest-2'
        }
      ]
      representations: []
    }
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_GetCaseNoteExtraDetailsArray'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "noteId": 0,\r\n    "caseId": 0,\r\n    "noteClassCode": "string",\r\n    "noteStatus": "string",\r\n    "noteDesc": "string",\r\n    "tac": "string",\r\n    "action": "string",\r\n    "tacid": 0,\r\n    "tacIndexID": 0,\r\n    "referralID": 0,\r\n    "serviceID": 0,\r\n    "unit": 0.0,\r\n    "rate": 0.0,\r\n    "fee": 0.0,\r\n    "gstAmt": 0.0,\r\n    "service": "string",\r\n    "recordCreatorID": 0,\r\n    "tacDate": "string",\r\n    "overridePO": "string",\r\n    "noteNarratiion": "string",\r\n    "recordCreatedDate": "string",\r\n    "noteCreator": "string",\r\n    "recordModifiedDate": "string",\r\n    "noteModifier": "string",\r\n    "isInvoiced": "string",\r\n    "internalInvoiceNumber": 0,\r\n    "travelKM": 0,\r\n    "travelTime": 0.0,\r\n    "travelTripFrom": "string",\r\n    "travelTripTo": "string"\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_GetCaseNoteExtraDetailsArray'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "noteId": 0,\r\n    "caseId": 0,\r\n    "noteClassCode": "string",\r\n    "noteStatus": "string",\r\n    "noteDesc": "string",\r\n    "tac": "string",\r\n    "action": "string",\r\n    "tacid": 0,\r\n    "tacIndexID": 0,\r\n    "referralID": 0,\r\n    "serviceID": 0,\r\n    "unit": 0.0,\r\n    "rate": 0.0,\r\n    "fee": 0.0,\r\n    "gstAmt": 0.0,\r\n    "service": "string",\r\n    "recordCreatorID": 0,\r\n    "tacDate": "string",\r\n    "overridePO": "string",\r\n    "noteNarratiion": "string",\r\n    "recordCreatedDate": "string",\r\n    "noteCreator": "string",\r\n    "recordModifiedDate": "string",\r\n    "noteModifier": "string",\r\n    "isInvoiced": "string",\r\n    "internalInvoiceNumber": 0,\r\n    "travelKM": 0,\r\n    "travelTime": 0.0,\r\n    "travelTripFrom": "string",\r\n    "travelTripTo": "string"\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_GetCaseNoteExtraDetailsArray'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_casenote_mycasesearchcasesdetails 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-casenote-mycasesearchcasesdetails'
  properties: {
    displayName: '/api/CaseNote/mycasesearchcasesdetails - GET'
    method: 'GET'
    urlTemplate: '/api/CaseNote/mycasesearchcasesdetails'
    templateParameters: []
    description: '/api/CaseNote/mycasesearchcasesdetails - GET'
    request: {
      queryParameters: [
        {
          name: 'searchtext'
          type: 'string'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteMycasesearchcasesdetailsGetRequest'
        }
        {
          name: 'primaryconsultant'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteMycasesearchcasesdetailsGetRequest-1'
        }
        {
          name: 'showclosed'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteMycasesearchcasesdetailsGetRequest-2'
        }
        {
          name: 'isprimcons'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteMycasesearchcasesdetailsGetRequest-3'
        }
        {
          name: 'isusersearch'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteMycasesearchcasesdetailsGetRequest-4'
        }
      ]
      headers: [
        {
          name: 'apmtoken-preferred_username'
          type: 'string'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteMycasesearchcasesdetailsGetRequest-5'
        }
      ]
      representations: []
    }
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_DisplayAllMyCaseDetailsArray'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "caseId": 0,\r\n    "busnClassCode": "string",\r\n    "jurisdictionCode": "string",\r\n    "initialReferralDate": "string",\r\n    "caseStatusDesc": "string",\r\n    "caseCostToDate": 0.0,\r\n    "costToDate": 0.0,\r\n    "claimNumber": "string",\r\n    "employeeName": "string",\r\n    "incidentDate": "string",\r\n    "injuryWorkerID": 0,\r\n    "totActivityRed": 0,\r\n    "totActivityYellow": 0,\r\n    "totActivityGreen": 0,\r\n    "navURL": "string",\r\n    "navToURL": "string",\r\n    "recordCreatedDate": "string",\r\n    "claimant": "string",\r\n    "isViewDetail": 0,\r\n    "employerInsurerInfo": "string",\r\n    "fundername": "string",\r\n    "lastCaseNoteDate": "string",\r\n    "fundingAvailable": 0.0,\r\n    "fundingExpiryDate": "string",\r\n    "caseActionStatus": "string",\r\n    "caseRTWGoal": "string",\r\n    "caseNoteCaseID": 0\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_DisplayAllMyCaseDetailsArray'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "caseId": 0,\r\n    "busnClassCode": "string",\r\n    "jurisdictionCode": "string",\r\n    "initialReferralDate": "string",\r\n    "caseStatusDesc": "string",\r\n    "caseCostToDate": 0.0,\r\n    "costToDate": 0.0,\r\n    "claimNumber": "string",\r\n    "employeeName": "string",\r\n    "incidentDate": "string",\r\n    "injuryWorkerID": 0,\r\n    "totActivityRed": 0,\r\n    "totActivityYellow": 0,\r\n    "totActivityGreen": 0,\r\n    "navURL": "string",\r\n    "navToURL": "string",\r\n    "recordCreatedDate": "string",\r\n    "claimant": "string",\r\n    "isViewDetail": 0,\r\n    "employerInsurerInfo": "string",\r\n    "fundername": "string",\r\n    "lastCaseNoteDate": "string",\r\n    "fundingAvailable": 0.0,\r\n    "fundingExpiryDate": "string",\r\n    "caseActionStatus": "string",\r\n    "caseRTWGoal": "string",\r\n    "caseNoteCaseID": 0\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_DisplayAllMyCaseDetailsArray'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_casenote_mycaseservicetasks 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-casenote-mycaseservicetasks'
  properties: {
    displayName: '/api/CaseNote/mycaseservicetasks - GET'
    method: 'GET'
    urlTemplate: '/api/CaseNote/mycaseservicetasks'
    templateParameters: []
    description: '/api/CaseNote/mycaseservicetasks - GET'
    request: {
      queryParameters: [
        {
          name: 'CaseID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteMycaseservicetasksGetRequest'
        }
        {
          name: 'ServiceID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteMycaseservicetasksGetRequest-1'
        }
      ]
      headers: []
      representations: []
    }
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_MobileCaseTaskArray'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "taskID": 0,\r\n    "taskDesc": "string",\r\n    "taskDuedate": "string",\r\n    "displayOrder": 0\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_MobileCaseTaskArray'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "taskID": 0,\r\n    "taskDesc": "string",\r\n    "taskDuedate": "string",\r\n    "displayOrder": 0\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_MobileCaseTaskArray'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_casenote_notebillingdetails 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-casenote-notebillingdetails'
  properties: {
    displayName: '/api/CaseNote/notebillingdetails - GET'
    method: 'GET'
    urlTemplate: '/api/CaseNote/notebillingdetails'
    templateParameters: []
    description: '/api/CaseNote/notebillingdetails - GET'
    request: {
      queryParameters: [
        {
          name: 'UserID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteNotebillingdetailsGetRequest'
        }
        {
          name: 'CaseID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteNotebillingdetailsGetRequest-1'
        }
        {
          name: 'referralid'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteNotebillingdetailsGetRequest-2'
        }
        {
          name: 'ServiceID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteNotebillingdetailsGetRequest-3'
        }
        {
          name: 'TACID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteNotebillingdetailsGetRequest-4'
        }
        {
          name: 'tacindexID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteNotebillingdetailsGetRequest-5'
        }
        {
          name: 'notedate'
          description: 'Format - date-time (as date-time in RFC3339).'
          type: 'string'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteNotebillingdetailsGetRequest-6'
        }
      ]
      headers: [
        {
          name: 'apmtoken-preferred_username'
          type: 'string'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteNotebillingdetailsGetRequest-7'
        }
      ]
      representations: []
    }
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_NoteTACBillingDetailsArray'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "busnClassCode": "string",\r\n    "jurisdictionCode": "string",\r\n    "serviceID": 0,\r\n    "tacid": 0,\r\n    "tacIndexID": 0,\r\n    "rate": 0.0,\r\n    "fixedPrice": 0.0,\r\n    "isLockFee": true,\r\n    "isGST": true,\r\n    "isCap": true,\r\n    "isNarration": true,\r\n    "defaultMinute": 0.0,\r\n    "minTime": 0.0,\r\n    "maxTime": 0.0,\r\n    "dateValidFrom": "string",\r\n    "dateValidTo": "string",\r\n    "recordCreatedDate": "string",\r\n    "recordCreatorID": 0,\r\n    "recordModifedDate": "string",\r\n    "recordMdifierID": 0,\r\n    "isActionDescRequired": true,\r\n    "outSourceFee": 0.0,\r\n    "isNotDDL": true,\r\n    "perRate": 0.0,\r\n    "perTime": 0.0,\r\n    "tacParentID": 0,\r\n    "applyType": "string",\r\n    "maxCounter": 0,\r\n    "maxFee": 0.0,\r\n    "isFreeTextForFee": true,\r\n    "narrationReqOnInv": true,\r\n    "tacDesc": "string",\r\n    "tacIndexDesc": "string",\r\n    "isCalculateTimeTaken": true,\r\n    "gstRate": 0.0,\r\n    "refTotalFee": 0.0,\r\n    "totalCounted": 0,\r\n    "isFreeTextFee": true\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_NoteTACBillingDetailsArray'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "busnClassCode": "string",\r\n    "jurisdictionCode": "string",\r\n    "serviceID": 0,\r\n    "tacid": 0,\r\n    "tacIndexID": 0,\r\n    "rate": 0.0,\r\n    "fixedPrice": 0.0,\r\n    "isLockFee": true,\r\n    "isGST": true,\r\n    "isCap": true,\r\n    "isNarration": true,\r\n    "defaultMinute": 0.0,\r\n    "minTime": 0.0,\r\n    "maxTime": 0.0,\r\n    "dateValidFrom": "string",\r\n    "dateValidTo": "string",\r\n    "recordCreatedDate": "string",\r\n    "recordCreatorID": 0,\r\n    "recordModifedDate": "string",\r\n    "recordMdifierID": 0,\r\n    "isActionDescRequired": true,\r\n    "outSourceFee": 0.0,\r\n    "isNotDDL": true,\r\n    "perRate": 0.0,\r\n    "perTime": 0.0,\r\n    "tacParentID": 0,\r\n    "applyType": "string",\r\n    "maxCounter": 0,\r\n    "maxFee": 0.0,\r\n    "isFreeTextForFee": true,\r\n    "narrationReqOnInv": true,\r\n    "tacDesc": "string",\r\n    "tacIndexDesc": "string",\r\n    "isCalculateTimeTaken": true,\r\n    "gstRate": 0.0,\r\n    "refTotalFee": 0.0,\r\n    "totalCounted": 0,\r\n    "isFreeTextFee": true\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_NoteTACBillingDetailsArray'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_casenote_noteconsolidatedtravelcalcs 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-casenote-noteconsolidatedtravelcalcs'
  properties: {
    displayName: '/api/CaseNote/noteconsolidatedtravelcalcs - GET'
    method: 'GET'
    urlTemplate: '/api/CaseNote/noteconsolidatedtravelcalcs'
    templateParameters: []
    description: '/api/CaseNote/noteconsolidatedtravelcalcs - GET'
    request: {
      queryParameters: [
        {
          name: 'UserID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteNoteconsolidatedtravelcalcsGetRequest'
        }
        {
          name: 'CaseID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteNoteconsolidatedtravelcalcsGetRequest-1'
        }
        {
          name: 'ServiceID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteNoteconsolidatedtravelcalcsGetRequest-2'
        }
        {
          name: 'TACID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteNoteconsolidatedtravelcalcsGetRequest-3'
        }
        {
          name: 'ServiceItemID'
          description: 'Format - int32.'
          type: 'integer'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteNoteconsolidatedtravelcalcsGetRequest-4'
        }
      ]
      headers: [
        {
          name: 'apmtoken-preferred_username'
          type: 'string'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiCaseNoteNoteconsolidatedtravelcalcsGetRequest-5'
        }
      ]
      representations: []
    }
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_Consolidated_Travel_CalcsArray'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "totalMinutesUsed": 0.0,\r\n    "capInMinutes": 0.0,\r\n    "chargedPerHrs": 0.0,\r\n    "chargedPerKM": 0.0\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_Consolidated_Travel_CalcsArray'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "totalMinutesUsed": 0.0,\r\n    "capInMinutes": 0.0,\r\n    "chargedPerHrs": 0.0,\r\n    "chargedPerKM": 0.0\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'API_Consolidated_Travel_CalcsArray'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_consultant_filter_referral_referralid_service_serviceid 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-consultant-filter-referral-referralid-service-serviceid'
  properties: {
    displayName: '/api/Consultant/filter/referral/{referralId}/service/{serviceId} - GET'
    method: 'GET'
    urlTemplate: '/api/Consultant/filter/referral/{referralId}/service/{serviceId}'
    templateParameters: [
      {
        name: 'referralId'
        description: 'Format - int32.'
        type: 'integer'
        required: true
        values: []
        schemaId: '6079449db8f67a1144c3d201'
        typeName: 'ApiConsultantFilterReferral-referralId-Service-serviceId-GetRequest'
      }
      {
        name: 'serviceId'
        description: 'Format - int32.'
        type: 'integer'
        required: true
        values: []
        schemaId: '6079449db8f67a1144c3d201'
        typeName: 'ApiConsultantFilterReferral-referralId-Service-serviceId-GetRequest-1'
      }
    ]
    description: '/api/Consultant/filter/referral/{referralId}/service/{serviceId} - GET'
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'ReferralServiceConsultantArray'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "personId": 0,\r\n    "personName": "string"\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'ReferralServiceConsultantArray'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "personId": 0,\r\n    "personName": "string"\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'ReferralServiceConsultantArray'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_referral_filter_case_caseid 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-referral-filter-case-caseid'
  properties: {
    displayName: '/api/Referral/filter/case/{caseId} - GET'
    method: 'GET'
    urlTemplate: '/api/Referral/filter/case/{caseId}'
    templateParameters: [
      {
        name: 'caseId'
        description: 'Format - int32.'
        type: 'integer'
        required: true
        values: []
        schemaId: '6079449db8f67a1144c3d201'
        typeName: 'ApiReferralFilterCase-caseId-GetRequest'
      }
    ]
    description: '/api/Referral/filter/case/{caseId} - GET'
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'CaseReferralReadOnlyModelArray'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "caseId": 0,\r\n    "referralId": 0,\r\n    "referralInfo": "string",\r\n    "recordCreatedDate": "string"\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'CaseReferralReadOnlyModelArray'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "caseId": 0,\r\n    "referralId": 0,\r\n    "referralInfo": "string",\r\n    "recordCreatedDate": "string"\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'CaseReferralReadOnlyModelArray'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_service_filter_referral_referralid 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-service-filter-referral-referralid'
  properties: {
    displayName: '/api/Service/filter/referral/{referralId} - GET'
    method: 'GET'
    urlTemplate: '/api/Service/filter/referral/{referralId}'
    templateParameters: [
      {
        name: 'referralId'
        description: 'Format - int32.'
        type: 'integer'
        required: true
        values: []
        schemaId: '6079449db8f67a1144c3d201'
        typeName: 'ApiServiceFilterReferral-referralId-GetRequest'
      }
    ]
    description: '/api/Service/filter/referral/{referralId} - GET'
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'CaseServiceReadOnlyModelArray'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "serviceId": 0,\r\n    "description": "string",\r\n    "recordCreatedDate": "string",\r\n    "referralId": 0\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'CaseServiceReadOnlyModelArray'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "serviceId": 0,\r\n    "description": "string",\r\n    "recordCreatedDate": "string",\r\n    "referralId": 0\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'CaseServiceReadOnlyModelArray'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_tac_filter_case_caseid_referral_referralid_service_serviceid 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-tac-filter-case-caseid-referral-referralid-service-serviceid'
  properties: {
    displayName: '/api/Tac/filter/case/{caseId}/referral/{referralId}/service/{serviceId} - GET'
    method: 'GET'
    urlTemplate: '/api/Tac/filter/case/{caseId}/referral/{referralId}/service/{serviceId}'
    templateParameters: [
      {
        name: 'caseId'
        description: 'Format - int32.'
        type: 'integer'
        required: true
        values: []
        schemaId: '6079449db8f67a1144c3d201'
        typeName: 'ApiTacFilterCase-caseId-Referral-referralId-Service-serviceId-GetRequest'
      }
      {
        name: 'referralId'
        description: 'Format - int32.'
        type: 'integer'
        required: true
        values: []
        schemaId: '6079449db8f67a1144c3d201'
        typeName: 'ApiTacFilterCase-caseId-Referral-referralId-Service-serviceId-GetRequest-1'
      }
      {
        name: 'serviceId'
        description: 'Format - int32.'
        type: 'integer'
        required: true
        values: []
        schemaId: '6079449db8f67a1144c3d201'
        typeName: 'ApiTacFilterCase-caseId-Referral-referralId-Service-serviceId-GetRequest-2'
      }
    ]
    description: '/api/Tac/filter/case/{caseId}/referral/{referralId}/service/{serviceId} - GET'
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'TacArray'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "tacId": 0,\r\n    "tacDescription": "string",\r\n    "companyId": 0,\r\n    "serviceId": 0,\r\n    "jurusdictionCode": "string",\r\n    "isNonBillable": true\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'TacArray'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "tacId": 0,\r\n    "tacDescription": "string",\r\n    "companyId": 0,\r\n    "serviceId": 0,\r\n    "jurusdictionCode": "string",\r\n    "isNonBillable": true\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'TacArray'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_get_api_tacindex_filter_case_caseid_service_serviceid_tac_tacid 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'get-api-tacindex-filter-case-caseid-service-serviceid-tac-tacid'
  properties: {
    displayName: '/api/TacIndex/filter/case/{caseId}/service/{serviceId}/tac/{tacId} - GET'
    method: 'GET'
    urlTemplate: '/api/TacIndex/filter/case/{caseId}/service/{serviceId}/tac/{tacId}'
    templateParameters: [
      {
        name: 'caseId'
        description: 'Format - int32.'
        type: 'integer'
        required: true
        values: []
        schemaId: '6079449db8f67a1144c3d201'
        typeName: 'ApiTacIndexFilterCase-caseId-Service-serviceId-Tac-tacId-GetRequest'
      }
      {
        name: 'serviceId'
        description: 'Format - int32.'
        type: 'integer'
        required: true
        values: []
        schemaId: '6079449db8f67a1144c3d201'
        typeName: 'ApiTacIndexFilterCase-caseId-Service-serviceId-Tac-tacId-GetRequest-1'
      }
      {
        name: 'tacId'
        description: 'Format - int32.'
        type: 'integer'
        required: true
        values: []
        schemaId: '6079449db8f67a1144c3d201'
        typeName: 'ApiTacIndexFilterCase-caseId-Service-serviceId-Tac-tacId-GetRequest-2'
      }
    ]
    description: '/api/TacIndex/filter/case/{caseId}/service/{serviceId}/tac/{tacId} - GET'
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'TacIndexArray'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "id": 0,\r\n    "description": "string"\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'TacIndexArray'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: '[\r\n  {\r\n    "id": 0,\r\n    "description": "string"\r\n  }\r\n]'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'TacIndexArray'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_post_api_apmiq_save 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'post-api-apmiq-save'
  properties: {
    displayName: '/api/Apmiq/save - POST'
    method: 'POST'
    urlTemplate: '/api/Apmiq/save'
    templateParameters: []
    description: '/api/Apmiq/save - POST'
    request: {
      queryParameters: []
      headers: []
      representations: [
        {
          contentType: 'application/json-patch+json'
          examples: {
            default: {
              value: '{\r\n  "email": "string",\r\n  "surveyName": "string",\r\n  "answers": [\r\n    {\r\n      "answer": "string",\r\n      "order": "string",\r\n      "text": "string",\r\n      "riskFactor": "string"\r\n    }\r\n  ],\r\n  "surveyId": "string",\r\n  "caseId": 0\r\n}'
            }
          }
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'SurveyResultsRequest'
        }
        {
          contentType: 'application/json'
          examples: {
            default: {
              value: '{\r\n  "email": "string",\r\n  "surveyName": "string",\r\n  "answers": [\r\n    {\r\n      "answer": "string",\r\n      "order": "string",\r\n      "text": "string",\r\n      "riskFactor": "string"\r\n    }\r\n  ],\r\n  "surveyId": "string",\r\n  "caseId": 0\r\n}'
            }
          }
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'SurveyResultsRequest'
        }
        {
          contentType: 'text/json'
          examples: {
            default: {
              value: '{\r\n  "email": "string",\r\n  "surveyName": "string",\r\n  "answers": [\r\n    {\r\n      "answer": "string",\r\n      "order": "string",\r\n      "text": "string",\r\n      "riskFactor": "string"\r\n    }\r\n  ],\r\n  "surveyId": "string",\r\n  "caseId": 0\r\n}'
            }
          }
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'SurveyResultsRequest'
        }
        {
          contentType: 'application/*+json'
          examples: {
            default: {
              value: '{\r\n  "email": "string",\r\n  "surveyName": "string",\r\n  "answers": [\r\n    {\r\n      "answer": "string",\r\n      "order": "string",\r\n      "text": "string",\r\n      "riskFactor": "string"\r\n    }\r\n  ],\r\n  "surveyId": "string",\r\n  "caseId": 0\r\n}'
            }
          }
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'SurveyResultsRequest'
        }
      ]
    }
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'ApiApmiqSavePost200TextPlainResponse'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: 'string'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'ApiApmiqSavePost200ApplicationJsonResponse'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: 'string'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'ApiApmiqSavePost200TextJsonResponse'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_post_api_atlascasesearch_saveipaudit 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'post-api-atlascasesearch-saveipaudit'
  properties: {
    displayName: '/api/AtlasCaseSearch/saveipaudit - POST'
    method: 'POST'
    urlTemplate: '/api/AtlasCaseSearch/saveipaudit'
    templateParameters: []
    description: '/api/AtlasCaseSearch/saveipaudit - POST'
    request: {
      queryParameters: []
      headers: []
      representations: [
        {
          contentType: 'multipart/form-data'
          formParameters: [
            {
              name: 'Id'
              type: 'integer'
              values: []
            }
            {
              name: 'IPAddress'
              type: 'string'
              values: []
            }
            {
              name: 'ADAccount'
              type: 'string'
              values: []
            }
            {
              name: 'LoginDate'
              type: 'string'
              values: []
            }
            {
              name: 'Source'
              type: 'string'
              values: []
            }
          ]
        }
      ]
    }
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: []
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_post_api_atlascasesearch_savemobiledocumenttoblobstorage 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'post-api-atlascasesearch-savemobiledocumenttoblobstorage'
  properties: {
    displayName: '/api/AtlasCaseSearch/savemobiledocumenttoblobstorage - POST'
    method: 'POST'
    urlTemplate: '/api/AtlasCaseSearch/savemobiledocumenttoblobstorage'
    templateParameters: []
    description: '/api/AtlasCaseSearch/savemobiledocumenttoblobstorage - POST'
    request: {
      queryParameters: [
        {
          name: 'CaseId'
          type: 'string'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiAtlasCaseSearchSavemobiledocumenttoblobstoragePostRequest'
        }
        {
          name: 'LibraryName'
          type: 'string'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiAtlasCaseSearchSavemobiledocumenttoblobstoragePostRequest-1'
        }
        {
          name: 'DocumentName'
          type: 'string'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiAtlasCaseSearchSavemobiledocumenttoblobstoragePostRequest-2'
        }
        {
          name: 'UserName'
          type: 'string'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiAtlasCaseSearchSavemobiledocumenttoblobstoragePostRequest-3'
        }
      ]
      headers: [
        {
          name: 'apmtoken-preferred_username'
          type: 'string'
          values: []
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'ApiAtlasCaseSearchSavemobiledocumenttoblobstoragePostRequest-4'
        }
      ]
      representations: [
        {
          contentType: 'multipart/form-data'
          formParameters: [
            {
              name: 'file'
              type: 'file'
              values: []
            }
          ]
        }
      ]
    }
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: []
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_post_api_atlascasesearch_updatedatestatus 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'post-api-atlascasesearch-updatedatestatus'
  properties: {
    displayName: '/api/AtlasCaseSearch/updatedatestatus - POST'
    method: 'POST'
    urlTemplate: '/api/AtlasCaseSearch/updatedatestatus'
    templateParameters: []
    description: '/api/AtlasCaseSearch/updatedatestatus - POST'
    request: {
      queryParameters: []
      headers: []
      representations: [
        {
          contentType: 'multipart/form-data'
          formParameters: [
            {
              name: 'RTWDateID'
              type: 'integer'
              values: []
            }
            {
              name: 'StatusID'
              type: 'integer'
              values: []
            }
          ]
        }
      ]
    }
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: []
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_post_api_casenote 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'post-api-casenote'
  properties: {
    displayName: '/api/CaseNote - POST'
    method: 'POST'
    urlTemplate: '/api/CaseNote'
    templateParameters: []
    description: '/api/CaseNote - POST'
    request: {
      queryParameters: []
      headers: []
      representations: [
        {
          contentType: 'application/json-patch+json'
          examples: {
            default: {
              value: '{\r\n  "id": 0,\r\n  "referralId": 0,\r\n  "serviceId": 0,\r\n  "tacId": 0,\r\n  "tacIndexId": 0,\r\n  "caseId": 0,\r\n  "tacDate": "string",\r\n  "noteNarration": "string",\r\n  "tacUnit": "string",\r\n  "description": "string",\r\n  "consultantId": 0\r\n}'
            }
          }
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'CaseNoteDto'
        }
        {
          contentType: 'application/json'
          examples: {
            default: {
              value: '{\r\n  "id": 0,\r\n  "referralId": 0,\r\n  "serviceId": 0,\r\n  "tacId": 0,\r\n  "tacIndexId": 0,\r\n  "caseId": 0,\r\n  "tacDate": "string",\r\n  "noteNarration": "string",\r\n  "tacUnit": "string",\r\n  "description": "string",\r\n  "consultantId": 0\r\n}'
            }
          }
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'CaseNoteDto'
        }
        {
          contentType: 'text/json'
          examples: {
            default: {
              value: '{\r\n  "id": 0,\r\n  "referralId": 0,\r\n  "serviceId": 0,\r\n  "tacId": 0,\r\n  "tacIndexId": 0,\r\n  "caseId": 0,\r\n  "tacDate": "string",\r\n  "noteNarration": "string",\r\n  "tacUnit": "string",\r\n  "description": "string",\r\n  "consultantId": 0\r\n}'
            }
          }
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'CaseNoteDto'
        }
        {
          contentType: 'application/*+json'
          examples: {
            default: {
              value: '{\r\n  "id": 0,\r\n  "referralId": 0,\r\n  "serviceId": 0,\r\n  "tacId": 0,\r\n  "tacIndexId": 0,\r\n  "caseId": 0,\r\n  "tacDate": "string",\r\n  "noteNarration": "string",\r\n  "tacUnit": "string",\r\n  "description": "string",\r\n  "consultantId": 0\r\n}'
            }
          }
          schemaId: '6079449db8f67a1144c3d201'
          typeName: 'CaseNoteDto'
        }
      ]
    }
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: []
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_post_api_casenote_completetask 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'post-api-casenote-completetask'
  properties: {
    displayName: '/api/CaseNote/completetask - POST'
    method: 'POST'
    urlTemplate: '/api/CaseNote/completetask'
    templateParameters: []
    description: '/api/CaseNote/completetask - POST'
    request: {
      queryParameters: []
      headers: []
      representations: [
        {
          contentType: 'multipart/form-data'
          formParameters: [
            {
              name: 'UserID'
              type: 'integer'
              values: []
            }
            {
              name: 'TaskID'
              type: 'integer'
              values: []
            }
            {
              name: 'TaskDesc'
              type: 'string'
              values: []
            }
            {
              name: 'TaskStatusCode'
              type: 'string'
              values: []
            }
          ]
        }
      ]
    }
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: []
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_post_api_casenote_savecasenote 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'post-api-casenote-savecasenote'
  properties: {
    displayName: '/api/CaseNote/savecasenote - POST'
    method: 'POST'
    urlTemplate: '/api/CaseNote/savecasenote'
    templateParameters: []
    description: '/api/CaseNote/savecasenote - POST'
    request: {
      queryParameters: []
      headers: []
      representations: [
        {
          contentType: 'multipart/form-data'
          formParameters: [
            {
              name: 'NoteId'
              type: 'integer'
              values: []
            }
            {
              name: 'NoteClassCode'
              type: 'string'
              values: []
            }
            {
              name: 'NoteTypeCode'
              type: 'string'
              values: []
            }
            {
              name: 'NoteStatus'
              type: 'string'
              values: []
            }
            {
              name: 'NoteDesc'
              type: 'string'
              values: []
            }
            {
              name: 'TACID'
              type: 'integer'
              values: []
            }
            {
              name: 'TACIndexID'
              type: 'integer'
              values: []
            }
            {
              name: 'TACUnit'
              type: 'number'
              values: []
            }
            {
              name: 'TACDate'
              type: 'string'
              values: []
            }
            {
              name: 'Rate'
              type: 'number'
              values: []
            }
            {
              name: 'Fee'
              type: 'number'
              values: []
            }
            {
              name: 'GSTAmt'
              type: 'number'
              values: []
            }
            {
              name: 'CaseID'
              type: 'integer'
              values: []
            }
            {
              name: 'ReferralID'
              type: 'integer'
              values: []
            }
            {
              name: 'ServiceID'
              type: 'integer'
              values: []
            }
            {
              name: 'UDF1'
              type: 'string'
              values: []
            }
            {
              name: 'UDF2'
              type: 'string'
              values: []
            }
            {
              name: 'UDF3'
              type: 'string'
              values: []
            }
            {
              name: 'NoteNarratiion'
              type: 'string'
              values: []
            }
            {
              name: 'TACServiceItemID'
              type: 'string'
              values: []
            }
            {
              name: 'NoteReportReference'
              type: 'string'
              values: []
            }
            {
              name: 'NoteReportDesc'
              type: 'string'
              values: []
            }
            {
              name: 'NoteClosedDateTime'
              type: 'string'
              values: []
            }
            {
              name: 'RecordCreatedDate'
              type: 'string'
              values: []
            }
            {
              name: 'RecordCreatorID'
              type: 'integer'
              values: []
            }
            {
              name: 'RecordModifiedDate'
              type: 'string'
              values: []
            }
            {
              name: 'RecordModifierID'
              type: 'integer'
              values: []
            }
            {
              name: 'TodoTaskID'
              type: 'integer'
              values: []
            }
            {
              name: 'IsPrivacy'
              type: 'boolean'
              values: []
            }
            {
              name: 'IsNoFeeApply'
              type: 'boolean'
              values: []
            }
            {
              name: 'IsInvoiced'
              type: 'boolean'
              values: []
            }
            {
              name: 'IsFixedFee'
              type: 'boolean'
              values: []
            }
            {
              name: 'InvoiceNumber'
              type: 'integer'
              values: []
            }
            {
              name: 'LinkID'
              type: 'integer'
              values: []
            }
            {
              name: 'LinkType'
              type: 'string'
              values: []
            }
            {
              name: 'WorkgroupID'
              type: 'integer'
              values: []
            }
            {
              name: 'SmartReportID'
              type: 'integer'
              values: []
            }
            {
              name: 'IsOutsourceFee'
              type: 'boolean'
              values: []
            }
            {
              name: 'ExpensesID'
              type: 'integer'
              values: []
            }
            {
              name: 'BookingID'
              type: 'integer'
              values: []
            }
            {
              name: 'IsActionDescRequired'
              type: 'boolean'
              values: []
            }
            {
              name: 'IsNarration'
              type: 'boolean'
              values: []
            }
            {
              name: 'IsTravelReturnTrip'
              type: 'boolean'
              values: []
            }
            {
              name: 'TravelKM'
              type: 'integer'
              values: []
            }
            {
              name: 'TravelTime'
              type: 'number'
              values: []
            }
            {
              name: 'TravelTripFrom'
              type: 'string'
              values: []
            }
            {
              name: 'TravelTripTo'
              type: 'string'
              values: []
            }
            {
              name: 'DataSource'
              type: 'string'
              values: []
            }
            {
              name: 'AutoGeneratedBy'
              type: 'string'
              values: []
            }
            {
              name: 'ExternalUniqueID'
              type: 'integer'
              values: []
            }
            {
              name: 'ExternalUpdated'
              type: 'string'
              values: []
            }
            {
              name: 'adfTransfer'
              type: 'boolean'
              values: []
            }
            {
              name: 'OverridePO'
              type: 'string'
              values: []
            }
            {
              name: 'IsArchived'
              type: 'boolean'
              values: []
            }
            {
              name: 'FormatDesc'
              type: 'string'
              values: []
            }
          ]
        }
      ]
    }
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: []
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_post_api_casenote_savectfixedcasenote 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'post-api-casenote-savectfixedcasenote'
  properties: {
    displayName: '/api/CaseNote/savectfixedcasenote - POST'
    method: 'POST'
    urlTemplate: '/api/CaseNote/savectfixedcasenote'
    templateParameters: []
    description: '/api/CaseNote/savectfixedcasenote - POST'
    request: {
      queryParameters: []
      headers: []
      representations: [
        {
          contentType: 'multipart/form-data'
          formParameters: [
            {
              name: 'NoteId'
              type: 'integer'
              values: []
            }
            {
              name: 'NoteClassCode'
              type: 'string'
              values: []
            }
            {
              name: 'NoteTypeCode'
              type: 'string'
              values: []
            }
            {
              name: 'NoteStatus'
              type: 'string'
              values: []
            }
            {
              name: 'NoteDesc'
              type: 'string'
              values: []
            }
            {
              name: 'TACID'
              type: 'integer'
              values: []
            }
            {
              name: 'TACIndexID'
              type: 'integer'
              values: []
            }
            {
              name: 'TACUnit'
              type: 'number'
              values: []
            }
            {
              name: 'TACDate'
              type: 'string'
              values: []
            }
            {
              name: 'Rate'
              type: 'number'
              values: []
            }
            {
              name: 'Fee'
              type: 'number'
              values: []
            }
            {
              name: 'GSTAmt'
              type: 'number'
              values: []
            }
            {
              name: 'CaseID'
              type: 'integer'
              values: []
            }
            {
              name: 'ReferralID'
              type: 'integer'
              values: []
            }
            {
              name: 'ServiceID'
              type: 'integer'
              values: []
            }
            {
              name: 'UDF1'
              type: 'string'
              values: []
            }
            {
              name: 'UDF2'
              type: 'string'
              values: []
            }
            {
              name: 'UDF3'
              type: 'string'
              values: []
            }
            {
              name: 'NoteNarratiion'
              type: 'string'
              values: []
            }
            {
              name: 'TACServiceItemID'
              type: 'string'
              values: []
            }
            {
              name: 'NoteReportReference'
              type: 'string'
              values: []
            }
            {
              name: 'NoteReportDesc'
              type: 'string'
              values: []
            }
            {
              name: 'NoteClosedDateTime'
              type: 'string'
              values: []
            }
            {
              name: 'RecordCreatedDate'
              type: 'string'
              values: []
            }
            {
              name: 'RecordCreatorID'
              type: 'integer'
              values: []
            }
            {
              name: 'RecordModifiedDate'
              type: 'string'
              values: []
            }
            {
              name: 'RecordModifierID'
              type: 'integer'
              values: []
            }
            {
              name: 'TodoTaskID'
              type: 'integer'
              values: []
            }
            {
              name: 'IsPrivacy'
              type: 'boolean'
              values: []
            }
            {
              name: 'IsNoFeeApply'
              type: 'boolean'
              values: []
            }
            {
              name: 'IsInvoiced'
              type: 'boolean'
              values: []
            }
            {
              name: 'IsFixedFee'
              type: 'boolean'
              values: []
            }
            {
              name: 'InvoiceNumber'
              type: 'integer'
              values: []
            }
            {
              name: 'LinkID'
              type: 'integer'
              values: []
            }
            {
              name: 'LinkType'
              type: 'string'
              values: []
            }
            {
              name: 'WorkgroupID'
              type: 'integer'
              values: []
            }
            {
              name: 'SmartReportID'
              type: 'integer'
              values: []
            }
            {
              name: 'IsOutsourceFee'
              type: 'boolean'
              values: []
            }
            {
              name: 'ExpensesID'
              type: 'integer'
              values: []
            }
            {
              name: 'BookingID'
              type: 'integer'
              values: []
            }
            {
              name: 'IsActionDescRequired'
              type: 'boolean'
              values: []
            }
            {
              name: 'IsNarration'
              type: 'boolean'
              values: []
            }
            {
              name: 'IsTravelReturnTrip'
              type: 'boolean'
              values: []
            }
            {
              name: 'TravelKM'
              type: 'integer'
              values: []
            }
            {
              name: 'TravelTime'
              type: 'number'
              values: []
            }
            {
              name: 'TravelTripFrom'
              type: 'string'
              values: []
            }
            {
              name: 'TravelTripTo'
              type: 'string'
              values: []
            }
            {
              name: 'DataSource'
              type: 'string'
              values: []
            }
            {
              name: 'AutoGeneratedBy'
              type: 'string'
              values: []
            }
            {
              name: 'ExternalUniqueID'
              type: 'integer'
              values: []
            }
            {
              name: 'ExternalUpdated'
              type: 'string'
              values: []
            }
            {
              name: 'adfTransfer'
              type: 'boolean'
              values: []
            }
            {
              name: 'OverridePO'
              type: 'string'
              values: []
            }
            {
              name: 'IsArchived'
              type: 'boolean'
              values: []
            }
            {
              name: 'FormatDesc'
              type: 'string'
              values: []
            }
          ]
        }
      ]
    }
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'ApiCaseNoteSavectfixedcasenotePost200TextPlainResponse'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: '0'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'ApiCaseNoteSavectfixedcasenotePost200ApplicationJsonResponse'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: '0'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'ApiCaseNoteSavectfixedcasenotePost200TextJsonResponse'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_post_api_casenote_savectkmcasenote 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'post-api-casenote-savectkmcasenote'
  properties: {
    displayName: '/api/CaseNote/savectkmcasenote - POST'
    method: 'POST'
    urlTemplate: '/api/CaseNote/savectkmcasenote'
    templateParameters: []
    description: '/api/CaseNote/savectkmcasenote - POST'
    request: {
      queryParameters: []
      headers: []
      representations: [
        {
          contentType: 'multipart/form-data'
          formParameters: [
            {
              name: 'NoteId'
              type: 'integer'
              values: []
            }
            {
              name: 'NoteClassCode'
              type: 'string'
              values: []
            }
            {
              name: 'NoteTypeCode'
              type: 'string'
              values: []
            }
            {
              name: 'NoteStatus'
              type: 'string'
              values: []
            }
            {
              name: 'NoteDesc'
              type: 'string'
              values: []
            }
            {
              name: 'TACID'
              type: 'integer'
              values: []
            }
            {
              name: 'TACIndexID'
              type: 'integer'
              values: []
            }
            {
              name: 'TACUnit'
              type: 'number'
              values: []
            }
            {
              name: 'TACDate'
              type: 'string'
              values: []
            }
            {
              name: 'Rate'
              type: 'number'
              values: []
            }
            {
              name: 'Fee'
              type: 'number'
              values: []
            }
            {
              name: 'GSTAmt'
              type: 'number'
              values: []
            }
            {
              name: 'CaseID'
              type: 'integer'
              values: []
            }
            {
              name: 'ReferralID'
              type: 'integer'
              values: []
            }
            {
              name: 'ServiceID'
              type: 'integer'
              values: []
            }
            {
              name: 'UDF1'
              type: 'string'
              values: []
            }
            {
              name: 'UDF2'
              type: 'string'
              values: []
            }
            {
              name: 'UDF3'
              type: 'string'
              values: []
            }
            {
              name: 'NoteNarratiion'
              type: 'string'
              values: []
            }
            {
              name: 'TACServiceItemID'
              type: 'string'
              values: []
            }
            {
              name: 'NoteReportReference'
              type: 'string'
              values: []
            }
            {
              name: 'NoteReportDesc'
              type: 'string'
              values: []
            }
            {
              name: 'NoteClosedDateTime'
              type: 'string'
              values: []
            }
            {
              name: 'RecordCreatedDate'
              type: 'string'
              values: []
            }
            {
              name: 'RecordCreatorID'
              type: 'integer'
              values: []
            }
            {
              name: 'RecordModifiedDate'
              type: 'string'
              values: []
            }
            {
              name: 'RecordModifierID'
              type: 'integer'
              values: []
            }
            {
              name: 'TodoTaskID'
              type: 'integer'
              values: []
            }
            {
              name: 'IsPrivacy'
              type: 'boolean'
              values: []
            }
            {
              name: 'IsNoFeeApply'
              type: 'boolean'
              values: []
            }
            {
              name: 'IsInvoiced'
              type: 'boolean'
              values: []
            }
            {
              name: 'IsFixedFee'
              type: 'boolean'
              values: []
            }
            {
              name: 'InvoiceNumber'
              type: 'integer'
              values: []
            }
            {
              name: 'LinkID'
              type: 'integer'
              values: []
            }
            {
              name: 'LinkType'
              type: 'string'
              values: []
            }
            {
              name: 'WorkgroupID'
              type: 'integer'
              values: []
            }
            {
              name: 'SmartReportID'
              type: 'integer'
              values: []
            }
            {
              name: 'IsOutsourceFee'
              type: 'boolean'
              values: []
            }
            {
              name: 'ExpensesID'
              type: 'integer'
              values: []
            }
            {
              name: 'BookingID'
              type: 'integer'
              values: []
            }
            {
              name: 'IsActionDescRequired'
              type: 'boolean'
              values: []
            }
            {
              name: 'IsNarration'
              type: 'boolean'
              values: []
            }
            {
              name: 'IsTravelReturnTrip'
              type: 'boolean'
              values: []
            }
            {
              name: 'TravelKM'
              type: 'integer'
              values: []
            }
            {
              name: 'TravelTime'
              type: 'number'
              values: []
            }
            {
              name: 'TravelTripFrom'
              type: 'string'
              values: []
            }
            {
              name: 'TravelTripTo'
              type: 'string'
              values: []
            }
            {
              name: 'DataSource'
              type: 'string'
              values: []
            }
            {
              name: 'AutoGeneratedBy'
              type: 'string'
              values: []
            }
            {
              name: 'ExternalUniqueID'
              type: 'integer'
              values: []
            }
            {
              name: 'ExternalUpdated'
              type: 'string'
              values: []
            }
            {
              name: 'adfTransfer'
              type: 'boolean'
              values: []
            }
            {
              name: 'OverridePO'
              type: 'string'
              values: []
            }
            {
              name: 'IsArchived'
              type: 'boolean'
              values: []
            }
            {
              name: 'FormatDesc'
              type: 'string'
              values: []
            }
          ]
        }
      ]
    }
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: [
          {
            contentType: 'text/plain'
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'ApiCaseNoteSavectkmcasenotePost200TextPlainResponse'
          }
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: 'string'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'ApiCaseNoteSavectkmcasenotePost200ApplicationJsonResponse'
          }
          {
            contentType: 'text/json'
            examples: {
              default: {
                value: 'string'
              }
            }
            schemaId: '6079449db8f67a1144c3d201'
            typeName: 'ApiCaseNoteSavectkmcasenotePost200TextJsonResponse'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_post_api_casenote_savevrsrtwdate 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'post-api-casenote-savevrsrtwdate'
  properties: {
    displayName: '/api/CaseNote/savevrsrtwdate - POST'
    method: 'POST'
    urlTemplate: '/api/CaseNote/savevrsrtwdate'
    templateParameters: []
    description: '/api/CaseNote/savevrsrtwdate - POST'
    request: {
      queryParameters: []
      headers: []
      representations: [
        {
          contentType: 'multipart/form-data'
          formParameters: [
            {
              name: 'Id'
              type: 'integer'
              values: []
            }
            {
              name: 'CaseID'
              type: 'integer'
              values: []
            }
            {
              name: 'ServiceID'
              type: 'integer'
              values: []
            }
            {
              name: 'DateTypeID'
              type: 'integer'
              values: []
            }
            {
              name: 'Date'
              type: 'string'
              values: []
            }
            {
              name: 'RecordCreatedBy'
              type: 'integer'
              values: []
            }
            {
              name: 'RecordCreatedDate'
              type: 'string'
              values: []
            }
            {
              name: 'RTWTime'
              type: 'string'
              values: []
            }
            {
              name: 'RTWStatus'
              type: 'string'
              values: []
            }
          ]
        }
      ]
    }
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: []
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_post_api_casenote_updatetask 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'post-api-casenote-updatetask'
  properties: {
    displayName: '/api/CaseNote/updatetask - POST'
    method: 'POST'
    urlTemplate: '/api/CaseNote/updatetask'
    templateParameters: []
    description: '/api/CaseNote/updatetask - POST'
    request: {
      queryParameters: []
      headers: []
      representations: [
        {
          contentType: 'multipart/form-data'
          formParameters: [
            {
              name: 'CaseID'
              type: 'integer'
              values: []
            }
            {
              name: 'ServiceID'
              type: 'integer'
              values: []
            }
            {
              name: 'CaseDate'
              type: 'string'
              values: []
            }
            {
              name: 'CaseDateTypeID'
              type: 'integer'
              values: []
            }
            {
              name: 'BusinessClassCode'
              type: 'string'
              values: []
            }
            {
              name: 'Status'
              type: 'integer'
              values: []
            }
          ]
        }
      ]
    }
    responses: [
      {
        statusCode: 200
        description: 'Success'
        representations: []
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_case_sharepoint_integration_get_apmiqdocdata 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_case_sharepoint_integration
  name: 'get-apmiqdocdata'
  properties: {
    displayName: 'APMIQDOCDATA'
    method: 'GET'
    urlTemplate: '/APMIQDOCDATA'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_case_sharepoint_integration_get_casesearchsharepointgetdocumenttitles 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_case_sharepoint_integration
  name: 'get-casesearchsharepointgetdocumenttitles'
  properties: {
    displayName: 'CaseSearchSharepointGetDocumentTitles'
    method: 'GET'
    urlTemplate: '/CaseSearchSharepointGetDocumentTitles'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_case_sharepoint_integration_get_getchartimages 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_case_sharepoint_integration
  name: 'get-getchartimages'
  properties: {
    displayName: 'GetChartImages'
    method: 'GET'
    urlTemplate: '/GetChartImages'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_case_sharepoint_integration_get_lifeindexquestionnaire 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_case_sharepoint_integration
  name: 'get-lifeindexquestionnaire'
  properties: {
    displayName: 'LifeIndexQuestionnaire'
    method: 'GET'
    urlTemplate: '/LifeIndexQuestionnaire'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_case_sharepoint_integration_options_casesearchsharepointgetdocumenttitles 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_case_sharepoint_integration
  name: 'options-casesearchsharepointgetdocumenttitles'
  properties: {
    displayName: 'CaseSearchSharepointGetDocumentTitles'
    method: 'OPTIONS'
    urlTemplate: '/CaseSearchSharepointGetDocumentTitles'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_case_sharepoint_integration_options_getchartimages 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_case_sharepoint_integration
  name: 'options-getchartimages'
  properties: {
    displayName: 'GetChartImages'
    method: 'OPTIONS'
    urlTemplate: '/GetChartImages'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_echo_azurestorage_getblob 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_echo_azurestorage
  name: 'getblob'
  properties: {
    displayName: 'GetBlob'
    method: 'GET'
    urlTemplate: '/'
    templateParameters: []
    description: 'GetBlob'
    request: {
      queryParameters: []
      headers: [
        {
          name: 'Container'
          type: 'string'
          values: []
          schemaId: '62f322f9b8f67a0c04ab60a8'
          typeName: 'GetRequest'
        }
        {
          name: 'Blob'
          type: 'string'
          values: []
          schemaId: '62f322f9b8f67a0c04ab60a8'
          typeName: 'GetRequest-1'
        }
        {
          name: 'Sas'
          type: 'string'
          values: []
          schemaId: '62f322f9b8f67a0c04ab60a8'
          typeName: 'GetRequest-2'
        }
      ]
      representations: []
    }
    responses: [
      {
        statusCode: 200
        description: 'null'
        representations: []
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_echo_la_populate_echo_template_manual_invoke 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_echo_la_populate_echo_template
  name: 'manual-invoke'
  properties: {
    displayName: 'generateDocFromTemplate'
    method: 'POST'
    urlTemplate: '/generateDocFromTemplate'
    templateParameters: []
    description: 'Trigger a run of the logic app.'
    request: {
      description: 'The request body.'
      queryParameters: []
      headers: []
      representations: [
        {
          contentType: 'application/json'
          examples: {
            default: {
              value: {}
            }
          }
          schemaId: '62f329c5b8f67a0c04ab60ca'
          typeName: 'request-manual'
        }
      ]
    }
    responses: [
      {
        statusCode: 200
        description: 'The Logic App Response for action with status code \'200\'.'
        representations: [
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: {}
              }
            }
            schemaId: '62f329c5b8f67a0c04ab60ca'
            typeName: 'response-200'
          }
        ]
        headers: []
      }
      {
        statusCode: 400
        description: 'The Logic App Response.'
        representations: [
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: {}
              }
            }
            schemaId: '62f329c5b8f67a0c04ab60ca'
            typeName: 'ManualPathsInvokePost400ApplicationJsonResponse'
          }
        ]
        headers: []
      }
      {
        statusCode: 500
        description: 'The Logic App Response.'
        representations: [
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: {}
              }
            }
            schemaId: '62f329c5b8f67a0c04ab60ca'
            typeName: 'ManualPathsInvokePost500ApplicationJsonResponse'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_emailapi_post_sendemail 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_emailapi
  name: 'post-sendemail'
  properties: {
    displayName: 'SendEmail'
    method: 'POST'
    urlTemplate: '/SendEmail'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_la_html_pdf_template_manual_invoke 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_la_html_pdf_template
  name: 'manual-invoke'
  properties: {
    displayName: 'generatePdfFromHtml'
    method: 'POST'
    urlTemplate: '/generatePdfFromHtml'
    templateParameters: []
    description: 'Trigger a run of the logic app.'
    request: {
      description: 'The request body.'
      queryParameters: []
      headers: []
      representations: [
        {
          contentType: 'application/json'
          examples: {
            default: {
              value: {}
            }
          }
          schemaId: '63401416b8f67a05ccd70930'
          typeName: 'request-manual'
        }
      ]
    }
    responses: [
      {
        statusCode: 200
        description: 'The Logic App Response for action with status code \'200\'.'
        representations: [
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: {}
              }
            }
            schemaId: '63401416b8f67a05ccd70930'
            typeName: 'response-200'
          }
        ]
        headers: []
      }
      {
        statusCode: 500
        description: 'The Logic App Response.'
        representations: [
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: {}
              }
            }
            schemaId: '63401416b8f67a05ccd70930'
            typeName: 'ManualPathsInvokePost500ApplicationJsonResponse'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_607022a93c593d69fdd45a5d 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: '607022a93c593d69fdd45a5d'
  properties: {
    displayName: 'GetParticipantCompletedActivities'
    method: 'GET'
    urlTemplate: '/getParticipantCompletedActivities/{participantId}'
    templateParameters: [
      {
        name: 'participantId'
        required: true
        values: []
        type: null
      }
    ]
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_6125ae0ac5c848c142ce05ec 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: '6125ae0ac5c848c142ce05ec'
  properties: {
    displayName: 'GetParticipantAllPlans'
    method: 'GET'
    urlTemplate: '/getParticipantAllPlans/{participantId}'
    templateParameters: [
      {
        name: 'participantId'
        required: true
        values: []
        type: null
      }
    ]
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_612c5482f42bb4a6a04dec6e 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: '612c5482f42bb4a6a04dec6e'
  properties: {
    displayName: 'ModifyPlan'
    method: 'POST'
    urlTemplate: '/ModifyPlan'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_6139bb81157a8ca10c88a17b 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: '6139bb81157a8ca10c88a17b'
  properties: {
    displayName: 'GetOutcomeReasons'
    method: 'GET'
    urlTemplate: '/GetOutcomeReasons'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_616663d24e144ca0ff5825e2 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: '616663d24e144ca0ff5825e2'
  properties: {
    displayName: 'GetNdisRegions'
    method: 'GET'
    urlTemplate: '/GetNdisRegions'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_628334f41c9668811d3701fe 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: '628334f41c9668811d3701fe'
  properties: {
    displayName: 'AddBusinessRule'
    method: 'POST'
    urlTemplate: '/AddBusinessRule'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_628336151af661837338543d 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: '628336151af661837338543d'
  properties: {
    displayName: 'GetLastActiveBusinessRule'
    method: 'GET'
    urlTemplate: '/GetLastActiveBusinessRule'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_62833674e1ec4ab9758aebc5 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: '62833674e1ec4ab9758aebc5'
  properties: {
    displayName: 'GetBusinessRules'
    method: 'GET'
    urlTemplate: '/GetBusinessRules'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_6283375c6ca6d67681cbe546 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: '6283375c6ca6d67681cbe546'
  properties: {
    displayName: 'GetBusinessRuleDetails'
    method: 'GET'
    urlTemplate: '/GetBusinessRuleDetails/{businessRuleId}'
    templateParameters: [
      {
        name: 'businessRuleId'
        required: true
        values: []
        type: null
      }
    ]
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_628337bbdcb81460254c28ea 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: '628337bbdcb81460254c28ea'
  properties: {
    displayName: 'GetTasks'
    method: 'GET'
    urlTemplate: '/GetTasks'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_6283382b46cfc369e81c81b9 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: '6283382b46cfc369e81c81b9'
  properties: {
    displayName: 'GetTaskConfigurations'
    method: 'GET'
    urlTemplate: '/GetTaskConfigurations/{taskId}'
    templateParameters: [
      {
        name: 'taskId'
        required: true
        values: []
        type: null
      }
    ]
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_62833c4863eeac7f55d0c6f0 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: '62833c4863eeac7f55d0c6f0'
  properties: {
    displayName: 'AddOrUpdateTaskConfiguration'
    method: 'POST'
    urlTemplate: '/AddOrUpdateTaskConfiguration'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_62833cb815e7791a82796a6a 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: '62833cb815e7791a82796a6a'
  properties: {
    displayName: 'DeleteTaskConfiguration'
    method: 'DELETE'
    urlTemplate: '/DeleteTaskConfiguration/{taskConfigId}'
    templateParameters: [
      {
        name: 'taskConfigId'
        required: true
        values: []
        type: null
      }
    ]
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_62833dc0f74ce718f354b940 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: '62833dc0f74ce718f354b940'
  properties: {
    displayName: 'GetTaskEnablerPoints'
    method: 'GET'
    urlTemplate: '/GetTaskEnablerPoints/{taskId}'
    templateParameters: [
      {
        name: 'taskId'
        required: true
        values: []
        type: null
      }
    ]
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_62833e06f81dd3d2a99bf73c 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: '62833e06f81dd3d2a99bf73c'
  properties: {
    displayName: 'AddOrUpdateTaskEnablerPoint'
    method: 'POST'
    urlTemplate: '/AddOrUpdateTaskEnablerPoint'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_62833e5d16d7473ca9b70364 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: '62833e5d16d7473ca9b70364'
  properties: {
    displayName: 'DeleteTaskEnablerPoint'
    method: 'DELETE'
    urlTemplate: '/DeleteTaskEnablerPoint/{taskEnablerPointId}'
    templateParameters: [
      {
        name: 'taskEnablerPointId'
        required: true
        values: []
        type: null
      }
    ]
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_62833fd616232db5c19ee6ac 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: '62833fd616232db5c19ee6ac'
  properties: {
    displayName: 'GetUserMaintenanceData'
    method: 'GET'
    urlTemplate: '/GetUserMaintenanceData/{userId}'
    templateParameters: [
      {
        name: 'userId'
        required: true
        values: []
        type: null
      }
    ]
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_628340221230c7d84ac09258 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: '628340221230c7d84ac09258'
  properties: {
    displayName: 'AddOrUpdateEnablerPointSplit'
    method: 'POST'
    urlTemplate: '/AddOrUpdateEnablerPointSplit'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_62834084f438970cc9266001 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: '62834084f438970cc9266001'
  properties: {
    displayName: 'DeleteUserEnablerPointSplit'
    method: 'DELETE'
    urlTemplate: '/DeleteUserEnablerPointSplit/{enablerPointSplitId}'
    templateParameters: [
      {
        name: 'enablerPointSplitId'
        required: true
        values: []
        type: null
      }
    ]
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_62d630acfc784ce76fae31df 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: '62d630acfc784ce76fae31df'
  properties: {
    displayName: 'AddUpdateTask'
    method: 'POST'
    urlTemplate: '/AddUpdateTask'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_62eb588921804dab1a09c291 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: '62eb588921804dab1a09c291'
  properties: {
    displayName: 'AddUpdateBusinessRule'
    method: 'POST'
    urlTemplate: '/AddUpdateBusinessRule'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_6310835a5d2374ff961cb5ce 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: '6310835a5d2374ff961cb5ce'
  properties: {
    displayName: 'GetContactTypes'
    method: 'GET'
    urlTemplate: '/GetContactTypes'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_6310838406c7b1c583b00b78 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: '6310838406c7b1c583b00b78'
  properties: {
    displayName: 'GetServiceDeliveredCategories'
    method: 'GET'
    urlTemplate: '/GetServiceDeliveredCategories'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_6332c9d06bbeadf75b8b306f 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: '6332c9d06bbeadf75b8b306f'
  properties: {
    displayName: 'GetActivationPotentials'
    method: 'GET'
    urlTemplate: '/GetActivationPotentials'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_647864b062518286bc32fbd8 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: '647864b062518286bc32fbd8'
  properties: {
    displayName: 'AddUpdateUserTeamAreas'
    method: 'POST'
    urlTemplate: '/AddUpdateUserTeamAreas'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_6478653889a55acae2e03802 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: '6478653889a55acae2e03802'
  properties: {
    displayName: 'GetUserTeamAreas'
    method: 'GET'
    urlTemplate: '/GetUserTeamAreas/{userId}'
    templateParameters: [
      {
        name: 'userId'
        required: true
        values: []
        type: null
      }
    ]
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_647865899e89ed468493267b 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: '647865899e89ed468493267b'
  properties: {
    displayName: 'GetTeamAreasByType'
    method: 'GET'
    urlTemplate: '/GetTeamAreasByType/{teamAreaTypeName}'
    templateParameters: [
      {
        name: 'teamAreaTypeName'
        required: true
        values: []
        type: null
      }
    ]
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_changeparticipantrequiredlevelofsupport 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'changeparticipantrequiredlevelofsupport'
  properties: {
    displayName: 'ChangeParticipantRequiredLevelOfSupport'
    method: 'POST'
    urlTemplate: '/ChangeParticipantRequiredLevelOfSupport'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_delete_deleteallalertsfromservicebus 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'delete-deleteallalertsfromservicebus'
  properties: {
    displayName: 'DeleteAllAlertsFromServiceBus'
    method: 'DELETE'
    urlTemplate: '/DeleteAllAlertsFromServiceBus'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_delete_deleteallmessagesfromremovedparticipant 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'delete-deleteallmessagesfromremovedparticipant'
  properties: {
    displayName: 'DeleteAllMessagesFromRemovedParticipant'
    method: 'DELETE'
    urlTemplate: '/DeleteAllMessagesFromRemovedParticipant/{pid}'
    templateParameters: [
      {
        name: 'pid'
        required: true
        values: []
        type: null
      }
    ]
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_getdiversecommunitytypes 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'getdiversecommunitytypes'
  properties: {
    displayName: 'GetDiverseCommunityTypes'
    method: 'GET'
    urlTemplate: '/GetDiverseCommunityTypes'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_get_getactivities 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'get-getactivities'
  properties: {
    displayName: 'GetActivities'
    method: 'GET'
    urlTemplate: '/GetActivities'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_get_getactivitiesworkflow 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'get-getactivitiesworkflow'
  properties: {
    displayName: 'GetActivitiesWorkflow'
    method: 'GET'
    urlTemplate: '/GetActivitiesWorkflow'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_get_getactivitytypes 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'get-getactivitytypes'
  properties: {
    displayName: 'GetActivityTypes'
    method: 'GET'
    urlTemplate: '/GetActivityTypes'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_get_getallactivecoordinators 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'get-getallactivecoordinators'
  properties: {
    displayName: 'GetAllActiveCoordinators'
    method: 'GET'
    urlTemplate: '/GetAllActiveCoordinators'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_get_getapmteams 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'get-getapmteams'
  properties: {
    displayName: 'GetApmTeams'
    method: 'GET'
    urlTemplate: '/GetApmTeams'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_get_getcontactmethods 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'get-getcontactmethods'
  properties: {
    displayName: 'GetContactMethods'
    method: 'GET'
    urlTemplate: '/GetContactMethods'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_get_getcoordinators 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'get-getcoordinators'
  properties: {
    displayName: 'GetCoordinators'
    method: 'GET'
    urlTemplate: '/GetCoordinators'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_get_getexitreasons 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'get-getexitreasons'
  properties: {
    displayName: 'GetExitReasons'
    method: 'GET'
    urlTemplate: '/GetExitReasons'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_get_gethelplinks 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'get-gethelplinks'
  properties: {
    displayName: 'GetHelpLinks'
    method: 'GET'
    urlTemplate: '/GetHelpLinks'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_get_geticddisabilities 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'get-geticddisabilities'
  properties: {
    displayName: 'GetIcdDisabilities'
    method: 'GET'
    urlTemplate: '/GetIcdDisabilities'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_get_getinactivereasons 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'get-getinactivereasons'
  properties: {
    displayName: 'GetInactiveReasons'
    method: 'GET'
    urlTemplate: '/GetInactiveReasons'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_get_getlatestfaqpdf 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'get-getlatestfaqpdf'
  properties: {
    displayName: 'GetLatestFaqPdf'
    method: 'GET'
    urlTemplate: '/GetLatestFaqPdf'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_get_getnotificationsforuser 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'get-getnotificationsforuser'
  properties: {
    displayName: 'GetNotificationsForUser'
    method: 'GET'
    urlTemplate: '/getNotificationsForUser/{userId}'
    templateParameters: [
      {
        name: 'userId'
        required: true
        values: []
        type: null
      }
    ]
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_get_getoutcomes 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'get-getoutcomes'
  properties: {
    displayName: 'GetOutcomes'
    method: 'GET'
    urlTemplate: '/GetOutcomes'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_get_getparticipant 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'get-getparticipant'
  properties: {
    displayName: 'GetParticipant'
    method: 'GET'
    urlTemplate: '/getParticipant/{participantId}'
    templateParameters: [
      {
        name: 'participantId'
        required: true
        values: []
        type: null
      }
    ]
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_get_getparticipantalerts 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'get-getparticipantalerts'
  properties: {
    displayName: 'GetParticipantAlerts'
    method: 'GET'
    urlTemplate: '/getParticipantAlerts/{userId}'
    templateParameters: [
      {
        name: 'userId'
        required: true
        values: []
        type: null
      }
    ]
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_get_getparticipantcompletedactivities 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'get-getparticipantcompletedactivities'
  properties: {
    displayName: 'GetParticipantCompletedActivitiesWithPlan'
    method: 'GET'
    urlTemplate: '/getParticipantCompletedActivities/{participantId}/{planId}'
    templateParameters: [
      {
        name: 'participantId'
        required: true
        values: []
        type: null
      }
      {
        name: 'planId'
        required: true
        values: []
        type: null
      }
    ]
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_get_getparticipantevents 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'get-getparticipantevents'
  properties: {
    displayName: 'GetParticipantEvents'
    method: 'GET'
    urlTemplate: '/getParticipantEvents/{participantId}'
    templateParameters: [
      {
        name: 'participantId'
        required: true
        values: []
        type: null
      }
    ]
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_get_getparticipantplanbyid 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'get-getparticipantplanbyid'
  properties: {
    displayName: 'GetParticipantPlanById'
    method: 'GET'
    urlTemplate: '/getParticipantPlanById/{planId}'
    templateParameters: [
      {
        name: 'planId'
        required: true
        values: []
        type: null
      }
    ]
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_get_getparticipantplanevents 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'get-getparticipantplanevents'
  properties: {
    displayName: 'GetParticipantPlanEvents'
    method: 'GET'
    urlTemplate: '/getParticipantPlanEvents/{planId}'
    templateParameters: [
      {
        name: 'planId'
        required: true
        values: []
        type: null
      }
    ]
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_get_getparticipantplans 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'get-getparticipantplans'
  properties: {
    displayName: 'GetParticipantPlans'
    method: 'GET'
    urlTemplate: '/getParticipantPlans/{participantId}'
    templateParameters: [
      {
        name: 'participantId'
        required: true
        values: []
        type: null
      }
    ]
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_get_getparticipantsbycoordinator 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'get-getparticipantsbycoordinator'
  properties: {
    displayName: 'GetParticipantsByCoordinator'
    method: 'GET'
    urlTemplate: '/GetParticipantsByCoordinator/{userId}'
    templateParameters: [
      {
        name: 'userId'
        required: true
        values: []
        type: null
      }
    ]
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_get_getrequiredlevelsofsupport 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'get-getrequiredlevelsofsupport'
  properties: {
    displayName: 'GetRequiredLevelsOfSupport'
    method: 'GET'
    urlTemplate: '/GetRequiredLevelsOfSupport'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_get_getroles 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'get-getroles'
  properties: {
    displayName: 'GetRoles'
    method: 'GET'
    urlTemplate: '/GetRoles'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_get_getserviceareas 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'get-getserviceareas'
  properties: {
    displayName: 'GetServiceAreas'
    method: 'GET'
    urlTemplate: '/GetServiceAreas'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_get_getstages 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'get-getstages'
  properties: {
    displayName: 'GetStages'
    method: 'GET'
    urlTemplate: '/GetStages'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_get_getstreams 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'get-getstreams'
  properties: {
    displayName: 'GetStreams'
    method: 'GET'
    urlTemplate: '/GetStreams'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_get_getsuburbs 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'get-getsuburbs'
  properties: {
    displayName: 'GetSuburbs'
    method: 'GET'
    urlTemplate: '/GetSuburbs'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_get_getunassignedparticipants 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'get-getunassignedparticipants'
  properties: {
    displayName: 'GetUnassignedParticipants'
    method: 'GET'
    urlTemplate: '/GetUnassignedParticipants'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_get_getuser 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'get-getuser'
  properties: {
    displayName: 'GetUser'
    method: 'GET'
    urlTemplate: '/getUser/{userId}'
    templateParameters: [
      {
        name: 'userId'
        required: true
        values: []
        type: null
      }
    ]
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_get_getuseralertcount 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'get-getuseralertcount'
  properties: {
    displayName: 'GetUserAlertCount'
    method: 'GET'
    urlTemplate: '/getUserAlertCount/{id}'
    templateParameters: [
      {
        name: 'id'
        required: true
        values: []
        type: null
      }
    ]
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_get_getuseralerts 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'get-getuseralerts'
  properties: {
    displayName: 'GetUserAlerts'
    method: 'GET'
    urlTemplate: '/getUserAlerts/{userId}'
    templateParameters: [
      {
        name: 'userId'
        required: true
        values: []
        type: null
      }
    ]
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_getmethodofengagement 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'getmethodofengagement'
  properties: {
    displayName: 'GetMethodOfEngagement'
    method: 'GET'
    urlTemplate: '/GetMethodOfEngagement'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_getparticipantdiversity 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'getparticipantdiversity'
  properties: {
    displayName: 'GetParticipantDiversity'
    method: 'GET'
    urlTemplate: '/GetParticipantDiversity/{participantId}'
    templateParameters: [
      {
        name: 'participantId'
        required: true
        values: []
        type: null
      }
    ]
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_get_searchcoordinators 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'get-searchcoordinators'
  properties: {
    displayName: 'SearchCoordinators'
    method: 'GET'
    urlTemplate: '/searchCoordinators/{name}'
    templateParameters: [
      {
        name: 'name'
        required: true
        values: []
        type: null
      }
    ]
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_get_searchparticipants 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'get-searchparticipants'
  properties: {
    displayName: 'SearchParticipants'
    method: 'GET'
    urlTemplate: '/searchParticipants/{searchTerm}'
    templateParameters: [
      {
        name: 'searchTerm'
        required: true
        values: []
        type: null
      }
    ]
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_get_searchusers 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'get-searchusers'
  properties: {
    displayName: 'SearchUsers'
    method: 'GET'
    urlTemplate: '/searchUsers/{name}'
    templateParameters: [
      {
        name: 'name'
        required: true
        values: []
        type: null
      }
    ]
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_getservicesdelivered 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'getservicesdelivered'
  properties: {
    displayName: 'GetServicesDelivered'
    method: 'GET'
    urlTemplate: '/GetServicesDelivered'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_patch_updatealertsforuser 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'patch-updatealertsforuser'
  properties: {
    displayName: 'UpdateAlertsForUser'
    method: 'PATCH'
    urlTemplate: '/UpdateAlertsForUser/{id}'
    templateParameters: [
      {
        name: 'id'
        required: true
        values: []
        type: null
      }
    ]
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_patch_updatenotificationsforuser 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'patch-updatenotificationsforuser'
  properties: {
    displayName: 'UpdateNotificationsForUser'
    method: 'PATCH'
    urlTemplate: '/UpdateNotificationsForUser/{id}'
    templateParameters: [
      {
        name: 'id'
        required: true
        values: []
        type: null
      }
    ]
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_patch_updateparticipant 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'patch-updateparticipant'
  properties: {
    displayName: 'UpdateParticipant'
    method: 'PATCH'
    urlTemplate: '/Participants/{id}'
    templateParameters: [
      {
        name: 'id'
        required: true
        values: []
        type: null
      }
    ]
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_patch_updateuser 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'patch-updateuser'
  properties: {
    displayName: 'UpdateUser'
    method: 'PATCH'
    urlTemplate: '/Users/{id}'
    templateParameters: [
      {
        name: 'id'
        required: true
        values: []
        type: null
      }
    ]
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_post_addcoordinatornote 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'post-addcoordinatornote'
  properties: {
    displayName: 'AddCoordinatorNote'
    method: 'POST'
    urlTemplate: '/AddCoordinatorNote'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_post_assignparticipanttocoordinator 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'post-assignparticipanttocoordinator'
  properties: {
    displayName: 'AssignParticipantToCoordinator'
    method: 'POST'
    urlTemplate: '/AssignParticipantToCoordinator'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_post_changeparticipantstage 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'post-changeparticipantstage'
  properties: {
    displayName: 'ChangeParticipantStage'
    method: 'POST'
    urlTemplate: '/ChangeParticipantStage'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_post_changeserviceareamanagerarea 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'post-changeserviceareamanagerarea'
  properties: {
    displayName: 'ChangeServiceAreaManagerArea'
    method: 'POST'
    urlTemplate: '/ChangeServiceAreaManagerArea'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_post_createparticipant 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'post-createparticipant'
  properties: {
    displayName: 'CreateParticipant'
    method: 'POST'
    urlTemplate: '/CreateParticipant'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_post_logactivity 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'post-logactivity'
  properties: {
    displayName: 'LogActivity'
    method: 'POST'
    urlTemplate: '/LogActivity'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_post_removeparticipant 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'post-removeparticipant'
  properties: {
    displayName: 'RemoveParticipant'
    method: 'POST'
    urlTemplate: '/RemoveParticipant'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_post_syncusersfromaad 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'post-syncusersfromaad'
  properties: {
    displayName: 'SyncUsersFromAad'
    method: 'POST'
    urlTemplate: '/SyncUsersFromAad'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_post_undoactivity 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'post-undoactivity'
  properties: {
    displayName: 'UndoActivity'
    method: 'POST'
    urlTemplate: '/UndoActivity'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_post_uploadpdftostorage 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'post-uploadpdftostorage'
  properties: {
    displayName: 'UploadPdfToStorage'
    method: 'POST'
    urlTemplate: '/UploadPdfToStorage'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_put_userinfo 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pat
  name: 'put-userinfo'
  properties: {
    displayName: 'UserInfo'
    method: 'PUT'
    urlTemplate: '/UserInfo'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_pdf_merge_PdfMerge 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_pdf_merge
  name: 'PdfMerge'
  properties: {
    displayName: 'PdfMerge'
    method: 'POST'
    urlTemplate: '/merge'
    templateParameters: []
    description: 'Takes a string array of PDF Contents in base64 string format, merges content and then returns the merged content in Base64 string format'
    request: {
      description: 'PDF Contents in Base64 string format'
      queryParameters: []
      headers: []
      representations: [
        {
          contentType: 'application/json'
          examples: {
            'Sample Request Payload': {
              value: '["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LjggXChieSBsb3dhZ2llLmNvbVwpKT4+CmVuZG9iagp4cmVmCjAgMTAKMDAwMDAwMDAwMCA2NTUzNSBmIAowMDAwMDE2NDQ0IDAwMDAwIG4gCjAwMDAwMTY2NDEgMDAwMDAgbiAKMDAwMDAwMDAxNSAwMDAwMCBuIAowMDAwMDE2NzMzIDAwMDAwIG4gCjAwMDAwMTY4MjAgMDAwMDAgbiAKMDAwMDAxMzg2NyAwMDAwMCBuIAowMDAwMDE2OTE5IDAwMDAwIG4gCjAwMDAwMTY5NjkgMDAwMDAgbiAKMDAwMDAxNzAxMyAwMDAwMCBuIAp0cmFpbGVyCjw8L0luZm8gOSAwIFIvSUQgWzw3NWJjZDFmNmQ1MDA5Nzc2N2E2NTAwOTI3OGEzZWM2ND48YjE4OGU3ODdlZDExMzg1ZjJlMWE2MThkZDIwMTBkYzM+XS9Sb290IDggMCBSL1NpemUgMTA+PgpzdGFydHhyZWYKMTcxMzIKJSVFT0YK","JVBERi0xLjQKJeLjz9MKMyAwIG9iaiA8PC9Db2xvclNwYWNlL0RldmljZVJHQi9TdWJ0eXBlL0ltYWdlL0hlaWdodCAxMDAvRmlsdGVyL0RDVERlY29kZS9UeXBlL1hPYmplY3QvV2lkdGggNjAwL0JpdHNQZXJDb21wb25lbnQgOC9MZW5ndGggMTM2OTc+PnN0cmVhbQr/2P/gABBKRklGAAEBAAABAAEAAP/bAEMABQMEBAQDBQQEBAUFBQYHDAgHBwcHDwsLCQwRDxISEQ8RERMWHBcTFBoVEREYIRgaHR0fHx8TFyIkIh4kHB4fHv/bAEMBBQUFBwYHDggIDh4UERQeHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHv/AABEIAGQCWAMBIgACEQEDEQH/xAAdAAEAAgMBAQEBAAAAAAAAAAAACAkFBgcEAwIB/8QAWBAAAQMDAgMDBAsLBwoEBwAAAQIDBAAFBgcRCBIhEzFBFFFhcQkiMjc4dYGhsbO0FUJScnN0doKRssEWMzZikqLRFyMkNVNXk5SV0kNVhMIlNFZjg+Hx/8QAGgEBAAMBAQEAAAAAAAAAAAAAAAQFBgIBA//EAC8RAQABAwIDBQcFAQAAAAAAAAABAgMEBRESITEGQWGR0RNRgbHB4fAVMjNxoUL/2gAMAwEAAhEDEQA/AJl0pSgUpUT+NHiCuWJTV6eYRLMW7FpK7ncGz7eKlY3S035llJCir70EbdTuAkJm+pWBYSeTKcstVre25vJ3XwXiPOG07rI+SuevcVeh7b/ZpyuQ4nf3aLXJ5fnbB+aq2pUh+VJckynnH33VFbjjiipS1HvJJ6k+mv2qDNTDE1UOQmKo7B4tEIJ/G22oLUsJ1m0uzOSiLjua2uTKcOzcd1So7yz5kodCVKPqFb9VM9TM4Gdcrzcb63pll1wdnpeaUqzy318zqChJUphSj1UnlBKSeo5duoIACZlYO65hiVpnLg3XKbHAloAK2JNwaacTuNxulSgRuOtZyqtOKkk8Q+a7kn/4kr91NBZnZcpxi9ylRbLkdnuUhKOdTUSa28sJ7tyEknbqOvpry5rnOH4VGQ/leSW20JcG7aZL4Stzz8qPdK+QGq0OHjO4+m+fPZc82HnIlrlJjMnfZ19aOVtJ28OYgn0A1p2X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spUdDQb3DDa7DIpoRhcGWlEKfcFAx7RXt81w097NaiOzPA8BYGAgIWYzheMVn8TV9Wyi+nd9z46zeUJDrCpbxtt+q/aQ+QwLdXsMQg+Xpij0u484cEGOQv1kbiYw1Yal7jec+kPLxfuLo7cvl/U4FVaLvYuHJ+4oEs4lcN0QwnUe8ho2v/s7uF6Q8/vfd3GDTWCwXB8oGHRMUS4sE0b1Dy8ZHAyE3FuTicFUiur9SEB4IU3O9C/HnkWTQ1EWRUwTYObGgtOsigtY6nmcPQTXWVHp4eoyMZz6We/H1f8AbEsD7wplbmRzdHJlYW0KZW5kb2JqCjEgMCBvYmo8PC9Db250ZW50cyA2IDAgUi9UeXBlL1BhZ2UvUmVzb3VyY2VzPDwvUHJvY1NldCBbL1BERiAvVGV4dCAvSW1hZ2VCIC9JbWFnZUMgL0ltYWdlSV0vRm9udDw8L0YxIDIgMCBSL0YyIDQgMCBSL0YzIDUgMCBSPj4vWE9iamVjdDw8L2ltZzAgMyAwIFI+Pj4+L1BhcmVudCA3IDAgUi9NZWRpYUJveFswIDAgNjEyIDc5Ml0+PgplbmRvYmoKMiAwIG9iajw8L1N1YnR5cGUvVHlwZTEvVHlwZS9Gb250L0Jhc2VGb250L0hlbHZldGljYS1Cb2xkL0VuY29kaW5nL1dpbkFuc2lFbmNvZGluZz4+CmVuZG9iago0IDAgb2JqPDwvU3VidHlwZS9UeXBlMS9UeXBlL0ZvbnQvQmFzZUZvbnQvSGVsdmV0aWNhL0VuY29kaW5nL1dpbkFuc2lFbmNvZGluZz4+CmVuZG9iago1IDAgb2JqPDwvU3VidHlwZS9UeXBlMS9UeXBlL0ZvbnQvQmFzZUZvbnQvSGVsdmV0aWNhLUJvbGRPYmxpcXVlL0VuY29kaW5nL1dpbkFuc2lFbmNvZGluZz4+CmVuZG9iago3IDAgb2JqPDwvS2lkc1sxIDAgUl0vVHlwZS9QYWdlcy9Db3VudCAxPj4KZW5kb2JqCjggMCBvYmo8PC9UeXBlL0NhdGFsb2cvUGFnZXMgNyAwIFI+PgplbmRvYmoKOSAwIG9iajw8L01vZERhdGUoRDoyMDIxMDIyMDE1NDUzOFopL0NyZWF0aW9uRGF0ZShEOjIwMjEwMjIwMTU0NTM4WikvUHJvZHVjZXIoaVRleHQgMi4wLjggXChieSBsb3dhZ2llLmNvbVwpKT4+CmVuZG9iagp4cmVmCjAgMTAKMDAwMDAwMDAwMCA2NTUzNSBmIAowMDAwMDE2NDQ0IDAwMDAwIG4gCjAwMDAwMTY2NDEgMDAwMDAgbiAKMDAwMDAwMDAxNSAwMDAwMCBuIAowMDAwMDE2NzMzIDAwMDAwIG4gCjAwMDAwMTY4MjAgMDAwMDAgbiAKMDAwMDAxMzg2NyAwMDAwMCBuIAowMDAwMDE2OTE5IDAwMDAwIG4gCjAwMDAwMTY5NjkgMDAwMDAgbiAKMDAwMDAxNzAxMyAwMDAwMCBuIAp0cmFpbGVyCjw8L0luZm8gOSAwIFIvSUQgWzw3NWJjZDFmNmQ1MDA5Nzc2N2E2NTAwOTI3OGEzZWM2ND48YjE4OGU3ODdlZDExMzg1ZjJlMWE2MThkZDIwMTBkYzM+XS9Sb290IDggMCBSL1NpemUgMTA+PgpzdGFydHhyZWYKMTcxMzIKJSVFT0YK"]'
            }
          }
          schemaId: '63998a47b8f67a14dc5e2a3c'
          typeName: 'MergePostRequest'
        }
      ]
    }
    responses: [
      {
        statusCode: 200
        description: 'When merging process is successful'
        representations: [
          {
            contentType: 'application/json'
            examples: {
              'Successful Response body': {
                value: '{"success":true,"errorMessage":null,"output":"JVBERi0xLjQKJeLjz9MKMyAwIG9iaiA8PC9Db2xvclNwYWNlL0RldmljZVJHQi9TdWJ0eXBlL0ltYWdlL0hlaWdodCAxMDAvRmlsdGVyL0RDVERlY29kZS9UeXBlL1hPYmplY3QvV2lkdGggNjAwL0JpdHNQZXJDb21wb25lbnQgOC9MZW5ndGggMTM2OTc+PnN0cmVhbQr/2P/gABBKRklGAAEBAAABAAEAAP/bAEMABQMEBAQDBQQEBAUFBQYHDAgHBwcHDwsLCQwRDxISEQ8RERMWHBcTFBoVEREYIRgaHR0fHx8TFyIkIh4kHB4fHv/bAEMBBQUFBwYHDggIDh4UERQeHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHv/AABEIAGQCWAMBIgACEQEDEQH/xAAdAAEAAgMBAQEBAAAAAAAAAAAACAkFBgcEAwIB/8QAWBAAAQMDAgMDBAsLBwoEBwAAAQIDBAAFBgcRCBIhEzFBFFFhcQkiMjc4dYGhsbO0FUJScnN0doKRssEWMzZikqLRFyMkNVNXk5SV0kNVhMIlNFZjg+Hx/8QAGgEBAAMBAQEAAAAAAAAAAAAAAAQFBgIBA//EAC8RAQABAwIDBQcFAQAAAAAAAAABAgMEBRESITEGQWGR0RNRgbHB4fAVMjNxoUL/2gAMAwEAAhEDEQA/AJl0pSgUpUT+NHiCuWJTV6eYRLMW7FpK7ncGz7eKlY3S035llJCir70EbdTuAkJm+pWBYSeTKcstVre25vJ3XwXiPOG07rI+SuevcVeh7b/ZpyuQ4nf3aLXJ5fnbB+aq2pUh+VJckynnH33VFbjjiipS1HvJJ6k+mv2qDNTDE1UOQmKo7B4tEIJ/G22oLUsJ1m0uzOSiLjua2uTKcOzcd1So7yz5kodCVKPqFb9VM9TM4Gdcrzcb63pll1wdnpeaUqzy318zqChJUphSj1UnlBKSeo5duoIACZlYO65hiVpnLg3XKbHAloAK2JNwaacTuNxulSgRuOtZyqtOKkk8Q+a7kn/4kr91NBZnZcpxi9ylRbLkdnuUhKOdTUSa28sJ7tyEknbqOvpry5rnOH4VGQ/leSW20JcG7aZL4Stzz8qPdK+QGq0OHjO4+m+fPZc82HnIlrlJjMnfZ19aOVtJ28OYgn0A1p2X5Je8tyKXkGQ3F64XGWsrdedVv6kgdyUjuCR0A6Cgs5sOvOj97nog2/PrR26zshL6lRwonuALgSCfRvXSQQQCCCD1BFUz1Jzhr4l5WB4Ffcdydx25IgQi9jwdJJ7XcJEYnv5N1BQP3oSsfggBODMMvxbD4KZuUZBbbOwvcIVLkJbLhHeEg9VH0AGtOtWv+jdzmphxdQLQl1R2HblbCN/x3EpT89VoZxlmQZrkkrIcluT1wuElW6luHogeCEDuSkeCR0FYOguVYdafZQ8w4h1pxIUhaFApUD3EEd4r91X1wQ6wXfGc+t+A3Sa5Ix29PeTx2nFb+SSVe4KN+4LVskp7t1A94O9gtArWM21CwfCkg5VlNqtSyOZLL8gdqoecNjdRHqFcI4ztfp2B8uDYbIDOQSWQ7NmjYmE0r3KUf/cUOu59ynYjqQRAyfMl3Ca9Nnyn5Up9ZW6884VrcUe8qUepPpNBZJI4qtD2nuzTlj7w32K0WuTy/O2DW1YZrfpRl8lEWxZva3ZLh5UMSFKjOLPmSl0JKj6t6qy8hneReW+RyPJd9u27JXJv5ubbavPQXMUqEHA9rlekZRE0zyq4OzrfNSUWmQ+sqcjOpBIZ5j1KFAEAHuIAHQ9Jv0GDv+YYjj8tMO/ZTY7TJWjtEszbg0wtSdyOYJWoHbcHr6Kx/wDlN02/3hYl/wBZj/8AfUE+Pz4Q0r4ti/umo/0Ftn+U3Tb/AHhYl/1mP/30/wApum3+8LEv+sx/++qk6UFwmPZHj2RNvOY/frXd0MkJdVBltvhsnuCignbfY99ZSoUexoJX9184UArkEeECfDfme2/jUtNS8zsun+FXHK788UQ4Te/In3byz0Q2geKlHYD9p2AJoM5cJkO3w3Zs+WxEjNJ5nHn3AhCB5yo9AK5vcuIPRi3yVR5GoNpWtJ2Jj876f7TaVJP7ar41q1ey/VW/Lm32atq3IWTDtbKyI8ZPh0++Xt3rPU+gbAc9oLa8M1M0/wAyeDGM5fZ7lII3EdqSkPbefs1bK2+Sttqmph11h5D7Di2nW1BSFoUQpJHcQR3Gpo8HPEbcbrdomneoE9UuRI2btN0eVu4tfgw6o+6J+9UepPQ7kigmJWFvGW4rZpnkV4yay26UEhXYyp7TS+U9x5VKB2rNVWPxnkniYy/ck/5yMOv5qzQWP2fLcVvMzyOz5NZbjJ5SrsYs5p1fKO88qVE7V+cwy7F8PgJn5Rf7dZ46iQhUt9KO0I8Eg9VH0AGqyuGjKrfhGs1pyu6k+SW2NPeWkHYuHyJ8IQPSpRSkekitc1LzfINQsumZLkkxciVIUeRvc9nHb39q22PvUj5+pO5JNBZJbuILRmfMTEY1BtKXFHYF/nZR/bWkJH7a6XGfYlR25MZ5t9h1IW242oKStJ7iCOhFU11JLgc1cuuM6gwcCuUxx/Hr272DDTiiRFkq9wpG/cFq9qQO8qB8OoWDUpSgVqeeak4JgqU/ysym22pxaeZLDjnM8oecNp3WR6QK5xxea1K0qxFm32Nbasou6VCHzAKEVodFPlJ6E79Eg9Cdz1CSDBHBMMzzWHM5EezsybxdHj286bKePK2CfduuK7vQOpO3QGgn/B4ndDpkoRm84bbUTslT1vlNIP6ymwB8u1dVsd3tV8trVzstyh3KC8N25EV5Lra/UpJINQJyDgz1Nt1lVNgXTH7tKbRzKhsPOIWr0IUtAST6ymua6O6m5jotnS1splNsNyOyu9nkboS8EnZSVJPuXB12VtuD5xuCFptKxmJ362ZRjVuyKzPh+33GOiQwvuJSob7EeBHcR4EEVoPEnq5B0jwQ3Ts25V5mqLFriLPRxwDcrVt15EAgnbvJSOm+4Dd8vy3GMQt4n5PfrdZ453CFy30t85HgkHqo+gAmuaO8UOhjcnsDm4J32K02yWUg+sNfOOlQDZRqHrXqJyBU7I8hnEndSgEtIB69+yWm07+hI39NdtHBRnxs3lByjHRceXfyX/O8m/m7Tl7/ANXb00E0cIzrD82irk4pkduu6EDdxMd4Fxv8ZB9sn5QK2OqmLvbM90ez9LUpM/HMggKDjLra9uZJ7lJUN0rQdiPEHqD4irCeFrWJjVvBlPzEtR8ithSzc2EdEqJB5HkDwSvY9PAhQ7tiQ6nd7pbLPCVNu1xiW+KkhKn5TyWmwT3AqUQOtfOyXuzXyOuRZLvb7my2rkW5DkoeSlW2+xKSQD6Kjt7I4SNELPse/JGN/wDlpNRp0H1ed0q0vzhNpWn+UV4fhsW7mAIYAS/2j+x6HlBSAD98pO+4BFBPjULVnTnAHhHyzK4NvlEBXkw5nnwD3EtthSgD5yNqxmE676TZlcm7ZYczhOTnTytx5LbkZbivwU9qlPMfQNzUNtOOGDU7UqArLb5cWLO3cN5Db10UtyVKKuvaFI6gHv3UQTvuAQd65zrPpHmOk15Zh5LGaXHk7mHPiqK2H9u8AkAhQ3G6SAfWOtBaxWCzTMcWwu2i45VfoFojKJCFSXQkuEd4QnvUfQATUXuHHiTbg6I5Ac2lLnXXFmEGIXHP87cG1nkaQSepUleySr8EgnfYmuMYxgmrXExl8/KpL7aYvalDlwmrUiLHHeGGUgEnlB9ykelR3O5CY1u4mNEJ88Qmc6YbWo7JW/Ckstn9dbYSPWSK6zAmRLhCZmwJTEuK+gLaeZcC0OJPcUqHQj0iq3dbOGfOtM7IvIFPw77ZmtvKJEMKC4+/TdbahuE79OYEgeO1Zbgt1huWFZ9Bw+5zHHcZvchMfsnFbpiSFnZDiN/cgqISod2x37xQWJUpSgVrecZ7huERUyMsyS3WhKxu2h94Bxwf1GxupXyA1ofFbq4rSbTxMq2hpy/3RxUa2ocG6WyBut4jxCAR0/CUnfpvUBMIxLP9bc+fYgrfu92kHt5s+a8eRlO+3O4s77DwAAJ8AOlBOKbxbaLMPltq83OUkf8AiNW10JP9sJPzV78e4pNFrxKRGOUO25xZ2SZ0N1pB9a9ilPrJFchs/A6x5EDd9QnPKinqmLbRyIPrU5uofIK5jrtwtZXpvYX8ltl0ZyOyxhzSltsFl+On8NTe6gUDxIV07yANyAsPgTIlwhMzYEpiXFfQFtPMuBaHEnuKVDoR6RXxvt2tlitEm73mfHgW+KjnfkSHAhDae7ck+kgfLUCeBXVi4YzqBFwG5S1uWC+OFuO2tW4iyj1QpPmCz7Ugd5KT4HeUnGb8GjMPyUb7UzQbhiep+nuWXYWnG8ws90nlCnBHYkBSykd5A8dvRW31W1wKfCSsf5tL+oXVktArS8m1W03xm8vWa/ZpZbfcWAkuxnpIC29wCOYeG4IPqIrdKrA4wfhJZj+ctfUN0Fm9rnwrpbo9ytstmXDlNpdYfZWFocQobhSSOhBFeiuc8Mfwf8I+KGforo1ApSlApSlAqunV7h+1wueoORZA7iblzbn3J+QiRFmMrC0qcJTsnn5wNtgAQNhVi1avqTn+J6d2A3vLbs1AjElLSPdOvr/BbQOqj6ug7yQOtBD/AIQeH27uagyr1qZh8uLb7UyFRY1xY2bkSFHoeU9FpSAo7dRuU+qpwyIcSRBXBkRWHoi0dmthxsKbUjbblKT0I28Khpm/G5LL7jOFYWwhoH2km7vFSletpsjb+2a5nd+LfWiaVGNd7XbN+4Rba2rb/ihdBpfExittwrXTKMctDQZgR5KHY7Q7mkOtIeCB6E9psPQK8nD1Ldh67YK8yohSr/DaOx29qt5KFfMo1reZZNfMwySXkeST1T7rM5O3kKQlBXyoShPRIAGyUpHQeFZzQn378D/SS3faW6C2WqtOKj4Q2a/GSv3U1aXVWnFR8IbNfjJX7qaDR8PsU3KMrtWOW4J8rucxqIyVdwUtQSCfQN9z6BVgVt4RNH4+NptsyDc5lwLfKu5mc4h3n26qSgHsx17gUn5ah/wiNod4j8NS4ncCW4r5Qy4R84FWg0FR+rGISMB1GvmISXu3VbZRbQ7y7do2QFNr28CUKSdvTWAtkKTcrlFt0JouypTyGGWx3qWpQSkfKSK7HxwgDiYyYgAEtwyfT/ojVaVoC2hzXLBUOJCk/wAoYJ2PofQaCaWE8H+mVvxhmLk7c683hbYMiWiWtlCF7dQ0lJA5R4c3MT81Q54iNO0aX6qXLFY8p2VBQlEiG87tzqZWncBW3TmB3SSNt+XfYb7VarVefshnv9sfEkf6x2g4jp085G1BxyQ0dnGrrFWk+Yh1JFW9VUDgn9OLD8ZR/rU1b9QV86+aCa137VbJ8mbxZd1hz7i67GfjzGVbsc2zQ5CsLGyAkbEeFe/hT4eb9M1PVO1Lw6bEs1qYLyGZ7OzUqQSAhBB6LSBzKO249qAeh2M1tQM1xjAsecvuV3Zi3QkHlSV7lbqvBCEDqtXoA9PdUVM643FJkOMYRhqFNJPtJV2eO6v/AMLZ6f2/2UExvJIvkXkXkzPkvZ9n2PIOTk225eXu226bVWLxa4lasL14v1oscdEW3OdlKYjoGyWe1bSpSUjwSFFWwHcNh4Vsl44udZ5ylGLc7Tawe4RbahW3q7Xnrj+c5bkWb5C7kGUXJVxubyEoW+ptCN0pGyRsgADYeig9eksp2DqpiUxhRDjN7hrTsduoeQatxqofTX3xca+N4v1yat4oNTy/TXAcvuSLlk2I2i6zUNhoSJEcKc5ASQkq7yBudt/PWCe0P0aZZW89p/jrbTaSpa1xwEpA6kknuFdJqJXHnrL9ybYrS7HJe0+a2FXl1tXVlhQ3SxuO5Sx1V/V2H3/QIwcQeQ4df9RJQwLH7fZ8ehbx4vkrIQZWx9s8rx9se4eCQPEmtHslruF7vEOz2qI5LnzHksR2GxupxajsAPlrx1OPgM0Z+5NtRqjkcTafNbKbKy4nqywobKf2PcpY6J/q7nrz9A7dw7aXQNKNOo1ia7N65v7SLpKSP558jqAfwEj2qfQN9tyajH7I1mz0vK7LgMZ4iJb44uEtIPRT7m6UA+lKASPypqcdVe8XVwcuXEbmLy1c3Zy0R09e4NtIRt/doOWxmXZMlqOw2px11YQ2gd6lE7AD5atb0V01sGmeDwbFa4UYSwwn7oTEtjtJT23t1KV3kb77DuA2FVk6QstyNWcPjujdt2+wkKHnBfQDVt9BBz2QrTaz2GbZc6sVvYgi5Orh3FDDYQhbwTztubDpzKSFgnx5Qe/eonRn3o0lqTGdWy80sLbcQrZSFA7ggjuINWGeyDRUSNAA6oAmNeIzqfQSlxH0LNV30Fsuh2Yfy90nx3K1lJkTYY8q5e4PoJQ7sPAc6Vbejaq+uM34S+YflY32VmpT+x3XByXoZNiOEkQb4+02PMlTTK/3lqqLHGb8JfMPysb7KzQckiR35ctmJGaU6+84lttCRuVKUdgB6STVgunfCLppbcQjx8wgSL3fHWgqVJE11lDThHVLSW1JHKD03VuTtv032EM+HWI3O13wiO8kKR924yyD3HlcCv4Va1QVWcRmnKdLtVbhi8eQ7IgciJMF13bnUysdArboSkhSSR38u+w32rU8Hmrtua2K4tKKXItxjvpI7wUuJUPoqQHsjgA1ws5AA3xtgn0/6TJqOdh/15A/OW/3hQXF0pXmusoQbXLmkbiOyt3bz8qSf4UFX/FNmDua66ZJci6XIsSSq3wxv0SyySgEehSgpf65qd/CZgMbAtFrMwY6UXO6spuNxcI9upxxIUlB/EQUp284J8TVaFqYcu+QxIzy1Lcmy0IWrxJWsAn56uHabQ00hptIQhCQlKR3ADuFB+qg57IzhEW3ZLYs6gR0tquqFxJ5SNgp1sAtrP8AWKCU+psVOOvBfLLZ77C8hvlpgXSJzBfYTI6Hm+Ydx5VAjfqetBHL2OrJH7npPdcdkLUv7i3IljfuS08nnCR+uHD+tUcuNnNHss13usNDxVAsO1sjI36BSOrx28/aFQ9SU+arGLBYLFj8VcWw2W22lhxfOtqFFQwhStttyEAAnbxqo7Mp67pl95ubiuZcue++pXnK3FKJ+egn/wACWAxMX0dj5K9HSLtkZMl10j2yY4UUtIB8xAK/1/QKkHWuaWwm7bpli1vZADcazRGk7eZLKB/CtjoOD8b2n8TMNGJ97bjpN3xxBnR3gn23Yj+fQT+Dybq9aBUQuDfM3sP15sYLxRCvLn3LlI36KDpAbPyOdmd/Nv56sfzOG3ccPvVveALUm3vsrB8QptQP01URZpztsvEK5Mkh2JIbfQR3hSFBQ+ignp7I77yFm/SRj7NJqM3BrgkPPNb4Ea6R0yLZamV3KU0sbpc7MpShJ8CC4tBI8QCKkz7I2QdD7KQQQckYII/NpNcw9jYbQc8yt0pHOm1tJB8wLvX6BQTork3F1jcTJeH7KG5LSVO26KblGWR1bWz7cketAWn1KNdZrTNdwDohnm//ANN3H7M5QVYYdZZeS5Xaccgq5ZF1msw2ye4KcWEgn0Dff5KtqwnGrTh+KW3GbHHTHt9vYSy0kDqdu9SvOpR3UT4kk1WVwtISviFwoLAI+6aD184BI+erTaDz3KFEuVuk26ewiRElNKZfaWN0uIUCFJI8xBIqonKre5i+c3a1R3VB203N6O25v1BadKQfX7WrfqqU1n9+HNP0gn/aF0FsVpleXWuJN5eXyhhDu3m5kg/xr01jMT/oraPzFn9wVk6Di3EpoJG1lftMtWTyLLJtjTjbY8mD7SwsgklPMkg+179/N06VleGvR+Lo9h8y1fdBu6XGfKMiVMSx2XMkAJQ2BuTskbnv71qrpN6udustqk3W7TWIUGK2XX5DywlDaR3kk1EbVHjUYjTHYOnWOtzW0EpFxunMlC/SllJCtvMVKB86RQTErz3OFFuVtlW6cyl6LKZWw+2odFoUClST6CCRVcVz4sNbZbpXHyOFb0k+4j2xggf8RKj89eFPEjr0tIWjNJaknuItkbb6qg51Z1u4xqNDcQ4Q9abuhSV9x5mnh1/amrGeM34NGYfko32pmq0/KZEy+eWS1lyQ/J7R1RAHMtStydh3dSass4zfg0Zh+SjfamaCHPAp8JKx/m0v6hdWS1W1wKfCSsf5tL+oXVktAqsDjB+ElmP5y19Q3Vn9VgcYPwksx/OWvqG6CfPDH8H/AAj4oZ+iujVznhj+D/hHxQz9FdGoFKUoFKUoPlMkMQ4j0uS4lphhtTji1dyUpG5J9QFVUa66kXbVDUKfkU950Qw4pu2xVH2saOD7VIHdzEdVHxJPoqy3WwvDRnNzH5u2/k7P7Pl7+bydzbb5aqWoN+0F0yuWq+oMfGIMgRGEtqkzpZRzdgwkgFQHiolSUgecjw3qe+H8MujeOw22lYq3eJCQAuTc3VPKcPnKdwgfIkVGb2Oy/wBrteq92tM99tiRdbb2cMrIHaOIWFFsekp3O39U1OjK8gs+LY/Mv9/nswbdDbLjzzh2AHmHnJPQAdSSAKCtDi2s1nx/iEyez2C3RbdbY5ihmNGbCG294jKlbAdBuoqJ9JNa7oT79+B/pJbvtLdeLVXK3c51Gv2WOtlr7pzFvNtqO5bb32bSfSEBI+SvDhF6ON5pY8iS2XDa7jHmhA++7JxK9v7tBcBVWnFR8IbNfjJX7qas9x6726/2OFe7RKRKgTmEvx3kHotChuD/APrwqsLio+ENmvxkr91NB7OD74SWHfnLv1DlWf1WBwffCSw785d+ocqz+grU44vhL5L+Sh/ZWq0zh99/XBf0ghfXIrc+OL4S+S/kof2VqtM4fff1wX9IIX1yKC16q8/ZDPf7Y+JI/wBY7VhlV5+yGe/2x8SR/rHaDhuCf04sPxlH+tTVvqlJSkqUQlIG5JOwAqoXTxAdz/HWydgu6xU7+t1NWwZ/2wwPIPJ+btvuXJ7Pl7+bslbbfLQVm8R+p9w1R1KnXVyS4bPFcWxaY+/tGmAdgrb8JewUo+kDuArD6L6e3TU/UGBiVrdTHL/M5JkqTzJjsp6rWR4+AA6bkgbjfetMqRHsf1/tdk10di3J5thd2tTsKItZABeLjTgRufFQbUB5zsPGglPhXDBo9jcFtp/GhfJSUgOSrm6p0rP4gIbHyJ/bUNuMyw2LGtd7laMdtcO2QGokZQjRWwhCVKbBJ2Hid96skv8Ad7ZYLNLvN5nMQbfEbLr8h5XKlCR4n/DvJ6CqqdcM0/yharZBlyULbYnSf9GQrvSyhIbb3HgeRKSfSTQYvTX3xca+N4v1yat4qnOx3By03uDdGUhTkOS3IQD3EoUFAfNVu2G5Fa8txa25JZZCZFvuLCX2VjvAPek+ZQO4I8CCKDT+IbVG36Uadyr8/wBm9c392LXEUf558joSO/kT7pR8w27yKq6vl1uF8vMy8XaU5LnzXlPyH3DupxajuSflrp/FnqBc881lvKZLik26yynrbb2N/aoQ2spUvb8JaklRPftsPAVyOg7XwkaPOapZ6mTdGF/yYtCkvXBZ6B9XeiOD51bbq27kg9xIqytlptllDLLaG2m0hKEITslIHQAAdwqpDFtQs6xWD5BjeX3u0RO0LpjxJq2mysgAqKQdiSAOvoFdDxPii1msDyC5kqLywk9WLlFQ6FetaQlz+9QWXVV1xaQl2/iLzNhxJSVzg+PU42hwH9iqmlwy8Q1u1ekyrHLs6rRkEON5SttDnaMPthSUqUgnYpIKk+1O/f0J67cA9kVw523ai2nNGGj5JeIYjvrA7pDPTr62yjb8Q0HAdJH0RdVsRkunZtm+QnFH0B9BNW4VTXHecjvtvsrKHW1BaFDvBB3Bq2nSTN7ZqHp/asptb7SxKYT5Q2hW5YfAHaNqHgUq39Y2PcRQcn9kBeQ1w+uoUer11jIT6/bK+hJquqpj+yMZ9b5f3E08t8pD8iK+bhckoVv2KuQoaQdvvtluEjwBSfGocpSVKCUglROwAHU0E/8A2OeG6xondZTgITJvzym+nelLLKd/2hQ+SowcaCVI4mcvChse0in5DEZIqevDlhruBaL43jkpvs5rcbt5iSOqX3VFxaT+KVcv6tQP42vhO5d/6L7ExQa/wx/CAwj43Z+mrUqqt4Y/hAYR8bs/TVqVBAD2R3377N+jbH2mTUc7D/ryB+ct/vCpGeyO+/fZv0bY+0yajnYf9eQPzlv94UFxdeS9RlTbNNho6KfjuND1qSR/GvXSgp1sko22/QZrgUkxZTbqht1HKoH9vSriUKStCVoUFJUNwR3EVVRxFYo7hetOUWNTRbYE5ciL06Fh09o3t59kqA9YNWF8L+bxs70Ux+5ofDk2JHTAnp39sl9pISSfxhyr9SxQdNr4zJUWGyX5klmO0DtzurCE7+s19qg57Izm7Fwyex4HBkc4tTapk9KVdA84AG0kfhJQCr1Oigm5CmRJrRehSmJLYPKVtOBY3824qoLLoS7Zld3trieVcSc+woeYpcUkj5qnJ7HPjkm26WXnIpAWhF4uPLHST0U2ynl5x61qWn9So18ZWIu4nr9fiGiiJeFi6RlbdFB3cufsdDg/ZQWJaYTG7hpri89kgtybPEdSR5lMoI+mtirg/A3m8bKtD4NoU+lVyx5RgyGyfbdnuVMq2/BKPa+tCq7xQYvL5TcHE7xNeIDceA+6sk9wS2on6KqEtUN243SJb2Bu7KfQygf1lKAH01ZFxpZ3Fw3RC6QQ+lNzyBtVtiNb+2UhY2eVt5g2VDfzqT56hnwf4c9mOvVgR2RXDtLouktW24SlkhSN/W52aflNBJ/2RtITodZUpAAGSMAAeH+jSa5p7Gv/AE3y34tZ+trpnsjvvIWb9JGPs0muZ+xr/wBN8t+LWfraCctaZrt7yGefo3cfszlbnWma7e8hnn6N3H7M5QVz8K/whsK+Mk/uqq0uqtOFf4Q2FfGSf3VVaXQKqU1n9+HNP0gn/aF1bXVSms/vw5p+kE/7QugtYxP+ito/MWf3BWTrGYn/AEVtH5iz+4KydBCb2RPUSY5e7bprb5Cm4TLCZ9ySg7dq4onskK9CQObbuJWk96RWkcIOgUbVJ+VkuUOPt41AfDCWWVci5rwAUUc3elCQU7kdTzbAjYkYfjmYkM8SmQuPb8j7ENxncfeeTNpO36yVVK7gLlwZHDrbWYqkF6LOlNSwD1DhcKxv+otFB1XE8BwnE4yGMcxWz21KBsFsxUBw+lS9uZR9JJNbLSuTcVepMTTjSS5SEyEpvN0aXCtbQPty4tOynAPMhJKt+7flHiKCtm+SmpubzprJBakXJx1BB33Sp0kfTVkHGb8GjMPyUb7UzVZsD/56P+VT9NWlcTlrdvGgGaQmUlbgtbkgJHeey2d/9lBCHgV+ElY/zaX9nXVktVacLWRxcU1+xO7znUtRfK1RnVqOyUB9tTPMT4AFwEn0VaXQKq54spTcziLzR5ogpTPDR2PihtCD86TVkOp+Z2jT/B7lld6dSiPCaKkN82yn3T7hpPnUo7D0dT3A1U3kN1mX2/3C93BfPMuEpyU+rzuOKKlH9pNBaHwx/B/wj4oZ+iujVznhj+D/AIR8UM/RXRqBSlKBSlKD5TIzEyG9DlNJdYfbU26hXcpKhsQfWDVVeu+mN60szyXYriw6qAtanLZNKfaSmN/akHu5gNgpPgfQQTazWJyvGsfyu0rtOS2aFdoKzuWZTIWkH8Ib+5PpGxFBUAy66w8h5lxbTragpC0KIUkjqCCO41mrzk2X5UY0G85Bfb4UqCYzEuY7J2UegCEqJ69dulWFS+FHRJ+UXkY3LYSTuWmrk/yfOon563bT7R7TTApAl4viMCHMSNky3OZ99Pn5XHCpSd/QRQQHy3hz1AxjSBrUG6RezIc5pdrCCZESOR7V5zzdfdJ70ggn74J5hiWOXvLMhiWDHbc/cblLXyMsNDcnzknuSkDqVHYAdTVwDzTbzK2Xm0ONOJKVoWndKgehBB7xWpYDplgeBTJ8zEcah2qRcFc0lxsqUpQ335UlRPIjf7xOye7pQYPhq06uWl2lkXF7tePulL7dclzl37KOVgbtN79SkEE7nbcqUdhvtVf/ABUfCGzX4yV+6mrRI0yJKcdbjSmXltK5XEoWCUHzHburQss0Q0qyu/yb9f8ADIMy5SiC+/2jrZcIAG5CFAE7Addt65pqpqjemd3s0zTO0oCcH3wksO/OXfqHKs/rn2HaK6XYff2L9jmHQoNzYCgzIDjjim+YFJKedRAOxI379ia6DXTxWpxxfCXyX8lD+ytVpnD77+uC/pBC+uRVkOb6N6ZZrfFXzJ8RhXC5LQltcgrcQpYSNk83Iob7DpueuwA8K8mM6FaS43fYl8suFQYtwhrDkd4uOuFtY7lAKURuPA7dKDpFV5+yGe/2x8SR/rHasMrSc+0m07zy6NXTLcWh3Oay0GUPrWtC+QEkJJQobgEnbfu3NBV7pr74uNfG8X65NW7rSlaChaQpKhsQRuCK5lZtANHbRdot1t+CwGpcR1LzC1OurCFpO6TyqWQdj16iunUFW3EfpVddLNQZkByK6bHLdW9aZe26HGSdwjf8NG/KR39Ae4iuYoUpC0rQopUk7gg7EHz1cLktgsmS2l205BaYd0gO+7jymUuIJ8Dse4jwI6iuQz+FPRKVKL6cZlRgTuW2bk+EfsKjt8lBXnesry7IozFvvOS3y7sNkBiPLnOvpQe4cqVKIHyV0u6cN+odr0cd1EuEIsKaUHXLSps+Utxdju+sfe7HYlG24TuTtsRU8MA0W0vwWWibjeIQY81HVEp8rkPIPnSt0qKT+LtXQFJSpJSoBSSNiCNwRQU8Y7ZbtkV7i2Wx29+4XGW4G2I7KeZS1fwA7yT0ABJ6VZfwr6Y3fSvTMWO+Xby2dKkmY6w2d2YilJSC2g+PudyegJJ2HidpwnS/AMKvdwvWLYvBtlwuJJkPNcxOxO5SgKJDad/vUBI6Dp0FbhQVU5XiOUZbrRltrxqw3C6zBfJnO3GYUrsx26+qz3JHpUQK6ZjHBxqtc2UPXWRYbGCOrUiWp10fI0lSf71Tzul0sWPh12S5HjOPq7RaW0DtHVbbcxA6k9NtzWrzdTYaFEQ7W+8PO64EfMAarcvWMLDnhvXIifd1nyjeU3H03KyY3tUTMe/pHnKKz3BFlwbJZzWxrc8ErYdSD8oB+itCzThT1hxtlchi0Q7+wjqpVqk9orb0NrCVn1JSam2NTnt+tnbI9Eg/9tZ/GM4gXqciAqK7FkOA8gJCknYbkb9PAeao+P2h07IuRbouc56bxMfOH2vaNm2aJrro5R4xP1Qt9j5gToGv93iToUmLIj2GQh5p5pSFtq7djooEbg+upl6z6e2nU7T+fil1PZdsA5FkhO6oz6d+RwDx23II8UlQ6b1tyY8dMlclLDSX3EhK3QgcygO4E95A3P7a+lXSsVH6mYFk+neTv4/lFuciyEElp0AlqQjfo42ruUk/tHcdjuKxdiyPIbD233Cvt0tXbDZ3yOW4z2g8yuUjf5atry/Fcby+0qtWT2SDd4ZO4blMhfKfwknvSr0gg1xq58ImjUySXmIF4gJJ37KPcVFHq/zgUdvloK6HnHHnVuuuKccWoqWtR3Kie8k+JqVvBlw+XG6XuDqJmtvXFtERSX7XDkI2XLcHVDqknubSeo390dvve+SWB8PGkmGzG51txRmXObO6JNxcVJUkjuISs8iSPOEg11agVWbxtfCdy7/0X2JirMq0DNdGdMMzvzt+yXEIU+5vJSh2QXHEKWEjlTzcigCQABueuwA8KCuzhj+EBhHxuz9NWpVzrFdDtKMXv0W+2LC4MS4xFFTD/aOuFtW224C1Eb9e/bpXRaCAHsjvv32b9G2PtMmo52H/AF5A/OW/3hVrGoGlmn+fTo87L8YiXWVGa7Jp5aloWlG5PLuhQJG5J2PdufPWAt/DzoxAnMTY2BW8PsOJcbK3XlgKB3G6VLIPqIIoP1xRZ7eNN9HbnklhZQu5do1GYdcRzoYLitu0Ke47DfYHpzEb7joYv8LXEFqbdtYrRjWSXl2/228vKZcbeZQFsq5VKDiFJSCACOo7tt+gOxqcOQ2a1ZDZZVlvcBifbpbfZvx3k8yFp9Py7EHvBAIrStN9E9M9PLy7ecVxpuLcHElAkOvuPrbSe9KC4o8vm3HUjoTQc042NFJeoVgj5bjEUv5HaGi25HQPbzY25VyJ860EkpHjzKHU7CocaNar5lpBkUiXYVo7J4hufbpaCWnuUn3SdwUrT12UNiOo6jcVatXN9StDtMdQZS52RYywbiv3U6ItUd5R86iggLP4wNBFzKONjLJ1mXFsGI22zzlo5fK3ZKpPIdvdJQUpG/m5uYecGuJ6XYJmOtOoqokZciVIkveUXW6P7rSwlSt1OLV4qPXZPeT0HiRNa38IOjkWWH3ot7moB37F+4EIPo9oEq+eu04hi2O4hZ0WjGLNDtMFB37KM2EhR/CUe9SvSSTQfrDMdtmJYrbMaszPYwLdHTHZSe8gDqonxUTuSfEkmuVcW+jh1Wwdt60IbTk1o5nYBUQkPpO3OwSe7m2BBPcoDuBJrtdKCpnBMwzXSPOF3CzuP2m7RVFiZEktEJcAPtmnWztuNx6CO8EHrUj08cVz+4/Zq08hm58u3bC5qDHN5+z7Pm29HP8ALUntS9I9PNRdnMsxqLMlpTyomNlTMhI8B2iCFEDzHceiuZtcHujyJXbKRf3Eb/zKrgOT5khXz0EJ81yvPdas/ZkTw/d7vKUGIUGI0eRpO+4Q2gb7JHUknr3knxqfXCpo21pLhK03AtP5JdCl25PIO6WwN+RlB8Up3O58VE+G2266d6Z4Jp9HU1iGNwrYtaeVx9IK33B5lOrJWR6N9q26gjN7I77yFm/SRj7NJrmfsa/9N8t+LWframRnOH4zm9j+4mV2ePdbf2qXgy9uOVadwFAggg7EjcHuJHjWO0900wXT9cteH45FtK5gSJC21LWpYTvsN1kkDqegoNurTNdveQzz9G7j9mcrc6+FxhxLjb5Nvnx2pMSU0pl9l1PMhxtQIUlQPeCCQRQVd8K/whsK+Mk/uqq0uud4nojpVit/j36wYZBh3KMSWH+0cWWyQQSApRAOxPXbpXRKBVSms/vw5p+kE/7Qura65tfNCNI73fpN9umD2+RcJbxfkOlbiQ44TuVFKVBJJPU9Ou53oMNrtnF7094bv5SY62k3JESIw08tHOmP2nIkuEHodt+m/TmI337jGfhZ141OuGs9mx6+X6ZkFtvD5YfYkgKLW6SQ4ggbp5dtyO7l36dxE7bpabZdLM/Zbjb40q2vsll2K62FNrb225Snu2rT9PtHNNMBu7t3xPFItvnupKDILrry0pPeEFxSuQH+rtQca469Grnmdsh53i8Jcy7WpgsTYrSd3H4wJUlSAPdKQSrp3kK6e5AMT9EdYMv0ivUiTYFsvxJWwm2+Uklp7l7j0IKVjc7KHy7jpVqVc7zzRDSzN5jk7IcOguzXDuuVHK4zqz51KaKSs+lW9BG25ccVxXayi3adxWJ5TsHZF0U60k+fkDaSR6OYeuuXYVYNSOJ3VRE6/TJL0BpaROn8nLHgMb79k0n3IUR7lI6knmV4mpe2rhZ0SgSRIOJuS1JO6Uybg+tA/V5wCPQd665YrParFbGrXZLbDtsFkbNx4rKWm0+pKQBQVMak2prG9TMkssNBaZtl4lRmEk78qG3lJT39/QCra2VxbtaULUhD0WYwCUqG6VoWnuPnBBrUr5pHpje7y/ebtgtimXCQvtHn3YiSpxXnV5z59++t1abQ00lppCUNoSEpSkbBIHcAPAUFWnETpTdtKc+lWt+O8uzSXFO2mYQSh5knokq/DTuAod/j3EVv+nPF1qJimNtWS4wrbkKIzYbjSZhWl9KQNgFqSfbgdOpHN5yan1lGO2LKLO7aMitMO6wHeqmJTQWnfwI37iPAjqK49N4TdFZEsvosM+MkncstXJ7k/vEn56CGWVZlqlxDZzb7O8pU+S44RCtkRBbixgfdL23OwA71rJIHjt0rw8ReCRNNtQm8QiO9uqHbYpkP/wC2eWjmcUPMConYeAAFWTaeac4Tp9CXFxDHYdrDgAddQCt50DuCnFErUPQTtXnzHSzTvMLsLtk2I2u5z+zDZkPNe3KR3AkEb7b+NBi+GP4P+EfFDP0V0avNabfBtNsjWy2RGYcKK0lphhlAShtCRsEgDuAFemgUpSgUpSgUpSgUpSgUpSg0PL8SlszF3zG3HGZW5W4y2rYqPiU/xT4/NXisOorzKhGvsYqKTyl5pOygf6yf8NvVXSa1rLcPt98Cn0bRZu3R1I6L/GHj6++szm6Vk49c5Gm1cMzzmn/mfpE/m8LzF1Cxepizm07x3Vd8fb85sxarrbrqz2tvmNPjbchJ9sn1jvHy17a4Rd7Td8dmp8oQ7HWD/m32lHlV+Kof/wBrL2fP75CARJU3ObH+1Gy/7Q/jvULG7XU0Veyzbc0VR129Osf6lXuztVVPtMWuKqZ/OvT5OwUrTrXqJZJOyZiH4Sz3lSedH7R1+atlgXS2zwDCnR39/BDgJHyd4rS42pYmV/Dcifjz8uqjv4ORj/yUTHy8+j2UpSpyKUpSgUpSgUpSgUrzzZ0KEjnmS2I6fO44E/TWt3TP7BE3Sw47NWPBpGyf2nb5t6iZOfjYsb3rkU/3PPy6pNjEv3/46Jn4P3JwWyypz0yU5NfceWVq53unXwGw32r+rwzEWOVL0NKSs7J55KwVHzD21adeNRLvK3RBaagoPiPbr/aenzV5sfxq9ZPKE2c88iMTuqQ8SVLHmTv3+vu+isfVqOm3r3s8LFi7VPfMRt/fOJnz2aOMLNt2+PKyJopj3T6fTds2X4TZI1jlTYLbkZ1hsuABwqSrbwPNvWpaaMqezKER3N861eoIP8SK33U+YmDiK4yVHnkKSync9dh1J/YNvlrDaOWxQEu7OJ2BHYNHz+Kj+789cZuBYq1yxax6Ip22qq25Rynf083WNl3Y0q7cvVTO+8Rv48nRaUpW+ZEpSlApSlApSlApSlApSlApSlApSlApSlApSlApSlApSlApSlApSlApSlApSlApSlApSlApSlApSlApSlApSlApSlApSlApSlApSlApSlApSlApSlB85UdiUwpiSy280sbKQtIIPyVouQ6cxnip6zP+Tr7+xdJKPkPePl3rfqVAztMxc6nhv0b+PfHxS8XOv4lW9qrbw7vJwS8WO62lZTPhOtJ32Dm26D6lDpWOBIO4OxFSLWlK0lK0hSSNiCNwa1664Xj1wJUYQjOH7+OeT5u75qxmZ2KrieLFub+FXrHpDTY3aemeV+jbxj0cnhX+9wwBHuktCR3JLpKf2HpWXjZ9kjO3PJZf2/2jKf8A27Vm7hpk4CVW+6JPmQ+3t/eH+FYOXgWSME8kVqQB4tPJ/jsaqpwtdwuVPHt4TMx/kysIytKyuc8Pxjb5sgzqXdh/OwIS/wAUKT/E16E6nSdvbWhon0PEfwrVHsayBo7Ks80/iNFX0b18/uBff/Jbl/yq/wDCuY1fW6OXFV8afWHs6dpdfPanz+7cDqc/t0s7X/HP+FfF3Uy5H+at0RP4xUr+IrVfuBff/Jbl/wAqv/CvRHxTInzsi0SR+Onk/e2rr9X1y5yiap/qn0h5+naVRzmKfP7snJ1CyJ3fs1xWPybO/wC8TWJmZNf5e4eu0rY94QvkB+RO1ZiHp5kDxHbCLGHj2ju5/u71nrdpnFQQqfcnXfOllAQP2nf+FfWnA1/N5VTVt4ztHlv9Hzqy9Ixv28O/hG/+/dzRa1LUVrUVKPeSdyazdjxO93YpUxEU0yf/ABnvaJ29HifkBrrNpxqx2whUS3tBwdzixzq/ae75Ky9WuF2L58WVc38KfWfRX5Pafltj0fGfSPVqOOYFa7aUvzf9PkDr7dOzaT6E+Py1twAAAA2A7hSlbPEwcfDo4LFMUx+dZ72ayMq9k1cV2reXNc6RLyXMWLHBBKIqdnF/eoKtipR9Q5R6+ldAtMBi2W5iBGTs0ynlHnPnJ9JPWvs0wy04442y2hbh3cUlIBWfOT419KjYWmxYv3cmud6656+6O6I+r75ObN61RZpjammPOe+SlKVZoBSlKBSlKBSlKBSlKBSlKBSlKBSlKBSlKBSlKBSlKBSlKBSlKBSlKBSlKBSlKBSlKBSlKBSlKBSlKBSlKBSlKBSlKBSlKBSlKBSlKBSlKBSlKBSlKBSlKBSlKBSlKBSlKBSlKBSlKBSlKBSlKBSlKBSlKBSlKBSlKBSlKBSlKBSlKBSlKBSlKBSlKBSlKBSlKBSlKBSlKBSlKBSlKBSlKBSlKBSlKBSlKBSlKBSlKBSlKBSlKBSlKD//2QplbmRzdHJlYW0KZW5kb2JqCjYgMCBvYmogPDwvRmlsdGVyL0ZsYXRlRGVjb2RlL0xlbmd0aCAyNTA5Pj5zdHJlYW0KeJylWk1z3DYSvc+vwGWrki2JBgECJH2TLMellC3bkaxs1WYPjERL4yVnbGokR6n9y/sftvFJNIgRqWz5oGm6++H1A7oBcObb6vhiRUlZM3JxvXp9sfq4+raiGeWlIN9XjPwM//lllVPybvXPf1FyDab6N9youBc/5YSxTJCLz6tcP89JwXhW5qQUImPwH/3qh4ujf5DTs8v3p69ekx8vvqhBvpGclRCnQlieMU54pdxLwbKqJlc9ebHubyg52ZKPwEbQvJYk/us4MCIyyUMOoiiznBMAo7mm8KG5ad3Y+2JknlUyiMnn/IXyHP3J9vPcECVkJxJDcElKLki/EqX51OlPOa0yWoDB8Wfjcbv6dbUBcWDqciUK/gviFIwUkqux+pUEeWtnds6kLJMKU3mGn53b7eozjuxXXNRqoryLs114hByNqwAxQr8q8iqTAaKzHUQ8QsxAYWIMwBSwSGSAaW2fZDRGzEFjIgyYG1pndYDpbI8RjxFxUJgYQ803DQCV4aJj9Hj0AI3nMhOlRbOGQWO1UGn56Nj2zgrNF3aRq3VbUKcly3jlzM6aXMisKLVyytmbAPR3/KyfRBiTS9UmPIAzQwDzrJ9EGBO4szHeWjocUlcerJYZZXbmRO3sbrShRVmpjL+1Aw5Kb16bApLSmZ03/foxztbUACgCAMqszgMAY8L0MjniOTME8PMQTosf8imAKAU7kY6Bm1cbEeEZBiFnU/sjYDfartite6gCjlEYVVZVIYax3bjOH/HwD103s+K5boa1TEJEqaSn04uJAS2HkLiajhp2yUBOZ/s2Zf1DNXCQ6X0snBNrj5Ni/KNptQ99S7YS+paMJU2CxOnsm9tRVAxqmYT0TdutiyAdZwdtlk00QUEGJK8xSF4H6Vh/zMQ9DDYVFnatWNgkSJzOnikehcWgnslIH5pPDs0l0MTbwTah/UNNcJDvYCOItd3Izh8x8Q+DTVELGWyK+RxInM6+KQ6FDUENE0S/dw13TMfZwWYnJpqgIACReMU626dj/TET9zDY1EWgyUTYJEiczp4p9iARaNic6XhAG5v9pCElmzPeHpI90W+6xhlv0yiij5rstAOkmyJuzHtakR/X+j/JI6nEmAjOC/WysfjDBjmt2z29DHfVPR0kOPho/6eZ7NE00APrg9pQWLdjb0uU3L42VM8X/5iO8Z9hkhY20ARrhDqILznUlqbVku4gUS/bU7d+ZOv/NJM9wiJNQo1Q8XsmqKNMO0ay+CdtSOJ1Yu0xHeM/wyQt7AgSaRR0EX9Wj9uGMd3J2zqjszpe0n2i5I3tgpw/AkHD9pOax8NGpMLqHe8ck2o19njrMP5RKiH1PlGtmHqcWlh4I5NEoSnbM7H+UToh/T5RaJh+nF5YMx5kUiPWdkHOf5LOSL9P1khIP04vXO4jk3h5Syys88cgiH4/Xd4R/Ti9cLm7m2W8vo1p75LWN7xZjo9q4a9k1oyvoolwvID6RG0Y28Y49xSEozBS1hRwBikAlHI/qS1EGqOhQvN380lhGdvfzo17CsKlEGStc4hUSEFg4fpEZaLEI0RUpz6RRF0q27Gw7imIcTn43O16wFqkIJB8faKwUfIRIipzBzEpa2vbGOeegvCJjLmbRLAWKQgsX5/sC0HyESLqEj6RuCtINKnOPQXhEglyr0VCixQEkq+fthWcfIRotGABAyTtJNy67p2JPQmML/KMv7dRCh4EqTJJO5XCREhZo1Zn7adfoU14pLUYQaL3chqEZrKuaEHiv8PNKocLF2TNSgrgrK5UlDI6b0j9qrjzns42yO6FZxCqcMpMMI9jDJarryVGXGdrHP9Q31Z7Pxizt1dvPwWyNM1cFllh2dnPDicex5Lz6UCbLMuMShvtDKeJ80xrFIQqHJnx3OMYww3rPBEN/9Bq5IW1GsVCJ0Ge0AilmVwKo/p4JEvPJwStq6gyLmy4M5wqzjOtUhCqcMpMehj92Q3q/BAJ/9Bq5IV1bxQjoZMgT2iEkkwuhVF9PBJO0n7xl+f6C77wm7+sFETQUl101Ndb74frdiBn9/3v7fASfzU2Cc4hy7IKo+EzP6RUUpbTQ1nIuihkCJJgANlkFQ9BTjcP2/VV60iQGRZcsiwvQoCcFVXBC3Z4enZ5ePTpkAGdQyEkg3U1w8boUdRMNblRj5Nm186qQQv9EmSMJbn68iJTwy8TIYh1IqiRX5y03fqhHR4NjzlB1IGjQERgTSzjAVubqGRmvgM+v11//bre3JCj6+uhvbubE0AFlzwrahO97rcbcr5r1pu+uWk3C4IlVbcCTfgFoLxbd8P2ESCGtt0tCIdyLcwCOB7WN7c7GP51c7c7IJenrw5gB6vKBSAc2rNJ/+jTorUCparqUA+77rpn6aXjK5FR8dck0/ElU18y/0XVNILQ59X/SziNU0j3JTnWLlW0FRwjJCmhZqCD6JC++RMGfrXt+3a4WjcdOW+HByiBO/Jh90je7q7nSMClUsJ05FlppmM3NNdqOpo7YsFnaRUC+HDQtFIJKZC37UPbEV4eEEY+NMO/FwoLzagCRaTISjM354/Xm/bxgJy138n59n53S35tOsiNUUpnwAQTqqikAJWZ0er+DpLr1s0cDTj9Sl6rQ7AOOz57STiVuazhBs743PoWuhcyfb1U8R93jzMhZi0GIae7ticn7d3VsP66W283M/FcvVBTW6TpIZ82692SCCja2oz3YYAVM7thQAi0xNrM8G8/tH9cddmSIFqp+5AKenN+8duPs/2BwVGv4EKdsm3QspCR3C/Q8GenqVAb//Nkc0HPU85FheKtN/Piubjn6Sdy/aukILGL7a7pFkY9LzNRwJMijJrbZd04z9XCxT2hRbIHqNbKS+gEyV867alEXsFRwPSMN83QrzeEwsGM5jWtDzknD/992H5e78iX+816OxB2QECrDbRc6JjDuu0Olg0ysjpuu649ID83dzAWfHh33zUb0myuyS/N1/vNn9BKz/tm2H1vdle35D/L4KWqCY1OyzdvL3+6PH63oFgDVkefTmoKx5/ZXYzrq24gMv3bspUdDQb3DDa7DIpoRhcGWlEKfcFAx7RXt81w097NaiOzPA8BYGAgIWYzheMVn8TV9Wyi+nd9z46zeUJDrCpbxtt+q/aQ+QwLdXsMQg+Xpij0u484cEGOQv1kbiYw1Yal7jec+kPLxfuLo7cvl/U4FVaLvYuHJ+4oEs4lcN0QwnUe8ho2v/s7uF6Q8/vfd3GDTWCwXB8oGHRMUS4sE0b1Dy8ZHAyE3FuTicFUiur9SEB4IU3O9C/HnkWTQ1EWRUwTYObGgtOsigtY6nmcPQTXWVHp4eoyMZz6We/H1f8AbEsD7wplbmRzdHJlYW0KZW5kb2JqCjEgMCBvYmo8PC9Db250ZW50cyA2IDAgUi9UeXBlL1BhZ2UvUmVzb3VyY2VzPDwvUHJvY1NldCBbL1BERiAvVGV4dCAvSW1hZ2VCIC9JbWFnZUMgL0ltYWdlSV0vRm9udDw8L0YxIDIgMCBSL0YyIDQgMCBSL0YzIDUgMCBSPj4vWE9iamVjdDw8L2ltZzAgMyAwIFI+Pj4+L1BhcmVudCA3IDAgUi9NZWRpYUJveFswIDAgNjEyIDc5Ml0+PgplbmRvYmoKMiAwIG9iajw8L1N1YnR5cGUvVHlwZTEvVHlwZS9Gb250L0Jhc2VGb250L0hlbHZldGljYS1Cb2xkL0VuY29kaW5nL1dpbkFuc2lFbmNvZGluZz4+CmVuZG9iago0IDAgb2JqPDwvU3VidHlwZS9UeXBlMS9UeXBlL0ZvbnQvQmFzZUZvbnQvSGVsdmV0aWNhL0VuY29kaW5nL1dpbkFuc2lFbmNvZGluZz4+CmVuZG9iago1IDAgb2JqPDwvU3VidHlwZS9UeXBlMS9UeXBlL0ZvbnQvQmFzZUZvbnQvSGVsdmV0aWNhLUJvbGRPYmxpcXVlL0VuY29kaW5nL1dpbkFuc2lFbmNvZGluZz4+CmVuZG9iago3IDAgb2JqPDwvS2lkc1sxIDAgUl0vVHlwZS9QYWdlcy9Db3VudCAxPj4KZW5kb2JqCjggMCBvYmo8PC9UeXBlL0NhdGFsb2cvUGFnZXMgNyAwIFI+PgplbmRvYmoKOSAwIG9iajw8L01vZERhdGUoRDoyMDIxMDIyMDE1NDUzOFopL0NyZWF0aW9uRGF0ZShEOjIwMjEwMjIwMTU0NTM4WikvUHJvZHVjZXIoaVRleHQgMi4wLjggXChieSBsb3dhZ2llLmNvbVwpKT4+CmVuZG9iagp4cmVmCjAgMTAKMDAwMDAwMDAwMCA2NTUzNSBmIAowMDAwMDE2NDQ0IDAwMDAwIG4gCjAwMDAwMTY2NDEgMDAwMDAgbiAKMDAwMDAwMDAxNSAwMDAwMCBuIAowMDAwMDE2NzMzIDAwMDAwIG4gCjAwMDAwMTY4MjAgMDAwMDAgbiAKMDAwMDAxMzg2NyAwMDAwMCBuIAowMDAwMDE2OTE5IDAwMDAwIG4gCjAwMDAwMTY5NjkgMDAwMDAgbiAKMDAwMDAxNzAxMyAwMDAwMCBuIAp0cmFpbGVyCjw8L0luZm8gOSAwIFIvSUQgWzw3NWJjZDFmNmQ1MDA5Nzc2N2E2NTAwOTI3OGEzZWM2ND48YjE4OGU3ODdlZDExMzg1ZjJlMWE2MThkZDIwMTBkYzM+XS9Sb290IDggMCBSL1NpemUgMTA+PgpzdGFydHhyZWYKMTcxMzIKJSVFT0YK"}'
              }
            }
            schemaId: '63998a47b8f67a14dc5e2a3c'
            typeName: 'result_string'
          }
        ]
        headers: []
      }
      {
        statusCode: 400
        description: 'When request is not valid'
        representations: [
          {
            contentType: 'application/json'
            examples: {
              'Unsuccessful Response body': {
                value: '{"success":false,"errorMessage":"Invalid request payload","output":null}'
              }
            }
            schemaId: '63998a47b8f67a14dc5e2a3c'
            typeName: 'result_string'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_referrals_internal_post_sendreferralevent 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_referrals_internal
  name: 'post-sendreferralevent'
  properties: {
    displayName: 'SendReferralEvent'
    method: 'POST'
    urlTemplate: '/api/ReferralEvent'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_referrals_public_post_a_createreferral 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_referrals_public
  name: 'post-a-createreferral'
  properties: {
    displayName: 'A_CreateReferral'
    method: 'POST'
    urlTemplate: '/api/Referral'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_sharepoint_management_63cf608a4ea4fbdb8b7f0f65 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_sharepoint_management
  name: '63cf608a4ea4fbdb8b7f0f65'
  properties: {
    displayName: 'upload-document'
    method: 'POST'
    urlTemplate: '/upload-document'
    templateParameters: []
    description: 'Trigger a run of the logic app.'
    request: {
      description: 'The request body.'
      queryParameters: []
      headers: []
      representations: [
        {
          contentType: 'application/json'
          examples: {
            default: {
              value: {}
            }
          }
          schemaId: '63cf5c94277a971124f7b03c'
          typeName: 'request-request'
        }
      ]
    }
    responses: [
      {
        statusCode: 200
        description: 'The Logic App Response for action with status code \'200\'.'
        representations: [
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: {}
              }
            }
            schemaId: '63cf5c94277a971124f7b03c'
            typeName: 'response-200'
          }
        ]
        headers: []
      }
      {
        statusCode: 500
        description: 'The Logic App Response.'
        representations: [
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: {}
              }
            }
            schemaId: '63cf5c94277a971124f7b03c'
            typeName: 'RequestPathsInvokePost500ApplicationJsonResponse'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_sharepoint_management_request_invoke 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_sharepoint_management
  name: 'request-invoke'
  properties: {
    displayName: 'download-document'
    method: 'POST'
    urlTemplate: '/download-document'
    templateParameters: []
    description: 'Trigger a run of the logic app.'
    request: {
      description: 'The request body.'
      queryParameters: []
      headers: []
      representations: [
        {
          contentType: 'application/json'
          examples: {
            default: {
              value: {}
            }
          }
          schemaId: '63cf5c94277a971124f7b03c'
          typeName: 'request-request'
        }
      ]
    }
    responses: [
      {
        statusCode: 200
        description: 'The Logic App Response for action with status code \'200\'.'
        representations: [
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: {}
              }
            }
            schemaId: '63cf5c94277a971124f7b03c'
            typeName: 'response-200'
          }
        ]
        headers: []
      }
      {
        statusCode: 500
        description: 'The Logic App Response.'
        representations: [
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: {}
              }
            }
            schemaId: '63cf5c94277a971124f7b03c'
            typeName: 'RequestPathsInvokePost500ApplicationJsonResponse'
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    apim
  ]
}

resource apim_wordtemplate_get_getdocumentbyblobidandcontainer 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_wordtemplate
  name: 'get-getdocumentbyblobidandcontainer'
  properties: {
    displayName: 'GetDocumentByBlobIdAndContainer'
    method: 'GET'
    urlTemplate: '/documents/{blobId}'
    templateParameters: [
      {
        name: 'blobId'
        required: true
        values: []
        type: null
      }
    ]
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_wordtemplate_post_createdocumentfromtemplate 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_wordtemplate
  name: 'post-createdocumentfromtemplate'
  properties: {
    displayName: 'CreateDocumentFromTemplate'
    method: 'POST'
    urlTemplate: '/documents'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_wordtemplate_put_putdocumentbyidandcontainer 'Microsoft.ApiManagement/service/apis/operations@2022-09-01-preview' = {
  parent: apim_wordtemplate
  name: 'put-putdocumentbyidandcontainer'
  properties: {
    displayName: 'PutDocumentByIdAndContainer'
    method: 'PUT'
    urlTemplate: '/documents/{blobId}'
    templateParameters: [
      {
        name: 'blobId'
        required: true
        values: []
        type: null
      }
    ]
    responses: []
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_policy 'Microsoft.ApiManagement/service/apis/policies@2022-09-01-preview' = {
  parent: apim_caseapi
  name: 'policy'
  properties: {
    value: '<!--\r\n    IMPORTANT:\r\n    - Policy elements can appear only within the <inbound>, <outbound>, <backend> section elements.\r\n    - To apply a policy to the incoming request (before it is forwarded to the backend service), place a corresponding policy element within the <inbound> section element.\r\n    - To apply a policy to the outgoing response (before it is sent back to the caller), place a corresponding policy element within the <outbound> section element.\r\n    - To add a policy, place the cursor at the desired insertion point and select a policy from the sidebar.\r\n    - To remove a policy, delete the corresponding policy statement from the policy document.\r\n    - Position the <base> element within a section element to inherit all policies from the corresponding section element in the enclosing scope.\r\n    - Remove the <base> element to prevent inheriting policies from the corresponding section element in the enclosing scope.\r\n    - Policies are applied in the order of their appearance, from the top down.\r\n    - Comments within policy elements are not supported and may disappear. Place your comments between policy elements or at a higher level scope.\r\n-->\r\n<policies>\r\n  <inbound>\r\n    <base />\r\n    <validate-jwt header-name="Authorization" failed-validation-httpcode="401" failed-validation-error-message="Unauthorized" require-expiration-time="true" require-scheme="Bearer" require-signed-tokens="true" output-token-variable-name="jwt">\r\n      <openid-config url="https://login.microsoftonline.com/apm.net.au/v2.0/.well-known/openid-configuration" />\r\n      <required-claims>\r\n        <claim name="aud">\r\n          <value>9fa9c3bb-06b2-4626-904c-2ee57c029171</value>\r\n        </claim>\r\n      </required-claims>\r\n    </validate-jwt>\r\n    <set-header name="apmtoken-preferred_username" exists-action="override">\r\n      <value>@{return ((Jwt)context.Variables["jwt"]).Claims.GetValueOrDefault("preferred_username", ""); }</value>\r\n    </set-header>\r\n    <set-header name="apmtoken-roles" exists-action="override">\r\n      <value>@{return ((Jwt)context.Variables["jwt"]).Claims.GetValueOrDefault("roles", ""); }</value>\r\n    </set-header>\r\n    <set-header name="apmtoken-name" exists-action="override">\r\n      <value>@{return ((Jwt)context.Variables["jwt"]).Claims.GetValueOrDefault("name", ""); }</value>\r\n    </set-header>\r\n    <cache-lookup-value key="apitoken" variable-name="caseAPIAdToken" />\r\n    <choose>\r\n      <when condition="@(!context.Variables.ContainsKey(&quot;caseAPIAdToken&quot;))">\r\n        <send-request ignore-error="true" timeout="20" response-variable-name="bearerToken" mode="new">\r\n          <set-url>{{authorizationServer}}</set-url>\r\n          <set-method>POST</set-method>\r\n          <set-header name="Content-Type" exists-action="override">\r\n            <value>application/x-www-form-urlencoded</value>\r\n          </set-header>\r\n          <set-body>@{\r\n                    return "client_id={{clientId}}&amp;scope={{scope}}&amp;client_secret={{clientSecret}}&amp;grant_type=client_credentials";\r\n\r\n                    // For identity providers other than Azure AD, try return statement below\r\n                    // return "client_id={{clientId}}&amp;scope={{scope}}&amp;client_secret={{clientSecret}}&amp;grant_type=client_credentials";\r\n                }</set-body>\r\n        </send-request>\r\n        <cache-store-value key="apitoken" value="@(&quot;Bearer &quot; + (String)((IResponse)context.Variables[&quot;bearerToken&quot;]).Body.As&lt;JObject&gt;()[&quot;access_token&quot;])" duration="2400" />\r\n        <cache-lookup-value key="apitoken" variable-name="caseAPIAdToken" />\r\n      </when>\r\n    </choose>\r\n    <set-header name="Authorization" exists-action="override">\r\n      <value>@((String)context.Variables["caseAPIAdToken"])</value>\r\n    </set-header>\r\n    <set-backend-service base-url="https://mobileatlas.apm.net.au" />\r\n    <cors allow-credentials="true">\r\n      <allowed-origins>\r\n        <origin>https://mobileatlas.apm.net.au</origin>\r\n      </allowed-origins>\r\n      <allowed-methods>\r\n        <method>*</method>\r\n      </allowed-methods>\r\n      <allowed-headers>\r\n        <header>*</header>\r\n      </allowed-headers>\r\n      <expose-headers>\r\n        <header>*</header>\r\n      </expose-headers>\r\n    </cors>\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim
  ]
}

resource apim_case_sharepoint_integration_policy 'Microsoft.ApiManagement/service/apis/policies@2022-09-01-preview' = {
  parent: apim_case_sharepoint_integration
  name: 'policy'
  properties: {
    value: '<!--\r\n    IMPORTANT:\r\n    - Policy elements can appear only within the <inbound>, <outbound>, <backend> section elements.\r\n    - To apply a policy to the incoming request (before it is forwarded to the backend service), place a corresponding policy element within the <inbound> section element.\r\n    - To apply a policy to the outgoing response (before it is sent back to the caller), place a corresponding policy element within the <outbound> section element.\r\n    - To add a policy, place the cursor at the desired insertion point and select a policy from the sidebar.\r\n    - To remove a policy, delete the corresponding policy statement from the policy document.\r\n    - Position the <base> element within a section element to inherit all policies from the corresponding section element in the enclosing scope.\r\n    - Remove the <base> element to prevent inheriting policies from the corresponding section element in the enclosing scope.\r\n    - Policies are applied in the order of their appearance, from the top down.\r\n    - Comments within policy elements are not supported and may disappear. Place your comments between policy elements or at a higher level scope.\r\n-->\r\n<policies>\r\n  <inbound>\r\n    <base />\r\n    <cors allow-credentials="true">\r\n      <allowed-origins>\r\n        <origin>https://mobileatlas.apm.net.au</origin>\r\n      </allowed-origins>\r\n      <allowed-methods>\r\n        <method>*</method>\r\n      </allowed-methods>\r\n      <allowed-headers>\r\n        <header>*</header>\r\n      </allowed-headers>\r\n      <expose-headers>\r\n        <header>*</header>\r\n      </expose-headers>\r\n    </cors>\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim
  ]
}

resource apim_la_html_pdf_template_policy 'Microsoft.ApiManagement/service/apis/policies@2022-09-01-preview' = {
  parent: apim_la_html_pdf_template
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="LogicApp_la-html-pdf-template_rg-echo-prod-001_ac28092fe0a345b1a9cbe0f5165a72eb" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim
  ]
}

resource apim_pat_policy 'Microsoft.ApiManagement/service/apis/policies@2022-09-01-preview' = {
  parent: apim_pat
  name: 'policy'
  properties: {
    value: '<!--\r\n    IMPORTANT:\r\n    - Policy elements can appear only within the <inbound>, <outbound>, <backend> section elements.\r\n    - To apply a policy to the incoming request (before it is forwarded to the backend service), place a corresponding policy element within the <inbound> section element.\r\n    - To apply a policy to the outgoing response (before it is sent back to the caller), place a corresponding policy element within the <outbound> section element.\r\n    - To add a policy, place the cursor at the desired insertion point and select a policy from the sidebar.\r\n    - To remove a policy, delete the corresponding policy statement from the policy document.\r\n    - Position the <base> element within a section element to inherit all policies from the corresponding section element in the enclosing scope.\r\n    - Remove the <base> element to prevent inheriting policies from the corresponding section element in the enclosing scope.\r\n    - Policies are applied in the order of their appearance, from the top down.\r\n    - Comments within policy elements are not supported and may disappear. Place your comments between policy elements or at a higher level scope.\r\n-->\r\n<policies>\r\n  <inbound>\r\n    <base />\r\n    <validate-jwt header-name="Authorization" failed-validation-httpcode="401" failed-validation-error-message="Unauthorized" require-expiration-time="true" require-scheme="Bearer" require-signed-tokens="true" output-token-variable-name="jwt">\r\n      <openid-config url="https://login.microsoftonline.com/apm.net.au/v2.0/.well-known/openid-configuration" />\r\n      <required-claims>\r\n        <claim name="aud">\r\n          <value>a95293b7-9f91-4378-9ca8-c85934beb3d4</value>\r\n        </claim>\r\n        <claim name="roles" match="any">\r\n          <value>qbs</value>\r\n          <value>teamlead</value>\r\n          <value>coordinator</value>\r\n          <value>admin</value>\r\n          <value>booking-officer</value>\r\n          <value>service-area-manager</value>\r\n          <value>trainer</value>\r\n          <value>local-admin</value>\r\n        </claim>\r\n      </required-claims>\r\n    </validate-jwt>\r\n    <set-header name="apmtoken-preferred_username" exists-action="override">\r\n      <value>@{return ((Jwt)context.Variables["jwt"]).Claims.GetValueOrDefault("preferred_username", "").ToLower(); }</value>\r\n    </set-header>\r\n    <set-header name="apmtoken-roles" exists-action="override">\r\n      <value>@{return ((Jwt)context.Variables["jwt"]).Claims.GetValueOrDefault("roles", ""); }</value>\r\n    </set-header>\r\n    <set-header name="apmtoken-name" exists-action="override">\r\n      <value>@{return ((Jwt)context.Variables["jwt"]).Claims.GetValueOrDefault("name", ""); }</value>\r\n    </set-header>\r\n    <set-header name="apmtoken-subject" exists-action="override">\r\n      <value>@{return ((Jwt)context.Variables["jwt"]).Claims.GetValueOrDefault("sub", ""); }</value>\r\n    </set-header>\r\n    <cors>\r\n      <allowed-origins>\r\n        <origin>*</origin>\r\n      </allowed-origins>\r\n      <allowed-methods>\r\n        <method>GET</method>\r\n        <method>POST</method>\r\n        <method>PATCH</method>\r\n        <method>PUT</method>\r\n        <method>DELETE</method>\r\n      </allowed-methods>\r\n      <allowed-headers>\r\n        <header>*</header>\r\n      </allowed-headers>\r\n      <expose-headers>\r\n        <header>*</header>\r\n      </expose-headers>\r\n    </cors>\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim
  ]
}

resource apim_sharepoint_management_policy 'Microsoft.ApiManagement/service/apis/policies@2022-09-01-preview' = {
  parent: apim_sharepoint_management
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="LogicApp_la-sharepoint-management-download-do_da91f2ae1dc410600a1240209e9d0b47" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim
  ]
}

resource apim_caseapi_6079449db8f67a1144c3d201 'Microsoft.ApiManagement/service/apis/schemas@2022-09-01-preview' = {
  parent: apim_caseapi
  name: '6079449db8f67a1144c3d201'
  properties: {
    contentType: 'application/vnd.oai.openapi.components+json'
    document: {}
  }
  dependsOn: [

    apim
  ]
}

resource apim_echo_azurestorage_62f322f9b8f67a0c04ab60a8 'Microsoft.ApiManagement/service/apis/schemas@2022-09-01-preview' = {
  parent: apim_echo_azurestorage
  name: '62f322f9b8f67a0c04ab60a8'
  properties: {
    contentType: 'application/vnd.oai.openapi.components+json'
    document: {}
  }
  dependsOn: [

    apim
  ]
}

resource apim_echo_la_populate_echo_template_62f329c5b8f67a0c04ab60ca 'Microsoft.ApiManagement/service/apis/schemas@2022-09-01-preview' = {
  parent: apim_echo_la_populate_echo_template
  name: '62f329c5b8f67a0c04ab60ca'
  properties: {
    contentType: 'application/vnd.oai.openapi.components+json'
    document: {}
  }
  dependsOn: [

    apim
  ]
}

resource apim_la_html_pdf_template_63401416b8f67a05ccd70930 'Microsoft.ApiManagement/service/apis/schemas@2022-09-01-preview' = {
  parent: apim_la_html_pdf_template
  name: '63401416b8f67a05ccd70930'
  properties: {
    contentType: 'application/vnd.ms-azure-apim.swagger.definitions+json'
    document: {}
  }
  dependsOn: [

    apim
  ]
}

resource apim_pdf_merge_63998a47b8f67a14dc5e2a3c 'Microsoft.ApiManagement/service/apis/schemas@2022-09-01-preview' = {
  parent: apim_pdf_merge
  name: '63998a47b8f67a14dc5e2a3c'
  properties: {
    contentType: 'application/vnd.oai.openapi.components+json'
    document: {}
  }
  dependsOn: [

    apim
  ]
}

resource apim_sharepoint_management_63cf5c94277a971124f7b03c 'Microsoft.ApiManagement/service/apis/schemas@2022-09-01-preview' = {
  parent: apim_sharepoint_management
  name: '63cf5c94277a971124f7b03c'
  properties: {
    contentType: 'application/vnd.ms-azure-apim.swagger.definitions+json'
    document: {}
  }
  dependsOn: [

    apim
  ]
}

resource apim_echo_azurestorage_echo 'Microsoft.ApiManagement/service/apis/tags@2022-09-01-preview' = {
  parent: apim_echo_azurestorage
  name: 'echo'
  dependsOn: [

    apim
  ]
}

resource apim_echo_la_populate_echo_template_echo 'Microsoft.ApiManagement/service/apis/tags@2022-09-01-preview' = {
  parent: apim_echo_la_populate_echo_template
  name: 'echo'
  dependsOn: [

    apim
  ]
}

resource apim_applicationinsights 'Microsoft.ApiManagement/service/diagnostics@2022-09-01-preview' = {
  parent: apim
  name: 'applicationinsights'
  properties: {
    alwaysLog: 'allErrors'
    httpCorrelationProtocol: 'Legacy'
    logClientIp: true
    loggerId: apim_ai_atlas_prod_001.id
    sampling: {
      samplingType: 'fixed'
      percentage: 100
    }
  }
}

resource Microsoft_ApiManagement_service_diagnostics_apim_azuremonitor 'Microsoft.ApiManagement/service/diagnostics@2022-09-01-preview' = {
  parent: apim
  name: 'azuremonitor'
  properties: {
    logClientIp: true
    loggerId: apim_azuremonitor.id
    sampling: {
      samplingType: 'fixed'
      percentage: 100
    }
  }
}

resource apim_applicationinsights_ai_atlas_prod_001 'Microsoft.ApiManagement/service/diagnostics/loggers@2018-01-01' = {
  parent: apim_applicationinsights
  name: 'ai-atlas-prod-001'
  dependsOn: [

    apim
  ]
}

resource apim_azuremonitor_azuremonitor 'Microsoft.ApiManagement/service/diagnostics/loggers@2018-01-01' = {
  parent: Microsoft_ApiManagement_service_diagnostics_apim_azuremonitor
  name: 'azuremonitor'
  dependsOn: [

    apim
  ]
}

resource apim_administrators_1 'Microsoft.ApiManagement/service/groups/users@2022-09-01-preview' = {
  parent: apim_administrators
  name: '1'
  dependsOn: [

    apim
  ]
}

resource apim_developers_1 'Microsoft.ApiManagement/service/groups/users@2022-09-01-preview' = {
  parent: apim_developers
  name: '1'
  dependsOn: [

    apim
  ]
}

resource apim_corporate_info_and_apps_shared_apis_pdf_merge 'Microsoft.ApiManagement/service/products/apis@2022-09-01-preview' = {
  parent: apim_corporate_info_and_apps_shared_apis
  name: 'pdf-merge'
  dependsOn: [

    apim
  ]
}

resource apim_sherpa_sharepoint_management 'Microsoft.ApiManagement/service/products/apis@2022-09-01-preview' = {
  parent: apim_sherpa
  name: 'sharepoint-management'
  dependsOn: [

    apim
  ]
}

resource apim_corporate_info_and_apps_shared_apis_administrators 'Microsoft.ApiManagement/service/products/groups@2022-09-01-preview' = {
  parent: apim_corporate_info_and_apps_shared_apis
  name: 'administrators'
  dependsOn: [

    apim
  ]
}

resource apim_sherpa_administrators 'Microsoft.ApiManagement/service/products/groups@2022-09-01-preview' = {
  parent: apim_sherpa
  name: 'administrators'
  dependsOn: [

    apim
  ]
}

resource apim_sherpa_developers 'Microsoft.ApiManagement/service/products/groups@2022-09-01-preview' = {
  parent: apim_sherpa
  name: 'developers'
  dependsOn: [

    apim
  ]
}

resource apim_sherpa_guests 'Microsoft.ApiManagement/service/products/groups@2022-09-01-preview' = {
  parent: apim_sherpa
  name: 'guests'
  dependsOn: [

    apim
  ]
}

resource apim_starter_administrators 'Microsoft.ApiManagement/service/products/groups@2022-09-01-preview' = {
  parent: apim_starter
  name: 'administrators'
  dependsOn: [

    apim
  ]
}

resource apim_starter_developers 'Microsoft.ApiManagement/service/products/groups@2022-09-01-preview' = {
  parent: apim_starter
  name: 'developers'
  dependsOn: [

    apim
  ]
}

resource apim_starter_guests 'Microsoft.ApiManagement/service/products/groups@2022-09-01-preview' = {
  parent: apim_starter
  name: 'guests'
  dependsOn: [

    apim
  ]
}

resource apim_unlimited_administrators 'Microsoft.ApiManagement/service/products/groups@2022-09-01-preview' = {
  parent: apim_unlimited
  name: 'administrators'
  dependsOn: [

    apim
  ]
}

resource apim_unlimited_developers 'Microsoft.ApiManagement/service/products/groups@2022-09-01-preview' = {
  parent: apim_unlimited
  name: 'developers'
  dependsOn: [

    apim
  ]
}

resource apim_unlimited_guests 'Microsoft.ApiManagement/service/products/groups@2022-09-01-preview' = {
  parent: apim_unlimited
  name: 'guests'
  dependsOn: [

    apim
  ]
}

resource apim_starter_policy 'Microsoft.ApiManagement/service/products/policies@2022-09-01-preview' = {
  parent: apim_starter
  name: 'policy'
  properties: {
    value: '<!--\r\n            IMPORTANT:\r\n            - Policy elements can appear only within the <inbound>, <outbound>, <backend> section elements.\r\n            - Only the <forward-request> policy element can appear within the <backend> section element.\r\n            - To apply a policy to the incoming request (before it is forwarded to the backend service), place a corresponding policy element within the <inbound> section element.\r\n            - To apply a policy to the outgoing response (before it is sent back to the caller), place a corresponding policy element within the <outbound> section element.\r\n            - To add a policy position the cursor at the desired insertion point and click on the round button associated with the policy.\r\n            - To remove a policy, delete the corresponding policy statement from the policy document.\r\n            - Position the <base> element within a section element to inherit all policies from the corresponding section element in the enclosing scope.\r\n            - Remove the <base> element to prevent inheriting policies from the corresponding section element in the enclosing scope.\r\n            - Policies are applied in the order of their appearance, from the top down.\r\n        -->\r\n<policies>\r\n  <inbound>\r\n    <rate-limit calls="5" renewal-period="60" />\r\n    <quota calls="100" renewal-period="604800" />\r\n    <base />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim
  ]
}

resource Microsoft_ApiManagement_service_subscriptions_apim_EmailAPI 'Microsoft.ApiManagement/service/subscriptions@2022-09-01-preview' = {
  parent: apim
  name: 'EmailAPI'
  properties: {
    scope: apim_emailapi.id
    displayName: 'EmailAPI'
    state: 'active'
    allowTracing: false
  }
}

resource apim_EncompassCare 'Microsoft.ApiManagement/service/subscriptions@2022-09-01-preview' = {
  parent: apim
  name: 'EncompassCare'
  properties: {
    scope: apim_corporate_info_and_apps_shared_apis.id
    displayName: 'EncompassCare'
    state: 'active'
    allowTracing: false
  }
}

resource apim_Konektiva 'Microsoft.ApiManagement/service/subscriptions@2022-09-01-preview' = {
  parent: apim
  name: 'Konektiva'
  properties: {
    scope: apim_corporate_info_and_apps_shared_apis.id
    displayName: 'Konektiva'
    state: 'active'
    allowTracing: false
  }
}

resource apim_pat_applicationinsights 'Microsoft.ApiManagement/service/apis/diagnostics@2022-09-01-preview' = {
  parent: apim_pat
  name: 'applicationinsights'
  properties: {
    alwaysLog: 'allErrors'
    httpCorrelationProtocol: 'Legacy'
    logClientIp: true
    loggerId: apim_ai_pat_prod_001.id
    sampling: {
      samplingType: 'fixed'
      percentage: 100
    }
  }
  dependsOn: [

    apim

  ]
}

resource apim_sharepoint_management_applicationinsights 'Microsoft.ApiManagement/service/apis/diagnostics@2022-09-01-preview' = {
  parent: apim_sharepoint_management
  name: 'applicationinsights'
  properties: {
    alwaysLog: 'allErrors'
    httpCorrelationProtocol: 'Legacy'
    verbosity: 'information'
    logClientIp: true
    loggerId: apim_appi_apim.id
    sampling: {
      samplingType: 'fixed'
      percentage: 100
    }
    frontend: {
      request: {
        headers: []
        body: {
          bytes: 0
        }
      }
      response: {
        headers: []
        body: {
          bytes: 0
        }
      }
    }
    backend: {
      request: {
        headers: []
        body: {
          bytes: 0
        }
      }
      response: {
        headers: []
        body: {
          bytes: 0
        }
      }
    }
  }
  dependsOn: [

    apim

  ]
}

resource apim_pat_applicationinsights_ai_pat_prod_001 'Microsoft.ApiManagement/service/apis/diagnostics/loggers@2018-01-01' = {
  parent: apim_pat_applicationinsights
  name: 'ai-pat-prod-001'
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_sharepoint_management_applicationinsights_appi_apim 'Microsoft.ApiManagement/service/apis/diagnostics/loggers@2018-01-01' = {
  parent: apim_sharepoint_management_applicationinsights
  name: 'appi-apim-apm-prod'
  dependsOn: [

    apim_sharepoint_management
    apim
  ]
}

resource apim_azfun_atlasdocs_prod_001_get_apmiqdocdata_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_azfun_atlasdocs_prod_001_get_apmiqdocdata
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-atlasdocs-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_azfun_atlasdocs_prod_001
    apim
  ]
}

resource apim_azfun_atlasdocs_prod_001_get_casesearchsharepointgetdocumenttitles_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_azfun_atlasdocs_prod_001_get_casesearchsharepointgetdocumenttitles
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-atlasdocs-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_azfun_atlasdocs_prod_001
    apim
  ]
}

resource apim_azfun_atlasdocs_prod_001_get_getchartimages_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_azfun_atlasdocs_prod_001_get_getchartimages
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-atlasdocs-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_azfun_atlasdocs_prod_001
    apim
  ]
}

resource apim_azfun_atlasdocs_prod_001_get_lifeindexquestionnaire_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_azfun_atlasdocs_prod_001_get_lifeindexquestionnaire
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-atlasdocs-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_azfun_atlasdocs_prod_001
    apim
  ]
}

resource apim_azfun_atlasdocs_prod_001_options_casesearchsharepointgetdocumenttitles_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_azfun_atlasdocs_prod_001_options_casesearchsharepointgetdocumenttitles
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-atlasdocs-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_azfun_atlasdocs_prod_001
    apim
  ]
}

resource apim_azfun_atlasdocs_prod_001_options_getchartimages_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_azfun_atlasdocs_prod_001_options_getchartimages
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-atlasdocs-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_azfun_atlasdocs_prod_001
    apim
  ]
}

resource apim_caseapi_63b7c6384869c8d036d34940_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_caseapi_63b7c6384869c8d036d34940
  name: 'policy'
  properties: {
    value: '<!--\r\n    IMPORTANT:\r\n    - Policy elements can appear only within the <inbound>, <outbound>, <backend> section elements.\r\n    - To apply a policy to the incoming request (before it is forwarded to the backend service), place a corresponding policy element within the <inbound> section element.\r\n    - To apply a policy to the outgoing response (before it is sent back to the caller), place a corresponding policy element within the <outbound> section element.\r\n    - To add a policy, place the cursor at the desired insertion point and select a policy from the sidebar.\r\n    - To remove a policy, delete the corresponding policy statement from the policy document.\r\n    - Position the <base> element within a section element to inherit all policies from the corresponding section element in the enclosing scope.\r\n    - Remove the <base> element to prevent inheriting policies from the corresponding section element in the enclosing scope.\r\n    - Policies are applied in the order of their appearance, from the top down.\r\n    - Comments within policy elements are not supported and may disappear. Place your comments between policy elements or at a higher level scope.\r\n-->\r\n<policies>\r\n  <inbound>\r\n    <base />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_atlascasesearch_doesuserhaveaccess_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_atlascasesearch_doesuserhaveaccess
  name: 'policy'
  properties: {
    value: '<!--\r\n    IMPORTANT:\r\n    - Policy elements can appear only within the <inbound>, <outbound>, <backend> section elements.\r\n    - To apply a policy to the incoming request (before it is forwarded to the backend service), place a corresponding policy element within the <inbound> section element.\r\n    - To apply a policy to the outgoing response (before it is sent back to the caller), place a corresponding policy element within the <outbound> section element.\r\n    - To add a policy, place the cursor at the desired insertion point and select a policy from the sidebar.\r\n    - To remove a policy, delete the corresponding policy statement from the policy document.\r\n    - Position the <base> element within a section element to inherit all policies from the corresponding section element in the enclosing scope.\r\n    - Remove the <base> element to prevent inheriting policies from the corresponding section element in the enclosing scope.\r\n    - Policies are applied in the order of their appearance, from the top down.\r\n    - Comments within policy elements are not supported and may disappear. Place your comments between policy elements or at a higher level scope.\r\n-->\r\n<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service base-url="https://mobileatlas.apm.net.au" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_atlascasesearch_getcasedatedetails_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_atlascasesearch_getcasedatedetails
  name: 'policy'
  properties: {
    value: '<!--\r\n    IMPORTANT:\r\n    - Policy elements can appear only within the <inbound>, <outbound>, <backend> section elements.\r\n    - To apply a policy to the incoming request (before it is forwarded to the backend service), place a corresponding policy element within the <inbound> section element.\r\n    - To apply a policy to the outgoing response (before it is sent back to the caller), place a corresponding policy element within the <outbound> section element.\r\n    - To add a policy, place the cursor at the desired insertion point and select a policy from the sidebar.\r\n    - To remove a policy, delete the corresponding policy statement from the policy document.\r\n    - Position the <base> element within a section element to inherit all policies from the corresponding section element in the enclosing scope.\r\n    - Remove the <base> element to prevent inheriting policies from the corresponding section element in the enclosing scope.\r\n    - Policies are applied in the order of their appearance, from the top down.\r\n    - Comments within policy elements are not supported and may disappear. Place your comments between policy elements or at a higher level scope.\r\n-->\r\n<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service base-url="https://mobileatlas.apm.net.au" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_atlascasesearch_getcasedatestatus_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_atlascasesearch_getcasedatestatus
  name: 'policy'
  properties: {
    value: '<!--\r\n    IMPORTANT:\r\n    - Policy elements can appear only within the <inbound>, <outbound>, <backend> section elements.\r\n    - To apply a policy to the incoming request (before it is forwarded to the backend service), place a corresponding policy element within the <inbound> section element.\r\n    - To apply a policy to the outgoing response (before it is sent back to the caller), place a corresponding policy element within the <outbound> section element.\r\n    - To add a policy, place the cursor at the desired insertion point and select a policy from the sidebar.\r\n    - To remove a policy, delete the corresponding policy statement from the policy document.\r\n    - Position the <base> element within a section element to inherit all policies from the corresponding section element in the enclosing scope.\r\n    - Remove the <base> element to prevent inheriting policies from the corresponding section element in the enclosing scope.\r\n    - Policies are applied in the order of their appearance, from the top down.\r\n    - Comments within policy elements are not supported and may disappear. Place your comments between policy elements or at a higher level scope.\r\n-->\r\n<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service base-url="https://mobileatlas.apm.net.au" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_atlascasesearch_getriskynote_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_atlascasesearch_getriskynote
  name: 'policy'
  properties: {
    value: '<!--\r\n    IMPORTANT:\r\n    - Policy elements can appear only within the <inbound>, <outbound>, <backend> section elements.\r\n    - To apply a policy to the incoming request (before it is forwarded to the backend service), place a corresponding policy element within the <inbound> section element.\r\n    - To apply a policy to the outgoing response (before it is sent back to the caller), place a corresponding policy element within the <outbound> section element.\r\n    - To add a policy, place the cursor at the desired insertion point and select a policy from the sidebar.\r\n    - To remove a policy, delete the corresponding policy statement from the policy document.\r\n    - Position the <base> element within a section element to inherit all policies from the corresponding section element in the enclosing scope.\r\n    - Remove the <base> element to prevent inheriting policies from the corresponding section element in the enclosing scope.\r\n    - Policies are applied in the order of their appearance, from the top down.\r\n    - Comments within policy elements are not supported and may disappear. Place your comments between policy elements or at a higher level scope.\r\n-->\r\n<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service base-url="https://mobileatlas.apm.net.au" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_atlascasesearch_getuploadtypes_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_atlascasesearch_getuploadtypes
  name: 'policy'
  properties: {
    value: '<!--\r\n    IMPORTANT:\r\n    - Policy elements can appear only within the <inbound>, <outbound>, <backend> section elements.\r\n    - To apply a policy to the incoming request (before it is forwarded to the backend service), place a corresponding policy element within the <inbound> section element.\r\n    - To apply a policy to the outgoing response (before it is sent back to the caller), place a corresponding policy element within the <outbound> section element.\r\n    - To add a policy, place the cursor at the desired insertion point and select a policy from the sidebar.\r\n    - To remove a policy, delete the corresponding policy statement from the policy document.\r\n    - Position the <base> element within a section element to inherit all policies from the corresponding section element in the enclosing scope.\r\n    - Remove the <base> element to prevent inheriting policies from the corresponding section element in the enclosing scope.\r\n    - Policies are applied in the order of their appearance, from the top down.\r\n    - Comments within policy elements are not supported and may disappear. Place your comments between policy elements or at a higher level scope.\r\n-->\r\n<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service base-url="https://mobileatlas.apm.net.au" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_atlascasesearch_mycasemasterdetails_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_atlascasesearch_mycasemasterdetails
  name: 'policy'
  properties: {
    value: '<!--\r\n    IMPORTANT:\r\n    - Policy elements can appear only within the <inbound>, <outbound>, <backend> section elements.\r\n    - To apply a policy to the incoming request (before it is forwarded to the backend service), place a corresponding policy element within the <inbound> section element.\r\n    - To apply a policy to the outgoing response (before it is sent back to the caller), place a corresponding policy element within the <outbound> section element.\r\n    - To add a policy, place the cursor at the desired insertion point and select a policy from the sidebar.\r\n    - To remove a policy, delete the corresponding policy statement from the policy document.\r\n    - Position the <base> element within a section element to inherit all policies from the corresponding section element in the enclosing scope.\r\n    - Remove the <base> element to prevent inheriting policies from the corresponding section element in the enclosing scope.\r\n    - Policies are applied in the order of their appearance, from the top down.\r\n    - Comments within policy elements are not supported and may disappear. Place your comments between policy elements or at a higher level scope.\r\n-->\r\n<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service base-url="https://mobileatlas.apm.net.au" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_atlascasesearch_mycasesearchcasecontact_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_atlascasesearch_mycasesearchcasecontact
  name: 'policy'
  properties: {
    value: '<!--\r\n    IMPORTANT:\r\n    - Policy elements can appear only within the <inbound>, <outbound>, <backend> section elements.\r\n    - To apply a policy to the incoming request (before it is forwarded to the backend service), place a corresponding policy element within the <inbound> section element.\r\n    - To apply a policy to the outgoing response (before it is sent back to the caller), place a corresponding policy element within the <outbound> section element.\r\n    - To add a policy, place the cursor at the desired insertion point and select a policy from the sidebar.\r\n    - To remove a policy, delete the corresponding policy statement from the policy document.\r\n    - Position the <base> element within a section element to inherit all policies from the corresponding section element in the enclosing scope.\r\n    - Remove the <base> element to prevent inheriting policies from the corresponding section element in the enclosing scope.\r\n    - Policies are applied in the order of their appearance, from the top down.\r\n    - Comments within policy elements are not supported and may disappear. Place your comments between policy elements or at a higher level scope.\r\n-->\r\n<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service base-url="https://mobileatlas.apm.net.au" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_post_api_apmiq_save_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_caseapi_post_api_apmiq_save
  name: 'policy'
  properties: {
    value: '<!--\r\n    IMPORTANT:\r\n    - Policy elements can appear only within the <inbound>, <outbound>, <backend> section elements.\r\n    - To apply a policy to the incoming request (before it is forwarded to the backend service), place a corresponding policy element within the <inbound> section element.\r\n    - To apply a policy to the outgoing response (before it is sent back to the caller), place a corresponding policy element within the <outbound> section element.\r\n    - To add a policy, place the cursor at the desired insertion point and select a policy from the sidebar.\r\n    - To remove a policy, delete the corresponding policy statement from the policy document.\r\n    - Position the <base> element within a section element to inherit all policies from the corresponding section element in the enclosing scope.\r\n    - Remove the <base> element to prevent inheriting policies from the corresponding section element in the enclosing scope.\r\n    - Policies are applied in the order of their appearance, from the top down.\r\n    - Comments within policy elements are not supported and may disappear. Place your comments between policy elements or at a higher level scope.\r\n-->\r\n<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service base-url="https://mobileatlas.apm.net.au" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_case_sharepoint_integration_get_apmiqdocdata_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_case_sharepoint_integration_get_apmiqdocdata
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-atlasdocs-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_case_sharepoint_integration
    apim
  ]
}

resource apim_case_sharepoint_integration_get_casesearchsharepointgetdocumenttitles_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_case_sharepoint_integration_get_casesearchsharepointgetdocumenttitles
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-atlasdocs-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_case_sharepoint_integration
    apim
  ]
}

resource apim_case_sharepoint_integration_get_getchartimages_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_case_sharepoint_integration_get_getchartimages
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-atlasdocs-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_case_sharepoint_integration
    apim
  ]
}

resource apim_case_sharepoint_integration_get_lifeindexquestionnaire_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_case_sharepoint_integration_get_lifeindexquestionnaire
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-atlasdocs-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_case_sharepoint_integration
    apim
  ]
}

resource apim_case_sharepoint_integration_options_casesearchsharepointgetdocumenttitles_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_case_sharepoint_integration_options_casesearchsharepointgetdocumenttitles
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-atlasdocs-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_case_sharepoint_integration
    apim
  ]
}

resource apim_case_sharepoint_integration_options_getchartimages_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_case_sharepoint_integration_options_getchartimages
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-atlasdocs-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_case_sharepoint_integration
    apim
  ]
}

resource apim_echo_azurestorage_getblob_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_echo_azurestorage_getblob
  name: 'policy'
  properties: {
    value: '<!--\r\n    IMPORTANT:\r\n    - Policy elements can appear only within the <inbound>, <outbound>, <backend> section elements.\r\n    - To apply a policy to the incoming request (before it is forwarded to the backend service), place a corresponding policy element within the <inbound> section element.\r\n    - To apply a policy to the outgoing response (before it is sent back to the caller), place a corresponding policy element within the <outbound> section element.\r\n    - To add a policy, place the cursor at the desired insertion point and select a policy from the sidebar.\r\n    - To remove a policy, delete the corresponding policy statement from the policy document.\r\n    - Position the <base> element within a section element to inherit all policies from the corresponding section element in the enclosing scope.\r\n    - Remove the <base> element to prevent inheriting policies from the corresponding section element in the enclosing scope.\r\n    - Policies are applied in the order of their appearance, from the top down.\r\n    - Comments within policy elements are not supported and may disappear. Place your comments between policy elements or at a higher level scope.\r\n-->\r\n<policies>\r\n  <inbound>\r\n    <set-variable name="ContainerName" value="@(context.Request.Headers.GetValueOrDefault(&quot;Container&quot;))" />\r\n    <set-variable name="BlobName" value="@(context.Request.Headers.GetValueOrDefault(&quot;Blob&quot;))" />\r\n    <set-variable name="SasToken" value="@(context.Request.Headers.GetValueOrDefault(&quot;Sas&quot;))" />\r\n    <base />\r\n    <set-header name="Blob" exists-action="delete" />\r\n    <set-header name="Container" exists-action="delete" />\r\n    <set-header name="Sas" exists-action="delete" />\r\n    <set-backend-service base-url="@{&#xA;string containerName = context.Variables.GetValueOrDefault&lt;string&gt;(&quot;ContainerName&quot;);&#xA;string blobName = context.Variables.GetValueOrDefault&lt;string&gt;(&quot;BlobName&quot;);&#xA;string sasToken = context.Variables.GetValueOrDefault&lt;string&gt;(&quot;SasToken&quot;);&#xA;return String.Format(&quot;https://stechoprod001.blob.core.windows.net/{0}/{1}?{2}&quot;, containerName, blobName, sasToken);&#xA;}" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_echo_azurestorage
    apim
  ]
}

resource apim_echo_la_populate_echo_template_manual_invoke_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_echo_la_populate_echo_template_manual_invoke
  name: 'policy'
  properties: {
    value: '<!--\r\n    IMPORTANT:\r\n    - Policy elements can appear only within the <inbound>, <outbound>, <backend> section elements.\r\n    - To apply a policy to the incoming request (before it is forwarded to the backend service), place a corresponding policy element within the <inbound> section element.\r\n    - To apply a policy to the outgoing response (before it is sent back to the caller), place a corresponding policy element within the <outbound> section element.\r\n    - To add a policy, place the cursor at the desired insertion point and select a policy from the sidebar.\r\n    - To remove a policy, delete the corresponding policy statement from the policy document.\r\n    - Position the <base> element within a section element to inherit all policies from the corresponding section element in the enclosing scope.\r\n    - Remove the <base> element to prevent inheriting policies from the corresponding section element in the enclosing scope.\r\n    - Policies are applied in the order of their appearance, from the top down.\r\n    - Comments within policy elements are not supported and may disappear. Place your comments between policy elements or at a higher level scope.\r\n-->\r\n<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="LogicApp_la-populate-echo-template_rg-echo-pr_b08ffab61f61234ee50b567cec542972" />\r\n    <set-method id="apim-generated-policy">POST</set-method>\r\n    <rewrite-uri id="apim-generated-policy" template="/manual/paths/invoke/?api-version=2016-06-01&amp;sp=/triggers/manual/run&amp;sv=1.0&amp;sig={{echo-la-populate-echo-template_manual-invoke_62f32a33dea76176bcf3f012}}" />\r\n    <set-header id="apim-generated-policy" name="Ocp-Apim-Subscription-Key" exists-action="delete" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_echo_la_populate_echo_template
    apim
  ]
}

resource apim_emailapi_post_sendemail_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_emailapi_post_sendemail
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-emailapi-prod" />\r\n    <validate-azure-ad-token tenant-id="fa7adf0d-de2d-4570-8f5f-4bca4772988f">\r\n      <client-application-ids>\r\n        <!--id-echo-prod-001-->\r\n        <application-id>4e6a01a4-7299-456f-b4bd-58b9d9c62978</application-id>\r\n        <!--id-atlas-prod-001-->\r\n        <application-id>f71ab887-52f3-458a-b664-61e543a9c76b</application-id>\r\n        <!--umi-appservice-atlasras-prod-->\r\n        <application-id>cd46bcc9-75b8-4c4c-a7cc-79f93a926f6a</application-id>\r\n      </client-application-ids>\r\n    </validate-azure-ad-token>\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_emailapi
    apim
  ]
}

resource apim_la_html_pdf_template_manual_invoke_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_la_html_pdf_template_manual_invoke
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-method id="apim-generated-policy">POST</set-method>\r\n    <rewrite-uri id="apim-generated-policy" template="/manual/paths/invoke/?api-version=2016-06-01&amp;sp=/triggers/manual/run&amp;sv=1.0&amp;sig={{la-html-pdf-template_manual-invoke_6340142a6098941d9f54d1f4}}" />\r\n    <set-header id="apim-generated-policy" name="Ocp-Apim-Subscription-Key" exists-action="delete" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_la_html_pdf_template
    apim
  ]
}

resource apim_pat_607022a93c593d69fdd45a5d_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_607022a93c593d69fdd45a5d
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_6125ae0ac5c848c142ce05ec_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_6125ae0ac5c848c142ce05ec
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_612c5482f42bb4a6a04dec6e_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_612c5482f42bb4a6a04dec6e
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_6139bb81157a8ca10c88a17b_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_6139bb81157a8ca10c88a17b
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_616663d24e144ca0ff5825e2_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_616663d24e144ca0ff5825e2
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_628334f41c9668811d3701fe_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_628334f41c9668811d3701fe
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_628336151af661837338543d_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_628336151af661837338543d
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_62833674e1ec4ab9758aebc5_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_62833674e1ec4ab9758aebc5
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_6283375c6ca6d67681cbe546_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_6283375c6ca6d67681cbe546
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_628337bbdcb81460254c28ea_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_628337bbdcb81460254c28ea
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_6283382b46cfc369e81c81b9_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_6283382b46cfc369e81c81b9
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_62833c4863eeac7f55d0c6f0_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_62833c4863eeac7f55d0c6f0
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_62833cb815e7791a82796a6a_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_62833cb815e7791a82796a6a
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_62833dc0f74ce718f354b940_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_62833dc0f74ce718f354b940
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_62833e06f81dd3d2a99bf73c_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_62833e06f81dd3d2a99bf73c
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_62833e5d16d7473ca9b70364_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_62833e5d16d7473ca9b70364
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_62833fd616232db5c19ee6ac_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_62833fd616232db5c19ee6ac
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_628340221230c7d84ac09258_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_628340221230c7d84ac09258
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_62834084f438970cc9266001_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_62834084f438970cc9266001
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_62d630acfc784ce76fae31df_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_62d630acfc784ce76fae31df
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_62eb588921804dab1a09c291_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_62eb588921804dab1a09c291
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_6310835a5d2374ff961cb5ce_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_6310835a5d2374ff961cb5ce
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_6310838406c7b1c583b00b78_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_6310838406c7b1c583b00b78
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_6332c9d06bbeadf75b8b306f_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_6332c9d06bbeadf75b8b306f
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_647864b062518286bc32fbd8_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_647864b062518286bc32fbd8
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_6478653889a55acae2e03802_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_6478653889a55acae2e03802
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_647865899e89ed468493267b_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_647865899e89ed468493267b
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_changeparticipantrequiredlevelofsupport_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_changeparticipantrequiredlevelofsupport
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_delete_deleteallalertsfromservicebus_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_delete_deleteallalertsfromservicebus
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_delete_deleteallmessagesfromremovedparticipant_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_delete_deleteallmessagesfromremovedparticipant
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_getdiversecommunitytypes_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_getdiversecommunitytypes
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_get_getactivities_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_get_getactivities
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_get_getactivitiesworkflow_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_get_getactivitiesworkflow
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_get_getactivitytypes_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_get_getactivitytypes
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_get_getallactivecoordinators_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_get_getallactivecoordinators
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_get_getapmteams_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_get_getapmteams
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_get_getcontactmethods_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_get_getcontactmethods
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_get_getcoordinators_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_get_getcoordinators
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_get_getexitreasons_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_get_getexitreasons
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_get_gethelplinks_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_get_gethelplinks
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_get_geticddisabilities_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_get_geticddisabilities
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_get_getinactivereasons_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_get_getinactivereasons
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_get_getlatestfaqpdf_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_get_getlatestfaqpdf
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_get_getnotificationsforuser_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_get_getnotificationsforuser
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_get_getoutcomes_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_get_getoutcomes
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_get_getparticipant_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_get_getparticipant
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_get_getparticipantalerts_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_get_getparticipantalerts
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_get_getparticipantcompletedactivities_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_get_getparticipantcompletedactivities
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_get_getparticipantevents_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_get_getparticipantevents
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_get_getparticipantplanbyid_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_get_getparticipantplanbyid
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_get_getparticipantplanevents_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_get_getparticipantplanevents
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_get_getparticipantplans_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_get_getparticipantplans
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_get_getparticipantsbycoordinator_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_get_getparticipantsbycoordinator
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_get_getrequiredlevelsofsupport_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_get_getrequiredlevelsofsupport
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_get_getroles_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_get_getroles
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_get_getserviceareas_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_get_getserviceareas
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_get_getstages_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_get_getstages
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_get_getstreams_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_get_getstreams
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_get_getsuburbs_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_get_getsuburbs
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_get_getunassignedparticipants_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_get_getunassignedparticipants
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_get_getuser_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_get_getuser
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_get_getuseralertcount_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_get_getuseralertcount
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_get_getuseralerts_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_get_getuseralerts
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_getmethodofengagement_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_getmethodofengagement
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_getparticipantdiversity_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_getparticipantdiversity
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_get_searchcoordinators_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_get_searchcoordinators
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_get_searchparticipants_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_get_searchparticipants
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_get_searchusers_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_get_searchusers
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_getservicesdelivered_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_getservicesdelivered
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_patch_updatealertsforuser_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_patch_updatealertsforuser
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_patch_updatenotificationsforuser_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_patch_updatenotificationsforuser
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_patch_updateparticipant_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_patch_updateparticipant
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_patch_updateuser_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_patch_updateuser
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_post_addcoordinatornote_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_post_addcoordinatornote
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_post_assignparticipanttocoordinator_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_post_assignparticipanttocoordinator
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_post_changeparticipantstage_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_post_changeparticipantstage
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_post_changeserviceareamanagerarea_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_post_changeserviceareamanagerarea
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_post_createparticipant_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_post_createparticipant
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_post_logactivity_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_post_logactivity
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_post_removeparticipant_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_post_removeparticipant
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_post_syncusersfromaad_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_post_syncusersfromaad
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_post_undoactivity_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_post_undoactivity
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_post_uploadpdftostorage_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_post_uploadpdftostorage
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_pat_put_userinfo_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_pat_put_userinfo
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-pat-prod-001" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_pat
    apim
  ]
}

resource apim_referrals_internal_post_sendreferralevent_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_referrals_internal_post_sendreferralevent
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-referralapiinternal-prod" />\r\n    <rewrite-uri template="/referralEvent" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_referrals_internal
    apim
  ]
}

resource apim_referrals_public_post_a_createreferral_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_referrals_public_post_a_createreferral
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azfun-referralapipublic-prod" />\r\n    <rewrite-uri template="/Referral" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_referrals_public
    apim
  ]
}

resource apim_sharepoint_management_63cf608a4ea4fbdb8b7f0f65_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_sharepoint_management_63cf608a4ea4fbdb8b7f0f65
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="LogicApp_logic-sharepoint-upload-document-pro_f4253d39106e90d2f05853e01f21e285" />\r\n    <set-method id="apim-generated-policy">POST</set-method>\r\n    <rewrite-uri id="apim-generated-policy" template="/request/paths/invoke/?api-version=2016-06-01&amp;sp=/triggers/request/run&amp;sv=1.0&amp;sig={{sharepoint-management_63cf608a4ea4fbdb8b7f0f65_63eb11cd96d6ad814a2d145a}}" />\r\n    <set-header id="apim-generated-policy" name="Ocp-Apim-Subscription-Key" exists-action="delete" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_sharepoint_management
    apim
  ]
}

resource apim_sharepoint_management_request_invoke_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_sharepoint_management_request_invoke
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="LogicApp_logic-sharepoint-download-document-p_19d26e4b3e09ab8fef9fc463b1b53b7a" />\r\n    <set-method id="apim-generated-policy">POST</set-method>\r\n    <rewrite-uri id="apim-generated-policy" template="/request/paths/invoke/?api-version=2016-06-01&amp;sp=/triggers/request/run&amp;sv=1.0&amp;sig={{sharepoint-management_request-invoke_63eb11b56a9a0219aacc38c4}}" />\r\n    <set-header id="apim-generated-policy" name="Ocp-Apim-Subscription-Key" exists-action="delete" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_sharepoint_management
    apim
  ]
}

resource apim_wordtemplate_get_getdocumentbyblobidandcontainer_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_wordtemplate_get_getdocumentbyblobidandcontainer
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="func-wordtemplate-prod" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_wordtemplate
    apim
  ]
}

resource apim_wordtemplate_post_createdocumentfromtemplate_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_wordtemplate_post_createdocumentfromtemplate
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="func-wordtemplate-prod" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_wordtemplate
    apim
  ]
}

resource apim_wordtemplate_put_putdocumentbyidandcontainer_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-09-01-preview' = {
  parent: apim_wordtemplate_put_putdocumentbyidandcontainer
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="func-wordtemplate-prod" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    apim_wordtemplate
    apim
  ]
}

resource apim_caseapi_ApmiqScoreV2_Ticks_Case 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_ApmiqScoreV2_Ticks
  name: 'Case'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_atlascasesearch_doesuserhaveaccess_AtlasCaseSearch 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_atlascasesearch_doesuserhaveaccess
  name: 'AtlasCaseSearch'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_atlascasesearch_getcasedatedetails_AtlasCaseSearch 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_atlascasesearch_getcasedatedetails
  name: 'AtlasCaseSearch'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_atlascasesearch_getcasedatestatus_AtlasCaseSearch 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_atlascasesearch_getcasedatestatus
  name: 'AtlasCaseSearch'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_atlascasesearch_getriskynote_AtlasCaseSearch 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_atlascasesearch_getriskynote
  name: 'AtlasCaseSearch'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_atlascasesearch_getuploadtypes_AtlasCaseSearch 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_atlascasesearch_getuploadtypes
  name: 'AtlasCaseSearch'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_atlascasesearch_mycasemasterdetails_AtlasCaseSearch 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_atlascasesearch_mycasemasterdetails
  name: 'AtlasCaseSearch'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_atlascasesearch_mycasesearchcasecontact_AtlasCaseSearch 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_atlascasesearch_mycasesearchcasecontact
  name: 'AtlasCaseSearch'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_atlascasesearch_mycasesearchcases_AtlasCaseSearch 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_atlascasesearch_mycasesearchcases
  name: 'AtlasCaseSearch'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_atlascasesearch_mycasesearchcasesdetails_AtlasCaseSearch 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_atlascasesearch_mycasesearchcasesdetails
  name: 'AtlasCaseSearch'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_atlascasesearch_mycasesearchworkgroupconsultantlist_AtlasCaseSearch 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_atlascasesearch_mycasesearchworkgroupconsultantlist
  name: 'AtlasCaseSearch'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_atlascasesearch_mycasesearchworkgroupdetails_AtlasCaseSearch 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_atlascasesearch_mycasesearchworkgroupdetails
  name: 'AtlasCaseSearch'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_atlascasesearch_mycasetasks_AtlasCaseSearch 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_atlascasesearch_mycasetasks
  name: 'AtlasCaseSearch'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_atlascasesearch_myddldatetypes_AtlasCaseSearch 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_atlascasesearch_myddldatetypes
  name: 'AtlasCaseSearch'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_atlascasesearch_myddlhours_AtlasCaseSearch 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_atlascasesearch_myddlhours
  name: 'AtlasCaseSearch'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_atlascasesearch_myddlminutes_AtlasCaseSearch 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_atlascasesearch_myddlminutes
  name: 'AtlasCaseSearch'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_atlascasesearch_myddlservice_AtlasCaseSearch 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_atlascasesearch_myddlservice
  name: 'AtlasCaseSearch'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_case_caseid_Case 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_case_caseid
  name: 'Case'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_case_caseid_apmiqscore_Case 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_case_caseid_apmiqscore
  name: 'Case'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_case_caseid_apmiqscorev2_Case 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_case_caseid_apmiqscorev2
  name: 'Case'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_case_caseid_consultant_Case 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_case_caseid_consultant
  name: 'Case'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_case_caseid_doctor_Case 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_case_caseid_doctor
  name: 'Case'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_case_caseid_employer_Case 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_case_caseid_employer
  name: 'Case'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_case_caseid_funder_Case 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_case_caseid_funder
  name: 'Case'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_case_caseid_insurer_Case 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_case_caseid_insurer
  name: 'Case'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_case_mycases_Case 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_case_mycases
  name: 'Case'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_case_mycases_emailid_Case 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_case_mycases_emailid
  name: 'Case'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_casenote_case_caseid_CaseNote 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_casenote_case_caseid
  name: 'CaseNote'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_casenote_casenotereferrallist_CaseNote 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_casenote_casenotereferrallist
  name: 'CaseNote'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_casenote_casenoteservicebyreferralidlist_CaseNote 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_casenote_casenoteservicebyreferralidlist
  name: 'CaseNote'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_casenote_casenoteservicereferralconsultant_CaseNote 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_casenote_casenoteservicereferralconsultant
  name: 'CaseNote'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_casenote_casenotetacindexlist_CaseNote 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_casenote_casenotetacindexlist
  name: 'CaseNote'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_casenote_casenotetaclist_CaseNote 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_casenote_casenotetaclist
  name: 'CaseNote'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_casenote_doescasehavetasks_CaseNote 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_casenote_doescasehavetasks
  name: 'CaseNote'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_casenote_getcaseavailablefunding_CaseNote 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_casenote_getcaseavailablefunding
  name: 'CaseNote'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_casenote_getcaseconsultants_CaseNote 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_casenote_getcaseconsultants
  name: 'CaseNote'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_casenote_getcaseidfromnoteid_CaseNote 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_casenote_getcaseidfromnoteid
  name: 'CaseNote'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_casenote_getexceptionalservicecount_CaseNote 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_casenote_getexceptionalservicecount
  name: 'CaseNote'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_casenote_getlatestreferralandserviceid_CaseNote 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_casenote_getlatestreferralandserviceid
  name: 'CaseNote'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_casenote_getloggedinconsultantatlaspid_CaseNote 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_casenote_getloggedinconsultantatlaspid
  name: 'CaseNote'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_casenote_getloggedinconsultantworkgroup_CaseNote 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_casenote_getloggedinconsultantworkgroup
  name: 'CaseNote'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_casenote_getservicemaxminutes_CaseNote 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_casenote_getservicemaxminutes
  name: 'CaseNote'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_casenote_getserviceminutes_CaseNote 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_casenote_getserviceminutes
  name: 'CaseNote'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_casenote_getspdocauthorname_CaseNote 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_casenote_getspdocauthorname
  name: 'CaseNote'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_casenote_getsplibrarynameforcaseid_CaseNote 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_casenote_getsplibrarynameforcaseid
  name: 'CaseNote'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_casenote_gettaskdescriptionfromtaskid_CaseNote 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_casenote_gettaskdescriptionfromtaskid
  name: 'CaseNote'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_casenote_isexcludedfromtaccap_CaseNote 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_casenote_isexcludedfromtaccap
  name: 'CaseNote'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_casenote_isnotecaptravel_CaseNote 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_casenote_isnotecaptravel
  name: 'CaseNote'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_casenote_isovertaccap_CaseNote 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_casenote_isovertaccap
  name: 'CaseNote'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_casenote_mycasenotedetails_CaseNote 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_casenote_mycasenotedetails
  name: 'CaseNote'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_casenote_mycasenotesingledetail_CaseNote 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_casenote_mycasenotesingledetail
  name: 'CaseNote'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_casenote_mycasesearchcasesdetails_CaseNote 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_casenote_mycasesearchcasesdetails
  name: 'CaseNote'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_casenote_mycaseservicetasks_CaseNote 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_casenote_mycaseservicetasks
  name: 'CaseNote'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_casenote_notebillingdetails_CaseNote 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_casenote_notebillingdetails
  name: 'CaseNote'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_casenote_noteconsolidatedtravelcalcs_CaseNote 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_casenote_noteconsolidatedtravelcalcs
  name: 'CaseNote'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_consultant_filter_referral_referralid_service_serviceid_Consultant 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_consultant_filter_referral_referralid_service_serviceid
  name: 'Consultant'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_referral_filter_case_caseid_Referral 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_referral_filter_case_caseid
  name: 'Referral'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_service_filter_referral_referralid_Service 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_service_filter_referral_referralid
  name: 'Service'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_tac_filter_case_caseid_referral_referralid_service_serviceid_Tac 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_tac_filter_case_caseid_referral_referralid_service_serviceid
  name: 'Tac'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_get_api_tacindex_filter_case_caseid_service_serviceid_tac_tacid_TacIndex 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_get_api_tacindex_filter_case_caseid_service_serviceid_tac_tacid
  name: 'TacIndex'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_post_api_apmiq_save_Apmiq 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_post_api_apmiq_save
  name: 'Apmiq'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_post_api_atlascasesearch_saveipaudit_AtlasCaseSearch 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_post_api_atlascasesearch_saveipaudit
  name: 'AtlasCaseSearch'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_post_api_atlascasesearch_savemobiledocumenttoblobstorage_AtlasCaseSearch 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_post_api_atlascasesearch_savemobiledocumenttoblobstorage
  name: 'AtlasCaseSearch'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_post_api_atlascasesearch_updatedatestatus_AtlasCaseSearch 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_post_api_atlascasesearch_updatedatestatus
  name: 'AtlasCaseSearch'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_post_api_casenote_CaseNote 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_post_api_casenote
  name: 'CaseNote'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_post_api_casenote_completetask_CaseNote 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_post_api_casenote_completetask
  name: 'CaseNote'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_post_api_casenote_savecasenote_CaseNote 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_post_api_casenote_savecasenote
  name: 'CaseNote'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_post_api_casenote_savectfixedcasenote_CaseNote 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_post_api_casenote_savectfixedcasenote
  name: 'CaseNote'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_post_api_casenote_savectkmcasenote_CaseNote 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_post_api_casenote_savectkmcasenote
  name: 'CaseNote'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_post_api_casenote_savevrsrtwdate_CaseNote 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_post_api_casenote_savevrsrtwdate
  name: 'CaseNote'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_caseapi_post_api_casenote_updatetask_CaseNote 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_caseapi_post_api_casenote_updatetask
  name: 'CaseNote'
  dependsOn: [

    apim_caseapi
    apim
  ]
}

resource apim_pdf_merge_PdfMerge_PdfMerge 'Microsoft.ApiManagement/service/apis/operations/tags@2022-09-01-preview' = {
  parent: apim_pdf_merge_PdfMerge
  name: 'PdfMerge'
  dependsOn: [

    apim_pdf_merge
    apim
  ]
}

resource apim_corporate_info_and_apps_shared_apis_1604F4EB_4E6F_47F9_B87D_B2950564B77D 'Microsoft.ApiManagement/service/products/apiLinks@2022-09-01-preview' = {
  parent: apim_corporate_info_and_apps_shared_apis
  name: '1604F4EB-4E6F-47F9-B87D-B2950564B77D'
  properties: {
    apiId: apim_pdf_merge.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_sherpa_63cf5e44277a971124f7b04f 'Microsoft.ApiManagement/service/products/apiLinks@2022-09-01-preview' = {
  parent: apim_sherpa
  name: '63cf5e44277a971124f7b04f'
  properties: {
    apiId: apim_sharepoint_management.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_corporate_info_and_apps_shared_apis_12841CCF_E1B0_4E37_8280_9DF5BAD52C21 'Microsoft.ApiManagement/service/products/groupLinks@2022-09-01-preview' = {
  parent: apim_corporate_info_and_apps_shared_apis
  name: '12841CCF-E1B0-4E37-8280-9DF5BAD52C21'
  properties: {
    groupId: apim_administrators.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_sherpa_63cf5e42277a971124f7b04c 'Microsoft.ApiManagement/service/products/groupLinks@2022-09-01-preview' = {
  parent: apim_sherpa
  name: '63cf5e42277a971124f7b04c'
  properties: {
    groupId: apim_administrators.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_sherpa_63cf5f05277a971124f7b059 'Microsoft.ApiManagement/service/products/groupLinks@2022-09-01-preview' = {
  parent: apim_sherpa
  name: '63cf5f05277a971124f7b059'
  properties: {
    groupId: apim_guests.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_sherpa_63cf5f05277a971124f7b05b 'Microsoft.ApiManagement/service/products/groupLinks@2022-09-01-preview' = {
  parent: apim_sherpa
  name: '63cf5f05277a971124f7b05b'
  properties: {
    groupId: apim_developers.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_starter_0ADA5883_397F_43AE_ACAF_A95355F3BC97 'Microsoft.ApiManagement/service/products/groupLinks@2022-09-01-preview' = {
  parent: apim_starter
  name: '0ADA5883-397F-43AE-ACAF-A95355F3BC97'
  properties: {
    groupId: apim_guests.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_starter_CD3EF7DC_B405_48EC_8743_F21C05CB8B23 'Microsoft.ApiManagement/service/products/groupLinks@2022-09-01-preview' = {
  parent: apim_starter
  name: 'CD3EF7DC-B405-48EC-8743-F21C05CB8B23'
  properties: {
    groupId: apim_developers.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_starter_E03D5E3D_12FB_4E24_B98F_70CAAA21EEC5 'Microsoft.ApiManagement/service/products/groupLinks@2022-09-01-preview' = {
  parent: apim_starter
  name: 'E03D5E3D-12FB-4E24-B98F-70CAAA21EEC5'
  properties: {
    groupId: apim_administrators.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_unlimited_16636850_93E6_4B6C_87AA_A109FEB61516 'Microsoft.ApiManagement/service/products/groupLinks@2022-09-01-preview' = {
  parent: apim_unlimited
  name: '16636850-93E6-4B6C-87AA-A109FEB61516'
  properties: {
    groupId: apim_developers.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_unlimited_5EE31162_F47C_4DA0_8F65_6F59F0E0021A 'Microsoft.ApiManagement/service/products/groupLinks@2022-09-01-preview' = {
  parent: apim_unlimited
  name: '5EE31162-F47C-4DA0-8F65-6F59F0E0021A'
  properties: {
    groupId: apim_administrators.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_unlimited_778DBBA6_D129_4A09_8F75_7B905CA59EE8 'Microsoft.ApiManagement/service/products/groupLinks@2022-09-01-preview' = {
  parent: apim_unlimited
  name: '778DBBA6-D129-4A09-8F75-7B905CA59EE8'
  properties: {
    groupId: apim_guests.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_6070199af166df0040070001 'Microsoft.ApiManagement/service/subscriptions@2022-09-01-preview' = {
  parent: apim
  name: '6070199af166df0040070001'
  properties: {
    ownerId: apim_1.id
    scope: apim_starter.id
    state: 'active'
    allowTracing: false
    displayName: null
  }
}

resource apim_6070199bf166df0040070002 'Microsoft.ApiManagement/service/subscriptions@2022-09-01-preview' = {
  parent: apim
  name: '6070199bf166df0040070002'
  properties: {
    ownerId: apim_1.id
    scope: apim_unlimited.id
    state: 'active'
    allowTracing: false
    displayName: null
  }
}

resource apim_63998a72b8f67a14dc5e2a42 'Microsoft.ApiManagement/service/subscriptions@2022-09-01-preview' = {
  parent: apim
  name: '63998a72b8f67a14dc5e2a42'
  properties: {
    ownerId: apim_1.id
    scope: apim_corporate_info_and_apps_shared_apis.id
    state: 'active'
    allowTracing: false
    displayName: null
  }
}

resource apim_63cf5e43277a971124f7b04d 'Microsoft.ApiManagement/service/subscriptions@2022-09-01-preview' = {
  parent: apim
  name: '63cf5e43277a971124f7b04d'
  properties: {
    ownerId: apim_1.id
    scope: apim_sherpa.id
    displayName: 'Sherpa'
    state: 'active'
    allowTracing: false
  }
}

resource apim_echo_42564D1F_8F7D_4922_ACE0_92451F532A11 'Microsoft.ApiManagement/service/tags/apiLinks@2022-09-01-preview' = {
  parent: apim_echo
  name: '42564D1F-8F7D-4922-ACE0-92451F532A11'
  properties: {
    apiId: apim_echo_la_populate_echo_template.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_echo_47E5A917_4230_4C89_8CE1_1B56F364579E 'Microsoft.ApiManagement/service/tags/apiLinks@2022-09-01-preview' = {
  parent: apim_echo
  name: '47E5A917-4230-4C89-8CE1-1B56F364579E'
  properties: {
    apiId: apim_echo_azurestorage.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_Apmiq_5EDA4C40_5D5A_4F26_896A_508709A93128 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_Apmiq
  name: '5EDA4C40-5D5A-4F26-896A-508709A93128'
  properties: {
    operationId: apim_caseapi_post_api_apmiq_save.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_AtlasCaseSearch_03635713_69AE_4DF8_8020_8BBFD705AF49 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_AtlasCaseSearch
  name: '03635713-69AE-4DF8-8020-8BBFD705AF49'
  properties: {
    operationId: apim_caseapi_get_api_atlascasesearch_mycasesearchcases.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_AtlasCaseSearch_061BCA8B_0C71_43B7_B8FC_ADABE0A84594 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_AtlasCaseSearch
  name: '061BCA8B-0C71-43B7-B8FC-ADABE0A84594'
  properties: {
    operationId: apim_caseapi_post_api_atlascasesearch_updatedatestatus.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_AtlasCaseSearch_09A5A3C7_96F2_4F09_B17B_B3DCA83E3435 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_AtlasCaseSearch
  name: '09A5A3C7-96F2-4F09-B17B-B3DCA83E3435'
  properties: {
    operationId: apim_caseapi_get_api_atlascasesearch_mycasemasterdetails.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_AtlasCaseSearch_0FCA660E_FE2D_438A_83E3_CC43D3925A80 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_AtlasCaseSearch
  name: '0FCA660E-FE2D-438A-83E3-CC43D3925A80'
  properties: {
    operationId: apim_caseapi_get_api_atlascasesearch_getuploadtypes.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_AtlasCaseSearch_11800122_65D0_4C70_9179_37CD82ADB4B4 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_AtlasCaseSearch
  name: '11800122-65D0-4C70-9179-37CD82ADB4B4'
  properties: {
    operationId: apim_caseapi_get_api_atlascasesearch_doesuserhaveaccess.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_AtlasCaseSearch_1A16A4FC_0C25_45C8_9DA5_C4DBC84C0192 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_AtlasCaseSearch
  name: '1A16A4FC-0C25-45C8-9DA5-C4DBC84C0192'
  properties: {
    operationId: apim_caseapi_get_api_atlascasesearch_mycasesearchcasecontact.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_AtlasCaseSearch_2BE549FA_D5B7_43C2_A7F6_CD877EA6D7FB 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_AtlasCaseSearch
  name: '2BE549FA-D5B7-43C2-A7F6-CD877EA6D7FB'
  properties: {
    operationId: apim_caseapi_post_api_atlascasesearch_savemobiledocumenttoblobstorage.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_AtlasCaseSearch_2FBF8A0A_AF8F_486B_A497_4633B21C708D 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_AtlasCaseSearch
  name: '2FBF8A0A-AF8F-486B-A497-4633B21C708D'
  properties: {
    operationId: apim_caseapi_post_api_atlascasesearch_saveipaudit.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_AtlasCaseSearch_40EFFC17_20CE_45FB_B561_E06C664A20C1 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_AtlasCaseSearch
  name: '40EFFC17-20CE-45FB-B561-E06C664A20C1'
  properties: {
    operationId: apim_caseapi_get_api_atlascasesearch_getcasedatestatus.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_AtlasCaseSearch_4FA93C9C_5638_40BC_BA94_7078807F63EC 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_AtlasCaseSearch
  name: '4FA93C9C-5638-40BC-BA94-7078807F63EC'
  properties: {
    operationId: apim_caseapi_get_api_atlascasesearch_mycasesearchcasesdetails.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_AtlasCaseSearch_60DA42E6_48DB_4D13_96B2_0416D7F64D35 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_AtlasCaseSearch
  name: '60DA42E6-48DB-4D13-96B2-0416D7F64D35'
  properties: {
    operationId: apim_caseapi_get_api_atlascasesearch_getcasedatedetails.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_AtlasCaseSearch_805C9E5E_D2FC_4F4E_9C70_BCB829E0C81D 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_AtlasCaseSearch
  name: '805C9E5E-D2FC-4F4E-9C70-BCB829E0C81D'
  properties: {
    operationId: apim_caseapi_get_api_atlascasesearch_myddlminutes.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_AtlasCaseSearch_8079D8FD_4E87_4003_9B17_A56BD880B089 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_AtlasCaseSearch
  name: '8079D8FD-4E87-4003-9B17-A56BD880B089'
  properties: {
    operationId: apim_caseapi_get_api_atlascasesearch_mycasesearchworkgroupdetails.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_AtlasCaseSearch_9E14551D_2FB5_48A4_BB7E_6D795FBDA31F 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_AtlasCaseSearch
  name: '9E14551D-2FB5-48A4-BB7E-6D795FBDA31F'
  properties: {
    operationId: apim_caseapi_get_api_atlascasesearch_myddlservice.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_AtlasCaseSearch_A3A6B255_E95C_4F1A_9F2C_A1A0A4D4491C 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_AtlasCaseSearch
  name: 'A3A6B255-E95C-4F1A-9F2C-A1A0A4D4491C'
  properties: {
    operationId: apim_caseapi_get_api_atlascasesearch_mycasetasks.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_AtlasCaseSearch_C25D5832_1024_4AFB_9A4C_62A81C06454A 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_AtlasCaseSearch
  name: 'C25D5832-1024-4AFB-9A4C-62A81C06454A'
  properties: {
    operationId: apim_caseapi_get_api_atlascasesearch_getriskynote.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_AtlasCaseSearch_CB8A3BC0_160D_4C01_9774_C41B62366BF5 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_AtlasCaseSearch
  name: 'CB8A3BC0-160D-4C01-9774-C41B62366BF5'
  properties: {
    operationId: apim_caseapi_get_api_atlascasesearch_myddldatetypes.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_AtlasCaseSearch_DB28F97A_9AE8_4117_B1FC_5B09875C6E13 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_AtlasCaseSearch
  name: 'DB28F97A-9AE8-4117-B1FC-5B09875C6E13'
  properties: {
    operationId: apim_caseapi_get_api_atlascasesearch_mycasesearchworkgroupconsultantlist.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_AtlasCaseSearch_F0E90F47_C381_4B5A_896A_1805171126D1 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_AtlasCaseSearch
  name: 'F0E90F47-C381-4B5A-896A-1805171126D1'
  properties: {
    operationId: apim_caseapi_get_api_atlascasesearch_myddlhours.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_Case_0C2E0C19_8FB2_4AED_B09F_751E74C6557B 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_Case
  name: '0C2E0C19-8FB2-4AED-B09F-751E74C6557B'
  properties: {
    operationId: apim_caseapi_get_api_case_caseid_consultant.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_Case_109D4608_BC70_414D_9203_94E417E8BB14 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_Case
  name: '109D4608-BC70-414D-9203-94E417E8BB14'
  properties: {
    operationId: apim_caseapi_get_api_case_caseid_doctor.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_Case_420F8357_E1C4_4C74_8E2A_9D4B49F49544 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_Case
  name: '420F8357-E1C4-4C74-8E2A-9D4B49F49544'
  properties: {
    operationId: apim_caseapi_ApmiqScoreV2_Ticks.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_Case_44225618_6CEA_45B4_B8A3_4227C9958212 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_Case
  name: '44225618-6CEA-45B4-B8A3-4227C9958212'
  properties: {
    operationId: apim_caseapi_get_api_case_caseid_employer.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_Case_6A14F99B_972F_4CCE_A04C_23C4D897C7B7 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_Case
  name: '6A14F99B-972F-4CCE-A04C-23C4D897C7B7'
  properties: {
    operationId: apim_caseapi_get_api_case_caseid.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_Case_7B9C0E07_057A_42A4_8639_C6F5379D37D3 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_Case
  name: '7B9C0E07-057A-42A4-8639-C6F5379D37D3'
  properties: {
    operationId: apim_caseapi_get_api_case_mycases_emailid.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_Case_7D15583E_EA62_4415_8E25_40C8114512B2 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_Case
  name: '7D15583E-EA62-4415-8E25-40C8114512B2'
  properties: {
    operationId: apim_caseapi_get_api_case_caseid_funder.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_Case_7ECFF2BE_7D66_44E8_A22E_85A9E7558431 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_Case
  name: '7ECFF2BE-7D66-44E8-A22E-85A9E7558431'
  properties: {
    operationId: apim_caseapi_get_api_case_caseid_insurer.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_Case_87742DA0_A2E4_48B6_A945_E9729D1E74A6 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_Case
  name: '87742DA0-A2E4-48B6-A945-E9729D1E74A6'
  properties: {
    operationId: apim_caseapi_get_api_case_mycases.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_Case_8C90C9D5_427F_4DE3_A75E_80BC57252A3B 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_Case
  name: '8C90C9D5-427F-4DE3-A75E-80BC57252A3B'
  properties: {
    operationId: apim_caseapi_get_api_case_caseid_apmiqscorev2.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_Case_A3B1775A_51DE_4FDF_AE81_A4E28EC37AA5 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_Case
  name: 'A3B1775A-51DE-4FDF-AE81-A4E28EC37AA5'
  properties: {
    operationId: apim_caseapi_get_api_case_caseid_apmiqscore.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_CaseNote_0686AD21_8AED_4E8D_86E0_A65A634E5FB4 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_CaseNote
  name: '0686AD21-8AED-4E8D-86E0-A65A634E5FB4'
  properties: {
    operationId: apim_caseapi_post_api_casenote_savevrsrtwdate.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_CaseNote_092DB635_3881_4643_A00A_C58324B33DA5 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_CaseNote
  name: '092DB635-3881-4643-A00A-C58324B33DA5'
  properties: {
    operationId: apim_caseapi_get_api_casenote_doescasehavetasks.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_CaseNote_0D48BE2A_DF36_4522_8B38_F42AA0B5F8AD 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_CaseNote
  name: '0D48BE2A-DF36-4522-8B38-F42AA0B5F8AD'
  properties: {
    operationId: apim_caseapi_get_api_casenote_mycasenotedetails.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_CaseNote_12AB5A5C_997C_415C_BB61_D2DDC4A5E8B0 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_CaseNote
  name: '12AB5A5C-997C-415C-BB61-D2DDC4A5E8B0'
  properties: {
    operationId: apim_caseapi_get_api_casenote_casenoteservicebyreferralidlist.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_CaseNote_137E28D1_AF63_49AD_BC05_93D0152AE80D 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_CaseNote
  name: '137E28D1-AF63-49AD-BC05-93D0152AE80D'
  properties: {
    operationId: apim_caseapi_get_api_casenote_getlatestreferralandserviceid.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_CaseNote_13C062BE_FC50_476A_9EE0_EF623A512BD6 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_CaseNote
  name: '13C062BE-FC50-476A-9EE0-EF623A512BD6'
  properties: {
    operationId: apim_caseapi_get_api_casenote_mycaseservicetasks.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_CaseNote_1CD6E2FC_AA65_4B82_BFF6_F14B43D57AA2 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_CaseNote
  name: '1CD6E2FC-AA65-4B82-BFF6-F14B43D57AA2'
  properties: {
    operationId: apim_caseapi_get_api_casenote_getexceptionalservicecount.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_CaseNote_201F56F2_D60E_411D_90E6_C7F2B54D1A92 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_CaseNote
  name: '201F56F2-D60E-411D-90E6-C7F2B54D1A92'
  properties: {
    operationId: apim_caseapi_get_api_casenote_casenotetacindexlist.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_CaseNote_221C3C1D_2FD2_4374_B0BD_971E720037E3 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_CaseNote
  name: '221C3C1D-2FD2-4374-B0BD-971E720037E3'
  properties: {
    operationId: apim_caseapi_get_api_casenote_getserviceminutes.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_CaseNote_2AEE4DC1_1ABA_4A28_82BC_FF49F9AABB86 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_CaseNote
  name: '2AEE4DC1-1ABA-4A28-82BC-FF49F9AABB86'
  properties: {
    operationId: apim_caseapi_get_api_casenote_getloggedinconsultantatlaspid.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_CaseNote_2BDB4F39_5B5A_4B7B_8C58_F71F5920EF8A 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_CaseNote
  name: '2BDB4F39-5B5A-4B7B-8C58-F71F5920EF8A'
  properties: {
    operationId: apim_caseapi_get_api_casenote_casenotetaclist.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_CaseNote_358461F5_A7A8_415F_B745_1424C22121D4 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_CaseNote
  name: '358461F5-A7A8-415F-B745-1424C22121D4'
  properties: {
    operationId: apim_caseapi_get_api_casenote_mycasenotesingledetail.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_CaseNote_39FB4DDE_326D_405D_9BEC_A1F0A1E0DDB3 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_CaseNote
  name: '39FB4DDE-326D-405D-9BEC-A1F0A1E0DDB3'
  properties: {
    operationId: apim_caseapi_get_api_casenote_mycasesearchcasesdetails.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_CaseNote_429E6700_12BB_4BB6_9235_A49ABE7DF995 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_CaseNote
  name: '429E6700-12BB-4BB6-9235-A49ABE7DF995'
  properties: {
    operationId: apim_caseapi_post_api_casenote_savectkmcasenote.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_CaseNote_59EC29C1_66F5_4A63_B654_6DF673E64FA7 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_CaseNote
  name: '59EC29C1-66F5-4A63-B654-6DF673E64FA7'
  properties: {
    operationId: apim_caseapi_get_api_casenote_getspdocauthorname.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_CaseNote_5DF43C76_1D9E_493A_BB31_CC134237AC6F 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_CaseNote
  name: '5DF43C76-1D9E-493A-BB31-CC134237AC6F'
  properties: {
    operationId: apim_caseapi_get_api_casenote_casenotereferrallist.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_CaseNote_6FA3D036_1F60_44BF_BCC1_7EA7821A9A7E 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_CaseNote
  name: '6FA3D036-1F60-44BF-BCC1-7EA7821A9A7E'
  properties: {
    operationId: apim_caseapi_get_api_casenote_gettaskdescriptionfromtaskid.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_CaseNote_807F3EF7_CEAA_4B16_ADE3_2FC859D15587 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_CaseNote
  name: '807F3EF7-CEAA-4B16-ADE3-2FC859D15587'
  properties: {
    operationId: apim_caseapi_get_api_casenote_noteconsolidatedtravelcalcs.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_CaseNote_83AC40DD_049D_4FA0_95CD_A9C43668E46D 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_CaseNote
  name: '83AC40DD-049D-4FA0-95CD-A9C43668E46D'
  properties: {
    operationId: apim_caseapi_get_api_casenote_getservicemaxminutes.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_CaseNote_8D1C52FE_95F2_4DAF_9A2D_047C65637E2F 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_CaseNote
  name: '8D1C52FE-95F2-4DAF-9A2D-047C65637E2F'
  properties: {
    operationId: apim_caseapi_get_api_casenote_getcaseconsultants.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_CaseNote_8FC7B7AE_65BD_40EF_8F99_253833974FA9 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_CaseNote
  name: '8FC7B7AE-65BD-40EF-8F99-253833974FA9'
  properties: {
    operationId: apim_caseapi_get_api_casenote_notebillingdetails.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_CaseNote_8FF81235_C990_4023_A1C6_B19D2554CC05 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_CaseNote
  name: '8FF81235-C990-4023-A1C6-B19D2554CC05'
  properties: {
    operationId: apim_caseapi_get_api_casenote_getcaseavailablefunding.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_CaseNote_91C3F9E7_3CC3_4792_8501_41D24B3C93C7 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_CaseNote
  name: '91C3F9E7-3CC3-4792-8501-41D24B3C93C7'
  properties: {
    operationId: apim_caseapi_get_api_casenote_isovertaccap.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_CaseNote_959371DE_C91E_47E7_A41C_44E2A6997A38 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_CaseNote
  name: '959371DE-C91E-47E7-A41C-44E2A6997A38'
  properties: {
    operationId: apim_caseapi_get_api_casenote_isnotecaptravel.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_CaseNote_994CFA92_B21E_4FCD_BBFB_C64A3C307308 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_CaseNote
  name: '994CFA92-B21E-4FCD-BBFB-C64A3C307308'
  properties: {
    operationId: apim_caseapi_post_api_casenote_savecasenote.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_CaseNote_9C1E410A_A8A8_4D30_9020_5F36809D6B5B 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_CaseNote
  name: '9C1E410A-A8A8-4D30-9020-5F36809D6B5B'
  properties: {
    operationId: apim_caseapi_post_api_casenote_completetask.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_CaseNote_9C53508B_33C9_41F2_900C_26C2E63C0FC4 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_CaseNote
  name: '9C53508B-33C9-41F2-900C-26C2E63C0FC4'
  properties: {
    operationId: apim_caseapi_post_api_casenote.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_CaseNote_B941E33D_E4AD_46BE_B7C6_38F71593AEB1 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_CaseNote
  name: 'B941E33D-E4AD-46BE-B7C6-38F71593AEB1'
  properties: {
    operationId: apim_caseapi_get_api_casenote_getcaseidfromnoteid.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_CaseNote_C63EDC94_4E13_41F4_9F13_45C596C55395 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_CaseNote
  name: 'C63EDC94-4E13-41F4-9F13-45C596C55395'
  properties: {
    operationId: apim_caseapi_get_api_casenote_casenoteservicereferralconsultant.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_CaseNote_CD395BBB_03CB_48EB_8438_4B83AE95A7CB 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_CaseNote
  name: 'CD395BBB-03CB-48EB-8438-4B83AE95A7CB'
  properties: {
    operationId: apim_caseapi_get_api_casenote_getsplibrarynameforcaseid.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_CaseNote_CF9CAC5D_D28D_4B90_B9D9_E40D1838D6EF 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_CaseNote
  name: 'CF9CAC5D-D28D-4B90-B9D9-E40D1838D6EF'
  properties: {
    operationId: apim_caseapi_post_api_casenote_updatetask.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_CaseNote_D042D148_9B17_4176_840A_888FC389DE84 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_CaseNote
  name: 'D042D148-9B17-4176-840A-888FC389DE84'
  properties: {
    operationId: apim_caseapi_get_api_casenote_isexcludedfromtaccap.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_CaseNote_EC48D76B_40E5_456B_BB5E_79E8015FE873 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_CaseNote
  name: 'EC48D76B-40E5-456B-BB5E-79E8015FE873'
  properties: {
    operationId: apim_caseapi_get_api_casenote_case_caseid.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_CaseNote_EE9EEACF_C89F_42C5_8ED4_24C1EB266E3B 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_CaseNote
  name: 'EE9EEACF-C89F-42C5-8ED4-24C1EB266E3B'
  properties: {
    operationId: apim_caseapi_get_api_casenote_getloggedinconsultantworkgroup.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_CaseNote_FC991999_F78C_4C23_8E5E_C91622F0293C 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_CaseNote
  name: 'FC991999-F78C-4C23-8E5E-C91622F0293C'
  properties: {
    operationId: apim_caseapi_post_api_casenote_savectfixedcasenote.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_Consultant_9B856A97_5C0B_49A1_A0A4_23B2138820C2 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_Consultant
  name: '9B856A97-5C0B-49A1-A0A4-23B2138820C2'
  properties: {
    operationId: apim_caseapi_get_api_consultant_filter_referral_referralid_service_serviceid.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_PdfMerge_AC150CB5_F658_48BA_B648_7C2FA7E9B9D5 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_PdfMerge
  name: 'AC150CB5-F658-48BA-B648-7C2FA7E9B9D5'
  properties: {
    operationId: apim_pdf_merge_PdfMerge.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_Referral_EA141C55_936E_4614_A236_0607F77DE9B5 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_Referral
  name: 'EA141C55-936E-4614-A236-0607F77DE9B5'
  properties: {
    operationId: apim_caseapi_get_api_referral_filter_case_caseid.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_Service_65D5E517_569D_4CC8_9542_F88AD00ECD00 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_Service
  name: '65D5E517-569D-4CC8-9542-F88AD00ECD00'
  properties: {
    operationId: apim_caseapi_get_api_service_filter_referral_referralid.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_Tac_2146D8D9_BABA_4F82_93EA_E2AECD22099B 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_Tac
  name: '2146D8D9-BABA-4F82-93EA-E2AECD22099B'
  properties: {
    operationId: apim_caseapi_get_api_tac_filter_case_caseid_referral_referralid_service_serviceid.id
  }
  dependsOn: [

    apim

  ]
}

resource apim_TacIndex_FA71FC87_979D_4794_B025_F77F7794333C 'Microsoft.ApiManagement/service/tags/operationLinks@2022-09-01-preview' = {
  parent: apim_TacIndex
  name: 'FA71FC87-979D-4794-B025-F77F7794333C'
  properties: {
    operationId: apim_caseapi_get_api_tacindex_filter_case_caseid_service_serviceid_tac_tacid.id
  }
  dependsOn: [

    apim

  ]
}
