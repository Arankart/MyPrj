using System.Collections.Generic;

namespace Store_da_v01
{
    class Shop
    {
        public Hoodi hoodi = new Hoodi();
        public Pants pants = new Pants();
    }

    class Hoodi
    {
        public string[] color = {"black", "grey", "beige", "blue"};
        public double countHoodi = 9;
        public double cashHoodi = 260;
    }

    class Pants
    {
        public string[] color = { "black", "grey", "beige", "blue" };
        public double countPants = 6;
        public double cashPants = 150;
    }
}
