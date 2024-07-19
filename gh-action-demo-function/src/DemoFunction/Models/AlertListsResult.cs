using System;

namespace DemoFunction.Models
{
    public class AlertListsResult
    {
        public int count { get; set; }
        public object next { get; set; }
        public object previous { get; set; }
        public Result[] results { get; set; }
    }

    public class Result
    {
        public int id { get; set; }
        public string name { get; set; }
        public object[] sites { get; set; }
        public bool all_sites { get; set; }
        public string list_type { get; set; }
        public DateTime last_modified { get; set; }
        public object[] managers { get; set; }
        public string[] email_recipients { get; set; }
        public object[] sms_recipients { get; set; }
        public int?[] email_recipients_id { get; set; }
        public object[] sms_recipients_id { get; set; }
    }

    /*
    {
        "count": 2,
        "next": null,
        "previous": null,
        "results": [
            {
                "id": 2479,
                "name": "Default",
                "sites": [],
                "all_sites": true,
                "list_type": "black",
                "last_modified": "2022-01-16T05:42:35.741274Z",
                "managers": [],
                "email_recipients": [],
                "sms_recipients": [],
                "email_recipients_id": [],
                "sms_recipients_id": []
            },
            {
                "id": 2438,
                "name": "Realtime Amber Alerts",
                "sites": [],
                "all_sites": true,
                "list_type": "black",
                "last_modified": "2022-01-30T02:43:55.740176Z",
                "managers": [],
                "email_recipients": [
                    "alice@localtest.me"
                ],
                "sms_recipients": [],
                "email_recipients_id": [
                    3959
                ],
                "sms_recipients_id": []
            }
        ]
    }
    */
}
