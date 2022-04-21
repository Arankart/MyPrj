using System;

namespace StudentAndTeacher_v01
{
    class Student : People
    {
        public int count = 0;
        public Student(){}
        public override void Who() 
        {
            if (count < 3) { Console.WriteLine("S: I'm a student"); }
            else { Console.WriteLine("S: Wtf man?"); }
            count++;
        }
    }
}
