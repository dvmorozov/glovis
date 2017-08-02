using System;
using System.Globalization;
using LibAppStarter;

namespace TestLibAppStarter
{
    class Program
    {
        static void Main(string[] args)
        {
            try
            {
                var requestor = new AppStarterRequestor("http://localhost:2376", "Administrator", "dmitry!morozov");
                string d = DateTime.Now.ToString(CultureInfo.InvariantCulture);
                Guid g = Guid.NewGuid();
                requestor.CreateTask(g, d, d);

                Console.WriteLine("Press any key to modify the task {0}.", g);
                Console.ReadKey();
                requestor.EditTask(g, "test processes info", false, true);

                Console.WriteLine("Press any key to delete the task {0}.", g);
                Console.ReadKey();
                requestor.DeleteTask(g);

                Console.WriteLine("Press any key to exit.");
                Console.ReadKey();
            }
            catch (Exception e)
            {
                Console.WriteLine("Exception: {0}", e.Message);   
            }
        }
    }
}
