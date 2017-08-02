using System;
using System.IO;
using System.Xml.Serialization;
using RecordingConfigData;

namespace LibRecordingConfig
{
    public class RecordingConfigSerializer
    {
        public RecordingConfig Deserialize(string fileName)
        {
            using(var reader = new StreamReader(fileName))
            {
                var serializer = new XmlSerializer(typeof(RecordingConfig));
                return (RecordingConfig)serializer.Deserialize(reader);
            }
        }

        public RecordingConfig DeserializeFromString(string data)
        {
#if DEBUG
            using (var reader = new StringReader(data))
            {
                var xml = reader.ReadToEnd();
                Console.WriteLine("\nConfig:\n" + xml);
            }
#endif
            using (var reader = new StringReader(data))
            {
                var serializer = new XmlSerializer(typeof(RecordingConfig));
                return (RecordingConfig)serializer.Deserialize(reader);
            }
        }

        public void Serialize(string fileName, RecordingConfig config)
        {
            using(var writer = new StreamWriter(fileName))
            {
                var serializer = new XmlSerializer(typeof(RecordingConfig));
                serializer.Serialize(writer, config);
            }
        }

        public string SerializeToString(RecordingConfig config)
        {
            using (var writer = new StringWriter())
            {
                var serializer = new XmlSerializer(typeof(RecordingConfig));
                serializer.Serialize(writer, config);

                return writer.ToString();
            }
        }
    }
}
