using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FunctionApp
{
    public class StorageDetails
    {
        public string SourceContainerName { get; set; }
        public string StorageAccountName { get; set; }
        public string DestContainerName { get; set; }
        public string BlobName { get; set; }
    }
}
