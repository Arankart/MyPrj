using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Xamarin.Forms;

namespace XamarinForms_da_test02
{
    public partial class MainPage : ContentPage
    {

        public MainPage()
        {
            InitializeComponent();

            Title = "Начальная страница";
        }

        public void Button_Clicked(object sender, EventArgs args)
        {

        }

        public async void ChangeScreen(object sender, EventArgs args)
        {
            Button btn = (Button)sender;

            int id = -1;

            switch (btn.ClassId)
            {
                case "tricepc_bttn":
                    id = 0;
                    break;
                case "back_bttn":
                    id = 1;
                    break;
                case "legs_bttn":
                    id = 2;
                    break;
            }

            await Navigation.PushAsync(new Page2(id));
        }
    }
}
