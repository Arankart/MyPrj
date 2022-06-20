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

namespace ToDoList_wpf
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            var tasks = new TasksListViewModel();
            tasks.tasks.Add(new TasksModel() { name = "Task - 1", complete = false });
            tasks.tasks.Add(new TasksModel() { name = "Task - 2", complete = true });
            this.DataContext = tasks;

        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("Just telegramma");
        }
    }
}
