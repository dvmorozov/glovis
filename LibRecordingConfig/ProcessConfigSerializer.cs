using System.IO;
using System.Xml.Serialization;
using ProcessConfigData;

namespace LibRecordingConfig
{
    public class ProcessConfigSerializer
    {
        public string SerializeToString(ProcessConfig config)
        {
            using (var writer = new StringWriter())
            {
                var serializer = new XmlSerializer(typeof(ProcessConfig));
                serializer.Serialize(writer, config);

                return writer.ToString();
            }
        }

        public ProcessConfig DeserializeFromString(string data)
        {
            using (var reader = new StringReader(data))
            {
                var serializer = new XmlSerializer(typeof(ProcessConfig));
                return (ProcessConfig)serializer.Deserialize(reader);
            }
        }
    }
}
