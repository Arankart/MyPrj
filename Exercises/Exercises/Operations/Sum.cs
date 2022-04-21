using System;



namespace Exercises
{
    class Sum : Operation
    {
        public float z { get; set; }

        public Sum(float _a, float _b) : base(_a, _b)
        {
            this.z = _a + _b;
        }

        public override void Calculate() => Console.WriteLine("Sum = " + z);
    }
}


    
 

