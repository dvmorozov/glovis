﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан программой.
//     Исполняемая версия:4.0.30319.1008
//
//     Изменения в этом файле могут привести к неправильной работе и будут потеряны в случае
//     повторной генерации кода.
// </auto-generated>
//------------------------------------------------------------------------------

// 
// This source code was auto-generated by xsd, Version=4.0.30319.1.
// 
namespace ProcessConfigData {
    using System.Xml.Serialization;
    
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("xsd", "4.0.30319.1")]
    [System.SerializableAttribute()]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType=true, Namespace="urn:xmlns:ProcessConfig")]
    [System.Xml.Serialization.XmlRootAttribute(Namespace="urn:xmlns:ProcessConfig", IsNullable=false)]
    public partial class ProcessConfig {
        
        private int youTubeUploaderPIDField;
        
        private int eventDetectorPIDField;
        
        private int videoProxyPIDField;
        
        private int videoFragmentManifestMakerPIDField;
        
        private string videoFragmentManifestMakerStopEventField;
        
        /// <remarks/>
        public int YouTubeUploaderPID {
            get {
                return this.youTubeUploaderPIDField;
            }
            set {
                this.youTubeUploaderPIDField = value;
            }
        }
        
        /// <remarks/>
        public int EventDetectorPID {
            get {
                return this.eventDetectorPIDField;
            }
            set {
                this.eventDetectorPIDField = value;
            }
        }
        
        /// <remarks/>
        public int VideoProxyPID {
            get {
                return this.videoProxyPIDField;
            }
            set {
                this.videoProxyPIDField = value;
            }
        }
        
        /// <remarks/>
        public int VideoFragmentManifestMakerPID {
            get {
                return this.videoFragmentManifestMakerPIDField;
            }
            set {
                this.videoFragmentManifestMakerPIDField = value;
            }
        }
        
        /// <remarks/>
        public string VideoFragmentManifestMakerStopEvent {
            get {
                return this.videoFragmentManifestMakerStopEventField;
            }
            set {
                this.videoFragmentManifestMakerStopEventField = value;
            }
        }
    }
}
