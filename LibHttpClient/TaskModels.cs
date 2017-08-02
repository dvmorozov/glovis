using System;
using System.ComponentModel.DataAnnotations;

namespace LibHttpClient
{
    public class CreateTaskModel
    {
        /// <summary>
        /// Unique task identifier.
        /// </summary>
        [Microsoft.Build.Framework.Required]
        [Display(Name = "Task ID")]
        public Guid TaskId { get; set; }

        
        [Microsoft.Build.Framework.Required]
        [DataType(DataType.Text)]
        [Display(Name = "XML-template")]
        public string Template { get; set; }

        /// <summary>
        /// The domain name of the portal to upload data back.
        /// </summary>
        [Microsoft.Build.Framework.Required]
        [DataType(DataType.Text)]
        [Display(Name = "Portal domain or IP")]
        public string PortalDomain { get; set; }

        /// <summary>
        /// The port number of the portal to upload data back.
        /// </summary>
        [Microsoft.Build.Framework.Required]
        [Display(Name = "Portal port")]
        public int PortalPort { get; set; }

        [Microsoft.Build.Framework.Required]
        [DataType(DataType.Text)]
        [Display(Name = "Portal user name")]
        public string PortalUserName { get; set; }

        [Microsoft.Build.Framework.Required]
        [DataType(DataType.Text)]
        [Display(Name = "Portal password")]
        public string PortalPassword { get; set; }

        /// <summary>
        /// The domain name of source of data.
        /// </summary>
        [Microsoft.Build.Framework.Required]
        [DataType(DataType.Text)]
        [Display(Name = "Source domain or IP")]
        public string SourceDomain { get; set; }

        /// <summary>
        /// The port number of source of data.
        /// </summary>
        [Microsoft.Build.Framework.Required]
        [Display(Name = "Source port")]
        public int SourcePort { get; set; }

        /// <summary>
        /// The length of captured video fragment.
        /// </summary>
        [Microsoft.Build.Framework.Required]
        [Display(Name = "Fragment length (in sec.)")]
        public int FragmentLength { get; set; }

        /// <summary>
        /// The video proxy port number.
        /// </summary>
        [Microsoft.Build.Framework.Required]
        [Display(Name = "Video proxy port")]
        public int VideoProxyPort { get; set; }

        /// <summary>
        /// Optional operation identifier.
        /// </summary>
        [Microsoft.Build.Framework.Required]
        [Display(Name = "Operation ID")]
        public string OperationId { get; set; }
    }
}
