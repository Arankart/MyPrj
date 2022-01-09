using System;
using Tinkoff.Trading.OpenApi.Network;
using System.Threading.Tasks;
using Tinkoff.Trading.OpenApi.Models;
using System.Collections.Generic;

namespace TeslaStocksStream_da_v01
{

    class Program
    {
        static void Main(string[] args)
        {
            Start().Wait();
            Console.ReadKey();
        }

        async static Task Start()
        {
            // токен аутентификации
            var token = "t.hj3tKGcsyLqSW_SiAMGqRAEp-hfDjyaiKU2rkCe9vgyVxHfrf4fqGF1aZR_0JlTfMx3oG-qhG_fxbD29S0yP5w";

            // для работы в песочнице используйте GetSandboxConnection
            var connection = ConnectionFactory.GetConnection(token);
            var context = connection.Context;

            var tsla = await context.MarketSearchByTickerAsync("TSLA");
            var result = tsla.Instruments[0];
            string figi = result.Figi;
            Console.WriteLine(result.Name + " " + figi);


            await context.SendStreamingRequestAsync(StreamingRequest.SubscribeCandle(figi, CandleInterval.FiveMinutes));
            context.StreamingEventReceived += Context_StreamingEventReceived;
            Console.WriteLine();
            //var startDT = new DateTime(2021, 11, 22);
            //var endDT = new DateTime(2021, 11, 26);
            //var candles = await context.MarketCandlesAsync(figi, startDT, endDT, CandleInterval.Day);
            //foreach(var candle in candles.Candles)
            //{
            //    Console.WriteLine($"{candle.Time} {candle.Open} {candle.Low}");
            //}


        }

        private static void Context_StreamingEventReceived(object sender, StreamingEventReceivedEventArgs e)
        {
            var response = (CandleResponse)e.Response;
            CandlePayload candle = response.Payload;
            Console.WriteLine($"time:{candle.Time.AddHours(3)} open:{candle.Open} close:{candle.Close}");
        }
    }
}
