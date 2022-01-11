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
                    new List<PracticInfo>() {
                        new PracticInfo("Header 1", "Lower 1 text in this place", "Image 1"),
                        new PracticInfo("Header 2", "Lower 2 text in this place", "Image 2"),
                        new PracticInfo("Header 3", "Lower 3 text in this place", "Image 3")
                    }),

                    new InfoPage("Сегодня мы с тобой потренируем спину и бицепц",
                    "Ниже ты найдёшь все упражнения, которые предстоит выполнить, в любом порядке. " +
                    " Давай выберем первое упражнение и начнём!",
                    new List<PracticInfo>() {
                        new PracticInfo("Header 1", "Lower 1 text in this place", "Image 1"),
                        new PracticInfo("Header 2", "Lower 2 text in this place", "Image 2"),
                        new PracticInfo("Header 3", "Lower 3 text in this place", "Image 3")
                    }),

                    new InfoPage("Сегодня мы с тобой потренируем ноги и пресс",
                    "Ниже ты найдёшь все упражнения, которые предстоит выполнить, в любом порядке. " +
                    " Давай выберем первое упражнение и начнём!",
                    new List<PracticInfo>() {
                        new PracticInfo("Header 1", "Lower 1 text in this place", "Image 1"),
                        new PracticInfo("Header 2", "Lower 2 text in this place", "Image 2"),
                        new PracticInfo("Header 3", "Lower 3 text in this place", "Image 3")
                    })
                };

        public Page2(int id)
        {
            InitializeComponent();

            return_id = id;

            infos[id].lpi.Add(new PracticInfo("Header 4", "Lower 34 text in this place", "Image 4"));

            // Создаём элементы страницы


            Label infoLabel_main = new Label()
            {
                Margin = new Thickness(16, 4, 16, 16),
                FontAttributes = FontAttributes.Bold,
                HorizontalTextAlignment = TextAlignment.Start,
                Text = infos[id].topWelcomeInfo,
                FontSize = 32,
                TextColor = Color.Black,
            };

            Label infoLabel_second = new Label()
            {
                Margin = new Thickness(16, 16, 16, 16),
                FontAttributes = FontAttributes.None,
                HorizontalTextAlignment = TextAlignment.Start,
                Text = infos[id].downWelcomeInfo,
                FontSize = 18,
                TextColor = Color.Black,
            };

            Button button_returnToHome = new Button()
            {
                Margin = new Thickness(0, 16, 306, 16),
                Text = "назад",
                Padding = 0,
                FontSize = 18,
                TextTransform = TextTransform.Lowercase,
                TextColor = Color.Black,
                BackgroundColor = Color.FromHex("#ECEFF1"),
            };

            // Добавляем элементы страницы

            StackLayout stackLayout = new StackLayout()
            {
                BackgroundColor = Color.FromHex("#ECEFF1"),
                Children = { button_returnToHome, infoLabel_main, infoLabel_second }
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
                        new RowDefinition { Height = 64 },
                        new RowDefinition { Height = 64 }
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
                    Text = "Image",
                    Margin = new Thickness(16),
                    BackgroundColor = Color.Red,
                    CornerRadius = 16,
                    TextTransform = TextTransform.None,
                    ClassId = Convert.ToString(i),

                };

                Label header_label = new Label
                {
                    Text = infos[id].lpi[i].header,
                    Margin = new Thickness(0, 16, 16, 0),
                    TextColor = Color.Black,
                    FontSize = 20,
                    FontAttributes = FontAttributes.Bold,
                };

                Label lower_label = new Label
                {
                    Text = infos[id].lpi[i].lower,
                    Margin = new Thickness(0, -10, 16, 0),
                    TextColor = Color.Black,
                    FontSize = 14,
                    HorizontalOptions = LayoutOptions.Start,
                    TextTransform = TextTransform.Lowercase,
                };


                Frame bg_practic = new Frame()
                {
                    BackgroundColor = Color.FromHex("#FFFFFF"),
                    CornerRadius = 16,
                    HasShadow = false,
                };


                // Добавляем информационные элементы в таблицу

                grid_elements.Children.Add(bg_practic, 0, 0);

                grid_elements.Children.Add(image_bttn, 0, 0);

                grid_elements.Children.Add(header_label, 1, 0);

                grid_elements.Children.Add(lower_label, 1, 1);


                Grid.SetRowSpan(image_bttn, 2);
                Grid.SetColumnSpan(bg_practic, 2);
                Grid.SetRowSpan(bg_practic, 2);

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

            await Navigation.PushAsync(new PracticPage(return_id, id));
        }
    }
}