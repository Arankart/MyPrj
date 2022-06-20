using CsvHelper;
using LINQtoCSV;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using VkNet;
using VkNet.Enums.Filters;
using VkNet.Model;
using VkNet.Model.RequestParams;

namespace ParsingVkGroupWall_da_v01
{
    internal class Program  
    {
        static void Main(string[] args)
        {

            // включает русскую кодировку в консоле
            Console.OutputEncoding = System.Text.Encoding.UTF8;

            string pathCsvFile = "D:\\programmingLanguages.csv";
            string postDesc;
            string link_group = "https://vk.com/otkritie_hroniki?w=wall-111820755_";
            int postId;
            int postsCount = 0;
            int totalPosts = 0;
            int offset = 0;

            List<DC> dc = new List<DC>{ };

            DateTime postDate;

            List<string> date = new List<string>();
            List<string> time = new List<string>();
            List<string> id = new List<string>();

            ///////////////////

            #region Авторизация по токену

            string token = "6ebcbb6a4d3bfd0ed2de6bafb1dea0ec95a7ecf3c323dbf1b28506de2a34ba3d6c6dd56ae405612c653e6";

            VkApi api = Authorize(token);

            #endregion

            #region Забираем посты со стены

            Console.WriteLine("Забираем посты со стены, немного подождите...");

            var get = api.Wall.Get(new WallGetParams
            {
                Domain = "otkritie_hroniki",
                Count = 100,
                Offset = Convert.ToUInt64(offset),
                Filter = VkNet.Enums.SafetyEnums.WallFilter.Owner,
            });

            totalPosts = Convert.ToInt32(get.TotalCount);

            Console.WriteLine($"Всего постов в группе: {get.TotalCount}");

            for (int i = 0; date.Count < totalPosts; i++)
            {
                get = api.Wall.Get(new WallGetParams
                {
                    Domain = "otkritie_hroniki",
                    Count = 100,
                    Offset = Convert.ToUInt64(offset),
                    Filter = VkNet.Enums.SafetyEnums.WallFilter.Owner,
                });

                foreach (var post in get.WallPosts)
                {
                    string link_and_id = link_group;

                    postId = Convert.ToInt32(post.Id);
                    Console.WriteLine($"{postId} пост");

                    Console.WriteLine($"Дата публикации: {post.Date}");
                    postDate = (DateTime)post.Date;

                    Console.WriteLine($"{postsCount} пост");
                    postDesc = post.Text;
                    Console.WriteLine(post.Text);

                    Console.ForegroundColor = ConsoleColor.Red;
                    Console.WriteLine("—————————————");

                    Console.ResetColor();

                    link_and_id += postId.ToString();

                    date.Add(post.Text);
                    time.Add(Convert.ToString(postDate));
                    id.Add(link_and_id);

                    dc.Add(new DC { postId = Convert.ToString(link_and_id), postData = (Convert.ToString(postDate)), postText = post.Text });

                    postsCount++;
                }

                if (offset < totalPosts)
                    offset = offset + 100;
            }


            #endregion

            FileSave(dc);

            Console.ReadKey();
        }

        private static VkApi Authorize(string token)
        {
            VkApi api = new VkApi();

            api.Authorize(new ApiAuthParams
            {
                AccessToken = token
            });
            return api;
        }

        public static void FileSave (List<DC> list)
        {
            var csvFileDescription = new CsvFileDescription
            {
                FirstLineHasColumnNames = true,
                SeparatorChar = ',',
            };

            var csvContex = new LINQtoCSV.CsvContext();
            csvContex.Write(list, "posts_openHronics.csv", csvFileDescription);


            MessageBox.Show("Файл успешно сохранён!");
        }
    }

    public class DC
    {
        public string postText { get; set; }
        public string postId { get; set; }
        public string postData { get; set; }


    }

}
