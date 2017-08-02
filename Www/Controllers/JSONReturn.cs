using System.Runtime.Serialization;

namespace web.Controllers
{
    //  The container of returned data for conversion into JSON.
    //  evernote:///view/14501366/s132/a42a53cf-6930-4d3d-9a88-3da81a3fc880/a42a53cf-6930-4d3d-9a88-3da81a3fc880/
    [DataContract]
    public class JsonReturn
    {
        [DataMember]
        public bool Success;

        [DataMember]
        public string Message;
    }
}