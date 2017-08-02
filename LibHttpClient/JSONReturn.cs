using System.Runtime.Serialization;

namespace LibHttpClient
{
    //  The container of returned data for conversion into JSON.
    [DataContract]
    public class JsonReturn
    {
        [DataMember]
        public bool Success;

        [DataMember]
        public string Message;
    }
}