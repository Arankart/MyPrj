using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace XamarinForms_da_test02
{
    [XamlCompilation(XamlCompilationOptions.Compile)]

    public partial class Page2 : ContentPage
    {

        public int return_id;

        public InfoPage[] infos =
                {
                    new InfoPage("Сегодня мы с тобой потренируем грудь и трицепц",
                    "Ниже ты найдёшь все упражнения, которые предстоит выполнить, в любом порядке. Давай выберем первое упражнение и начнём!",
                    new List<PracticInfo>()
                    {
                        new PracticInfo("Подтягивания","kek","https://clck.ru/ajdLZ"),
                        new PracticInfo("Жим лёжа","kek","https://clck.ru/ajdNF"),

                    }),

                    new InfoPage("Сегодня мы с тобой потренируем спину и бицепц",
                    "Ниже ты найдёшь все упражнения, которые предстоит выполнить, в любом порядке. " +
                    " Давай выберем первое упражнение и начнём!",
                    new List<PracticInfo>()
                    {
                        new PracticInfo("Подтягивания широким хватом","kek",""),
                        new PracticInfo("Cтановая тяга", "Lower 3 text in this place",""),
                    }),

                    new InfoPage("Сегодня мы с тобой потренируем ноги и пресс",
                    "Ниже ты найдёшь все упражнения, которые предстоит выполнить, в любом порядке. " +
                    " Давай выберем первое упражнение и начнём!",
                    new List<PracticInfo>())
                };

            
        public Page2(int id)
        {
            InitializeComponent();
            NavigationPage.SetHasNavigationBar(this, false);


            int[] rnd = new int[2];

            rnd = Random(0, 3);

            return_id = id;

            // Заполнение тренировки упражнениями

            switch (id)
            {
                case 0:

                    for (int i = 0; i < 1; i++)
                    {
                        infos[id].lpi.Add(new PracticInfo(infos[id].breast[rnd[i]].header, infos[id].breast[rnd[i]].lower, infos[id].breast[rnd[i]].image));
                    }

                    for (int i = 0; i < 2; i++)
                    {
                        infos[id].lpi.Add(new PracticInfo(infos[id].triceps[rnd[i]].header, infos[id].triceps[rnd[i]].lower, infos[id].triceps[rnd[i]].image));
                    };
                    break;

                case 1:
                    for (int i = 0; i < 1; i++)
                    {
                        infos[id].lpi.Add(new PracticInfo(infos[id].back[rnd[i]].header, infos[id].back[rnd[i]].lower, infos[id].back[rnd[i]].image));
                    }

                    for (int i = 0; i < 2; i++)
                    {
                        infos[id].lpi.Add(new PracticInfo(infos[id].biceps[rnd[i]].header, infos[id].biceps[rnd[i]].lower, infos[id].biceps[rnd[i]].image ));
                    };
                    break;

                case 2:
                    for (int i = 0; i < 3; i++)
                    {
                        infos[id].lpi.Add(new PracticInfo(infos[id].legs[rnd[i]].header, infos[id].legs[rnd[i]].lower, infos[id].legs[rnd[i]].image));
                    }
                    break;
            }



            // Создаём элементы страницы

            
/*
            Label random = new Label()
            {
                Margin = new Thickness(16, 4, 16, 16),
                FontAttributes = FontAttributes.Bold,
                HorizontalTextAlignment = TextAlignment.Start,
                Text = $"{rnd[0]}, {rnd[1]}, {rnd[2]}",
                FontSize = 32,
                TextColor = Color.White,
            };*/

            Label infoLabel_main = new Label()
            {
                Margin = new Thickness(16, 4, 16, 16),
                FontAttributes = FontAttributes.Bold,
                HorizontalTextAlignment = TextAlignment.Start,
                Text = infos[id].topWelcomeInfo,
                FontSize = 32,
                TextColor = Color.White,
            };

            Label infoLabel_second = new Label()
            {
                Margin = new Thickness(16, 16, 16, 16),
                FontAttributes = FontAttributes.None,
                HorizontalTextAlignment = TextAlignment.Start,
                Text = infos[id].downWelcomeInfo,
                FontSize = 18,
                TextColor = Color.LightGray,
            };

            Button button_returnToHome = new Button()
            {
                Margin = new Thickness(16, 16, 306, 16),
                Text = "назад",
                Padding = 0,
                FontSize = 18,
                TextTransform = TextTransform.Lowercase,
                TextColor = Color.White,
                BackgroundColor = Color.FromHex("#181818"),
            };

            // Добавляем элементы страницы

            StackLayout stackLayout = new StackLayout()
            {
                BackgroundColor = Color.FromHex("#181818"),
                Children = { /*random,*/ button_returnToHome, infoLabel_main, infoLabel_second }
            };

            ScrollView scrollView = new ScrollView() { };


            // Создаём таблицу

            for (int i = 0; i < infos[id].lpi.Count; i++)
            {

                Grid grid_elements = new Grid()
                {
                    Margin = new Thickness(16, 0, 16, 16),

                    RowDefinitions =
                    {
                        new RowDefinition { Height = 150}
                    },

                    ColumnDefinitions =
                    {
                        new ColumnDefinition {},
                        new ColumnDefinition {}
                    }
                };

                if (i == 0)
                    grid_elements.Margin = new Thickness(16, 32, 16, 16);
                else
                    grid_elements.Margin = new Thickness(16, 0, 16, 16);


                // Создаём информационные элементы для таблицы

                Button image_bttn = new Button()
                {
                    Margin = new Thickness(16),
                    ImageSource = infos[id].lpi[i].image,
                    CornerRadius = 16,
                    ClassId = Convert.ToString(i)
                };

                Label header_label = new Label
                {
                    Text = infos[id].lpi[i].header,
                    Margin = new Thickness(0, 16, 16, 0),
                    TextColor = Color.White,
                    FontSize = 20,
                    FontAttributes = FontAttributes.Bold,
                };

                /*Label lower_label = new Label
                {
                    Text = infos[id].lpi[i].lower,
                    Margin = new Thickness(0, 0, 16, 0),
                    TextColor = Color.Black,
                    FontSize = 14,
                    HorizontalOptions = LayoutOptions.Start,
                    TextTransform = TextTransform.Lowercase,
                };*/


                Frame bg_practic = new Frame()
                {
                    BackgroundColor = Color.FromHex("#2C2C2C"),
                    CornerRadius = 16,
                    HasShadow = false,
                };


                // Добавляем информационные элементы в таблицу

                grid_elements.Children.Add(bg_practic, 0, 0);

                grid_elements.Children.Add(image_bttn, 0, 0);

                grid_elements.Children.Add(header_label, 1, 0);


                Grid.SetColumnSpan(bg_practic, 2);

                image_bttn.Clicked += ToPracticScreen;

                stackLayout.Children.Add(grid_elements);

            };

            // КОНЕЦ ЦИКЛА


            /// Добавляем таблицы на страницу

            button_returnToHome.Clicked += ToMainScreen;

            scrollView.Content = stackLayout;

            this.Content = scrollView;
        }

        public async void ToMainScreen(object sender, EventArgs args)
        {
            await Navigation.PushAsync(new MainPage());
        }

        public async void ToPracticScreen(object sender, EventArgs args)
        {
            Button bttn = (Button)sender;

            string id = Convert.ToString(infos[return_id].lpi.Count);

            switch (bttn.ClassId)
            {

                case "0":
                    id = infos[return_id].lpi[0].header;
                    break;
                case "1":
                    id = infos[return_id].lpi[1].header;
                    break;
                case "2":
                    id = infos[return_id].lpi[2].header;
                    break;
                case "3":
                    id = infos[return_id].lpi[3].header;
                    break;
                case "4":
                    id = infos[return_id].lpi[4].header;
                    break;
                case "5":
                    id = infos[return_id].lpi[5].header;
                    break;

            }


            // !!!!!!!!!! доработать назначения изображения на третью страницу с информацией !!!!!!!!!!!

            await Navigation.PushAsync(new PracticPage(return_id, id, infos[return_id].lpi[return_id].image));
        }

        public int[] Random(int a, int b)
        {
            int[] chisla = new int[b];
            Random rand = new Random((int)DateTime.Now.Ticks);

            for (int j = 0; j < chisla.Length; j++)
            {
                chisla[j] = rand.Next(a, b);
            }


            foreach (int i in chisla)
            {
                switch (i)
                {
                    case 0:
                        if (chisla[i] == chisla[1] || chisla[i] == chisla[2])
                            chisla[i] = rand.Next(a, b);
                        break;

                    case 1:
                        if (chisla[i] == chisla[0] || chisla[i] == chisla[2])
                            chisla[i] = rand.Next(a, b);
                        break;

                    case 2:
                        if (chisla[i] == chisla[1] || chisla[i] == chisla[0])
                            chisla[i] = rand.Next(a, b);
                        break;

                }

                switch (i)
                {
                    case 0:
                        if (chisla[i] == chisla[1] || chisla[i] == chisla[2])
                            chisla[i] = rand.Next(a, b);
                        break;

                    case 1:
                        if (chisla[i] == chisla[0] || chisla[i] == chisla[2])
                            chisla[i] = rand.Next(a, b);
                        break;

                    case 2:
                        if (chisla[i] == chisla[1] || chisla[i] == chisla[0])
                            chisla[i] = rand.Next(a, b);
                        break;

                }
            }

            return chisla;
        }
    }
}