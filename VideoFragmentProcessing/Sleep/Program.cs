using System;
using System.Timers;
using System.Threading;

namespace SleepTime
{
    class Program
    {
        private static int _sleepTime;
        private static int _time = 0;
        private static AutoResetEvent _autoEvent;

        private static void CheckTime(object sender, ElapsedEventArgs e)
        {
            _time++;
            Console.WriteLine("Sleep time {0} seconds", _sleepTime - _time);
            if (_time == _sleepTime)
            {
                _autoEvent.Set();
            }
        }

        static void Main(string[] args)
        {
            try
            {
                if (args.Length == 0)
                    throw new Exception("The first parameter must contain sleep time in seconds.");

                _sleepTime = int.Parse(args[0]);
                _autoEvent = new AutoResetEvent(false);

                Console.WriteLine("Sleep time {0} seconds", _sleepTime);

                var sleepTimer = new System.Timers.Timer(1000);
                sleepTimer.Start();
                try
                {
                    sleepTimer.Elapsed += CheckTime;
                    _autoEvent.WaitOne();
                }
                finally
                {
                    sleepTimer.Elapsed -= CheckTime;
                    sleepTimer.Dispose();
                    _autoEvent.Dispose();
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
        }
    }
}
