using System;
using System.Windows.Input;

namespace ToDoList_wpf
{
    public class CreateTaskCommand : ICommand
    {
        public event EventHandler? CanExecuteChanged;

        public bool CanExecute(object? parameter)
        {
            return true;
        }

        public void Execute(object? parameter)
        {
            if (parameter is TasksListViewModel taskList)
            {
                taskList.tasks.Add(new TasksModel() { name = taskList.taskName, complete = false });
            }
        }
    }
}