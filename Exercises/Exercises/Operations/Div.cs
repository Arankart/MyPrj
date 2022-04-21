using System;



namespace Exercises
{
    class Div : Operation
    {
        public float z { get; set; }

        public Div(float _a, float _b) : base(_a, _b)
        {
            this.z = _a / _b;
        }

        public override void Calculate() => Console.WriteLine("Div = " + z);
    }
}


    
 

