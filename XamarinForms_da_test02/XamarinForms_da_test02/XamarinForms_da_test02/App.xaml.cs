using System;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace XamarinForms_da_test02
{
    public partial class App : Application
    {
        
        public App()
        {
            InitializeComponent();

            MainPage = new NavigationPage(new Page2(1));
        }

        protected override void OnStart()
        {
        }

        protected override void OnSleep()
        {
        }

        protected override void OnResume()
        {
        }
    }
}
