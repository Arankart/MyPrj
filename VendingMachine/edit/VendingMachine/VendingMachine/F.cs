using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VendingMachine
{
    enum Direct
    {
        None, Long, Short
    }

    internal class F
    {
        public static bool Cross(Candle candle, double price) => candle.close > price && candle.min < price;

        public static double PercBetweenValues(double open, double close, Direct direct)
        {
            return (direct == Direct.Long ? close / open : open / close) - 1;
        }
    }

    public static class Extensions
    {
        public static List<T> TakeLastN<T>(this List<T> collection, int n)
        {
            int k = collection.Count();
            if (n > k) n = k;

            List<T> temp = new List<T>();
            for (int i = k - n; i < k; i++)
                temp.Add(collection[i]);
            return temp;
        }
    }
}
