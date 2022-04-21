using System;

namespace StudentAndTeacher_v01
{
    class Teacher : People
    {
        public int count = 0;
        public Teacher() { }
        public override void Who()
        {
            count++;
            if (count < 4) { Console.WriteLine("T: I'm a teacher"); }
            else { Console.WriteLine("Close the programm"); /* Environment.Exit(0); */}

        }
    }
}
