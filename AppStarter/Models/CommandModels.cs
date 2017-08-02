
using System;
using System.ComponentModel.DataAnnotations;

namespace web.Models
{
    public class OperationResultModel
    {
        /// <summary>
        /// Unique operation identifier.
        /// </summary>
        [Required]
        [DataType(DataType.Text)]
        [Display(Name = "Operation id.")]
        public string OperationId { get; set; }

        [Required]
        [DataType(DataType.Text)]
        [Display(Name = "Message")]
        public string Message { get; set; }

        [Required]
        [DataType(DataType.Text)]
        [Display(Name = "Success")]
        public string Success { get; set; }
    }
}