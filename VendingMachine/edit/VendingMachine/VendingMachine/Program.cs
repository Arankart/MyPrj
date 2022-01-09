using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

namespace VendingMachine
{
    internal class Program : Strategy
    {

        public static string filePath = @"D:\prj\_programming\VendingMachine\edit\VendingMachine\VendingMachine\bin\Debug\net5.0\BINANCE_BTCUSDT, 15.csv";
        public static SMA sma = new SMA();
        public static Strategy strategy = new Strategy();

        static void Main(string[] args)
        {
            List<Candle> candles = new List<Candle>();
            FileStream aFile = new FileStream(filePath, FileMode.Open);
            StreamReader sr = new StreamReader(aFile);

            string line;

            while ((line = sr.ReadLine()) != null)
            {
                string[] tokensLine = line.Split(new char[] { ',' });
                
                if (tokensLine[0] == "time") continue;

                Candle candle = new Candle
                {
                    time = DateTime.Parse(tokensLine[0]),
                    open = double.Parse(tokensLine[1].Replace('.', ',')),
                    max = double.Parse(tokensLine[2].Replace('.', ',')),
                    min = double.Parse(tokensLine[3].Replace('.', ',')),
                    close = double.Parse(tokensLine[4].Replace('.', ','))
                };

                candles.Add(candle);
                sma.Calculate(candles.TakeLastN(SMA.smaLength));

                bool cross_sma = F.Cross(candle, sma.sum);

                Console.WriteLine($"time: {candle.time:t} \t Open: {candle.open} \t" +
                $" Max: {candle.max} \t Min: {candle.min} \t Close: {candle.close:0.00}" +
                $"\tSMA: {sma.sum:0.0000}" + (cross_sma? " Longuem!" : ""));
                
                strategy.Update(candle, sma);
            }

            sr.Close();

            Console.WriteLine($"Всего {candles.Count()} элементов. \t  Результат: {strategy.results}% {strategy.take_k} {strategy.stop_k}");
            using (FileStream infoFile = new FileStream(@"D:\prj\_programming\VendingMachine\edit\VendingMachine\VendingMachine\bin\Debug\net5.0\result.txt", FileMode.OpenOrCreate))
            {
                byte[] array = System.Text.Encoding.UTF8.GetBytes($"Всего {candles.Count()} элементов. \t");
                infoFile.Write(array, 0, array.Length);
            }
            
            Console.Read();
        }
    }

    class SMA
    {
        public static int smaLength = 100;
        public double sum;
        public void Calculate(List<Candle> candles)
        {
            List<double> candles_close = candles.Select(x => x.close).ToList();
            sum = candles_close.Average();
        }
    }

    class Candle
    {
        public DateTime time;
        public double open;
        public double close;
        public double min;
        public double max;
    }

    class Indicators
    {
        public static void ATR()
        {
            
        }
    }
}
