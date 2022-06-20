using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Windows.Input;

namespace ToDoList_wpf
{
    public class TasksListViewModel : INotifyPropertyChanged
    {
        private ObservableCollection<TasksModel> Tasks = new ObservableCollection<TasksModel>(); 
        public ObservableCollection<TasksModel> tasks
        {
            get => Tasks;
            set { 
                if (Tasks != value)
                {
                    Tasks = value;
                    NotifyPropertyChanged(nameof(tasks));
                }
                
            }
        }

        public string taskName { get; set; }
        public ICommand CreateTaskCommand { get { return new CreateTaskCommand(); } }

        public event PropertyChangedEventHandler PropertyChanged;

        private void NotifyPropertyChanged(string name)
        {
            PropertyChanged(this, new PropertyChangedEventArgs(name));
        }
    }
}
