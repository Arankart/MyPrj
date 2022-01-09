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
        public bool tricepc, back, leg;

        public MainPage()
        {
            InitializeComponent();

            Title = "Начальная страница";
        }

        public void Button_Clicked(object sender, EventArgs args)
        {
/*            if (text_ch == true)
            {
                MyButton.Text = "I've been clicked!";
                text_ch = false;
            }
            else
            {
                MyButton.Text = "Click Me!";
                text_ch = true;
            }*/
        }

        public async void ChangeScreen(object sender, EventArgs args)
        {
            await Navigation.PushAsync(new Page2());
            /*
            if (tricepc_bttn.Clicked)
                tricepc = true;
            else if (back_bttn.Clicked +=)
                back = true;
            else if (legs_bttn.Clicked +=)
                leg = true; */
        }
    }
}
