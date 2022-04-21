using System;



namespace Exercises
{
    class Min : Operation
    {
        public float z { get; set; }

        public Min(float _a, float _b) : base(_a, _b)
        {
            this.z = _a - _b;
        }

        public override void Calculate() => Console.WriteLine("Min = " + z);
    }
}


    
 

