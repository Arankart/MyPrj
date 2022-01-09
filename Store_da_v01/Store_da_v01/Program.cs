using System;
using System.Linq;

namespace Store_da_v01
{
    class Program
    {
        static void Main(string[] args)
        {
            Card card = new Card();
            Wallet wallet = new Wallet();

            double moneyNow;

            Console.WriteLine($"____________ Сегодня я иду в мазагин и у меня осталось денег {card.cardMoneyCount + wallet.walletMoneyCount}$ ____________\n");
            Console.WriteLine("Приветствуем вас в магазине Born to be. Что вас интересует?\n");

            User user = new User();
            Bag bag = new Bag();

            user.GetHello();

            moneyNow = Shopping();

            ByShop(bag, moneyNow);

        }

        private static void ByShop(Bag bag, double moneyNow)
        {
            Card card = new Card();
            Wallet wallet = new Wallet();
            if (bag.item.Count > 0)
                Console.WriteLine("Жаль, значит приду в следующий раз");
            else
            {
                Console.WriteLine("Классно теперь у меня есть");

                for (int i = 0; i < bag.item.Count; i++)
                {
                    string name = bag.item[i];
                    Console.WriteLine($"{name} \n");
                }
                Console.WriteLine($"Осталось все денег: {moneyNow}$");
            }

            Console.ReadKey();
        }

        static double Shopping()
        {
            Shop shop = new Shop();
            User user = new User();
            Card card = new Card();
            Wallet wallet = new Wallet();
            Bag bag = new Bag();

            double moneyNow = 1;

            if (shop.hoodi.countHoodi >= 0 | shop.pants.countPants >= 0)
            {
                Console.Write($"У нас есть {shop.hoodi.countHoodi} худи и {shop.pants.countPants} штанов. \n");
                Console.Write($"\nЧто вы хотите приобрести? \n<<< Если хотите худи, введите 1, если хотите штаны, введите 2, а после нажмите Enter >>>\n");

                int choise = Convert.ToInt32(Console.ReadLine());

                moneyNow = ChoiseItem(bag, card, wallet, shop, choise);

            }
            
            return moneyNow;
        }

        private static double ChoiseItem(Bag bag, Card card, Wallet wallet, Shop shop, int choise)
        {
            int dick = 8;
            string chs = null;
            double moneyNow = 0;

            while (dick == 8)
            {
                if (choise == 1)
                {
                    Console.Write("Какого цвета вы хотите худи? Введите в строчку ниже. У нас есть: ");

                    for (int i = 0; i < shop.hoodi.color.Length; i++)
                    {

                        if (shop.hoodi.color.Last() != shop.hoodi.color[i])
                            Console.Write($"{shop.hoodi.color[i]}, ");
                        else
                            Console.Write($"{shop.hoodi.color[i]}.");
                    }

                    Console.WriteLine("\n");
                    chs = Console.ReadLine();
                    dick = 1;
                }

                else if (choise == 2)
                {
                    Console.Write("Какого цвета вы хотите штаны? Введите в строчку ниже. У нас есть: ");

                    for (int i = 0; i < shop.pants.color.Length; i++)
                    {

                        if (shop.pants.color.Last() != shop.pants.color[i])
                            Console.Write($"{shop.pants.color[i]}, ");
                        else
                            Console.Write($"{shop.pants.color[i]}.");
                    }

                    Console.WriteLine("\n");
                    chs = Console.ReadLine();
                    dick = 2;
                }

                else
                {
                    Console.Write("Вы выбрали что-то не то, попробуйте ещё раз");
                    dick = 8;
                }

            }


            if (Convert.ToInt32(dick) == 1)
            {
                Console.Write($"\nСпасибо, я выбираю {chs} худи\n");
                Console.Write($"\nЦена на худи цвета {chs} = {shop.hoodi.cashHoodi}\n");

                if (card.cardMoneyCount < shop.hoodi.cashHoodi | wallet.walletMoneyCount < shop.hoodi.cashHoodi)
                {
                    string hoodi = "pants" + chs;
                    bag.item.Add(hoodi);

                    if (wallet.walletMoneyCount > shop.hoodi.cashHoodi)
                        moneyNow = wallet.walletMoneyCount - shop.hoodi.cashHoodi + card.cardMoneyCount;
                    else
                        moneyNow = card.cardMoneyCount - shop.hoodi.cashHoodi + wallet.walletMoneyCount;
                }

                else
                    Console.WriteLine("Извините, но у вас недостаточно средств");
            }  

            else if (Convert.ToInt32(dick) == 2)
            {
                Console.Write($"\nСпасибо, я выбираю {chs} штаны. Сколько они стоят?\n");
                Console.Write($"\nЦена на штаны цвета {chs} = {shop.pants.cashPants}\n");

                if (card.cardMoneyCount > shop.pants.cashPants | wallet.walletMoneyCount > shop.pants.cashPants)
                {
                    string pants = "pants" + chs;
                    bag.item.Add(pants);

                    if (wallet.walletMoneyCount > shop.pants.cashPants)
                        moneyNow = wallet.walletMoneyCount - shop.pants.cashPants + card.cardMoneyCount;
                    else
                        moneyNow = card.cardMoneyCount - shop.pants.cashPants + wallet.walletMoneyCount;
                }

                else
                    Console.WriteLine("Извините, но у вас недостаточно средств");
            }
                

            return moneyNow;
        }

        static void UserChoise()
        {
            Console.Write("");
        }
    }

    class User
    {
        public Card card;
        public Wallet wallet;
        public Bag bag;
        public Date date;

        public void GetHello() { Console.WriteLine("Здравствуйте, а что у вас есть?\n"); }
    }

    class Store
    {
        public Shop shop;
        public Warehouse warehouse;
    }
}
