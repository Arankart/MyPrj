using System;

namespace VendingMachine
{
    internal class Strategy
    {
        public int open_pos;
        public double priceBuy;
        public double take => priceBuy * 1.01;
        public double stop => priceBuy * 0.99;
        public double results;
        public int stop_k;
        public int take_k;
        public bool Open() => open_pos > 0;


        public void Update(Candle candle, SMA sma)
        {
            if (Open())
                Check_sell(candle);
            else
                Check_buy(candle, sma.sum);
        }
        public void Check_buy(Candle candle, double sum)
        {
            if (F.Cross(candle, sum))
            {
                Buy(candle);
            }
        }

        public void Check_sell(Candle candle)
        {
            if (candle.max > take)
                Sell(candle, false);
            else if (candle.min < stop)
                Sell(candle, true);
        }

        public void Buy(Candle candle)
        {
            priceBuy = candle.open;
            open_pos = 1;
            Console.WriteLine($"{candle.time} купили по {priceBuy}$");
        }

        public void Sell(Candle candle, bool isStop)
        {
            var result = F.PercBetweenValues(priceBuy, isStop ? stop:take, Direct.Long);
            Console.WriteLine($"{candle.time} результат {result*100}%");
            if (isStop)
                stop_k++;
            else
                take_k++;
            results += result;
            open_pos = 0;
        }
    }
}