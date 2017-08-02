using System;

namespace VideoFragmentManifestMaker
{
    public class ConsoleHeartbeat
    {
        private int _count = 0;
        private readonly int _maxBeats;

        public ConsoleHeartbeat(int maxBeats)
        {
            _maxBeats = maxBeats;
        }

        public void Beat()
        {
            if (_count < _maxBeats)
                Console.Write('.');

            _count++;

            if (_count == _maxBeats + 1)
            {
                Console.Write(new string('\x08', _maxBeats));
                Console.Write(new string(' ', _maxBeats));
                Console.Write(new string('\x08', _maxBeats));

                _count = 0;
            }
        }
    }
}
