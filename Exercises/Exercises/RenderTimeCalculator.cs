using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exercises
{
    internal class RenderTimeCalculator
    {
        static void RenderTime()
        {
            int min, sec, sec_on_frame, scene_frames, time, time_h, time_m;

            Console.WriteLine("Enter your render time on 1 frame");
            Console.Write("Min: ");
            min = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("");

            Console.Write("Sec: ");
            sec = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("");

            Console.Write("All frames in scene: ");
            scene_frames = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("");

            sec_on_frame = min * 60 + sec;
            time = scene_frames * sec_on_frame / 60;
            time_h = time / 60;
            time_m = time - time_h * 60;

            Console.WriteLine($"Your render time: {time_h} hourse, {time_m} min.");
            Console.ReadKey();
        }
       
    }
}
