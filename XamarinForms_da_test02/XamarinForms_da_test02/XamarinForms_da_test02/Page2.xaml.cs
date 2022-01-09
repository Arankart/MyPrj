using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace XamarinForms_da_test02
{
    public class PracticInfo
    {
        string header;
        string lower;
        string image;

        public PracticInfo(string header, string lower, string image)
        {
            this.header = header;
            this.lower = lower;
            this.image = image;
        }
    }

    public class Info
    {
        string header;
        string lower;
        List<PracticInfo> lpi = new List<PracticInfo>();

        public Info(string header, string lower, List<PracticInfo> lpi)
        {
            this.header = header;
            this.lower = lower;
            this.lpi = lpi;
        }
    } 

    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class Page2 : ContentPage
    {
        public Page2()
        {
            InitializeComponent();

            Info[] infos = {
                new Info("1","2",new List<PracticInfo>() {new PracticInfo("1","2","3")}),
                new Info("1","2",new List<PracticInfo>()),
                new Info("1","2",new List<PracticInfo>()),
            };

            List<string> header = new List<string>() { "Header 1", "Header 2", "Header 3", "Header 4" };

            List<string> lower = new List<string>() { "Lower 1 text in this place", "Lower 2 text in this place", "Lower 3 text in this place", "Lower 4 text in this place" };


            // Создаём элементы страницы

            Title = "Тренировочная страница";

            Label infoLabel_main = new Label()
            {
                Margin = new Thickness(16),
                FontAttributes = FontAttributes.Bold,
                HorizontalTextAlignment = TextAlignment.Start,
                Text = "Сегодня мы с тобой потренируем грудь и плечи",
                FontSize = 32,
                TextColor = Color.Black,
            };

            Label infoLabel_second = new Label()
            {
                Margin = new Thickness(16, 16, 16, 16),
                FontAttributes = FontAttributes.None,
                HorizontalTextAlignment = TextAlignment.Start,
                Text = "Ниже ты найдёшь все упражнения, которые предстоит выполнить, в любом порядке. Давай выберем первое упражнение и начнём!",
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

            for (int i = 0; i < header.Count(); i++)
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

                };

                Label header_label = new Label
                {
                    Text = header[i],
                    Margin = new Thickness(0, 16, 16, 0),
                    TextColor = Color.Black,
                    FontSize = 20,
                    FontAttributes = FontAttributes.Bold,
                };

                Label lower_label = new Label
                {
                    Text = lower[i],
                    Margin = new Thickness(0, -10, 16, 0),
                    TextColor = Color.Black,
                    FontSize = 14,
                    HorizontalOptions = LayoutOptions.Start,
                    TextTransform = TextTransform.Lowercase,
                };

                /*Button practic_bttn = new Button()
                {
                    BackgroundColor = Color.FromHex("#FFFFFF"),
                    CornerRadius = 16,
                    Opacity = 0,

                };*/

                Frame bg_practic = new Frame()
                {
                    BackgroundColor = Color.FromHex("#FFFFFF"),
                    CornerRadius = 16,
                    HasShadow = false,
                };


                // Добавляем информационные элементы в таблицу

                grid_elements.Children.Add(bg_practic, 0, 0);

                //grid_elements.Children.Add(practic_bttn, 0, 0);

                grid_elements.Children.Add(image_bttn, 0, 0);

                grid_elements.Children.Add(header_label, 1, 0);

                grid_elements.Children.Add(lower_label, 1, 1);


                Grid.SetRowSpan(image_bttn, 2);
                Grid.SetColumnSpan(bg_practic, 2);
                Grid.SetRowSpan(bg_practic, 2);


                stackLayout.Children.Add(grid_elements);

            };

            // КОНЕЦ ЦИКЛА


            /// Добавляем таблицы на страницу

            button_returnToHome.Clicked += ChangeScreen;

            scrollView.Content = stackLayout;

            this.Content = scrollView;
        }

        public async void ChangeScreen(object sender, EventArgs args)
        {
            await Navigation.PushAsync(new MainPage());
        }
    }
}