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
    public partial class PracticPage : ContentPage
    {

        public int return_id;

        public PracticPage(int id, string practicName)
        {
            InitializeComponent();

            this.return_id = id;

            StackLayout stackLayout = new StackLayout()
            {
                BackgroundColor = Color.FromHex("#ECEFF1"),
            };

            Image imageFrame = new Image()
            {
                //BackgroundColor = Color.Red,
                WidthRequest = 100,
                HeightRequest = 348,
                //Padding = new Thickness(0, 0, 0, 348),
                Source = "https://vjoy.cc/wp-content/uploads/2019/05/1-54.jpg"
            };

            Label text = new Label()
            {
                Text = Convert.ToString(practicName),
                Margin = new Thickness(16, 4, 16, 16),
                FontAttributes = FontAttributes.Bold,
                HorizontalTextAlignment = TextAlignment.Start,
                FontSize = 32,
                TextColor = Color.Black,
            };

            Button button_returnToInfoScreen = new Button()
            {
                Margin = new Thickness(16, 16, 306, 16),
                Text = "назад",
                Padding = 0,
                FontSize = 18,
                TextTransform = TextTransform.Lowercase,
                TextColor = Color.Black,
                BackgroundColor = Color.FromHex("#ECEFF1"),
            };

            button_returnToInfoScreen.Clicked += ToInfoScreen;

            stackLayout.Children.Add(button_returnToInfoScreen);

            stackLayout.Children.Add(imageFrame);

            stackLayout.Children.Add(text);

            this.Content = stackLayout;
        }

        public async void ToInfoScreen(object sender, EventArgs args)
        {
            await Navigation.PushAsync(new Page2(return_id));
        }
    }
}