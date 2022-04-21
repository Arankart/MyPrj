namespace Exercises
{
    abstract class Operation
    {
        public float a { get; set; }
        public float b { get; set; }

        protected Operation() { }
        protected Operation(float _a, float _b)
        {
            a = _a;
            b = _b;
        }

        public abstract void Calculate();
    }
}


    
 

