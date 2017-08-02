using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Xml.Serialization;
using VideoFragmentData;

namespace LibVideoFragmentManifest
{
    public class VideoFragmentManifestSerializer
    {
        public VideoFragmentManifest Deserialize(string fileName)
        {
            using(var reader = new StreamReader(fileName))
            {
                XmlSerializer serializer = new XmlSerializer(typeof(VideoFragmentManifest));
                return (VideoFragmentManifest)serializer.Deserialize(reader);
            }
        }

        public void Serialize(string fileName, VideoFragmentManifest manifest)
        {
            using(var writer = new StreamWriter(fileName))
            {
                XmlSerializer serializer = new XmlSerializer(typeof(VideoFragmentManifest));
                serializer.Serialize(writer, manifest);
            }
        }
    }
}
