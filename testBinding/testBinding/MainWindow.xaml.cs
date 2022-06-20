using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace testBinding
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public HumanList listHuman = new HumanList();

        public MainWindow()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            listHuman.list.Add(new Human { title = titleBtnn.Text, description = descriptionBtnn.Text});
            countList.Content = Convert.ToString(listHuman.list.Count);
            listView.ItemsSource = listHuman.list;
            InitializeComponent();
        }

        private void Button_Click_delete(object sender, RoutedEventArgs e)
        {
            countList.Content = Convert.ToString(listHuman.list.Count);
            listHuman.list.Clear();
            InitializeComponent();
        }
    }

    public class Human
    {
        public string title { get; set; }
        public string description { get; set; }
    }

    public class HumanList
    {
        public List<Human> list { get; set; }

        public HumanList()
        {
            list = new List<Human>()
            {
            new Human { title = "Задача", description = "Описание задачи" },
            new Human { title = "Задача", description = "Описание задачи" },
            new Human { title = "Задача", description = "Описание задачи" },
            new Human { title = "Задача", description = "Описание задачи" },
            new Human { title = "Задача", description = "Описание задачи" },
            new Human { title = "Задача", description = "Описание задачи" },
            new Human { title = "Задача", description = "Описание задачи" },
            new Human { title = "Задача", description = "Описание задачи" },
            new Human { title = "Задача", description = "Описание задачи" },
            new Human { title = "Задача", description = "Описание задачи" },
            };
        }
    }
}
