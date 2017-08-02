using System.IO;

namespace AppStarterScript
{
    class Folder
    {
        /// <summary>
        /// Deletes the folder and all its content.
        /// </summary>
        /// <param name="folderName">Folder name.</param>
        public static void DeleteFolderWithContent(string folderName)
        {
            try
            {
                //  Deletes files.
                var dir = new DirectoryInfo(folderName);
                foreach (var file in dir.GetFiles()) file.Delete();
                //  Deletes the folder.
                Directory.Delete(folderName);
            }
            catch
            {
                //  Ignores exception when the directory already deleted.
            }
        }
    }
}
