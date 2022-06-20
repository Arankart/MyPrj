using Caliburn.Micro;
using System.Collections.Generic;

namespace ToDoList_wpf_v02
{
    
    public class TaskObjectList
    {
        public List<TaskObject> taskList { get; set; }

        public TaskObjectList()
        {
            taskList = new List<TaskObject>(){
                new TaskObject(){title = "Task 1", description = "Description 1"},
                new TaskObject(){title = "Task 2", description = "Description 2"},
                new TaskObject(){title = "Task 2", description = "Description 2 Description 2 Description 2 Description 2 Description 2 Description 2"},
                new TaskObject(){title = "Task 2", description = "Description 2"},
                new TaskObject(){title = "Task 2", description = "Description 2"},
                new TaskObject(){title = "Task 2", description = "Description 2"},
                new TaskObject(){title = "Task 3", description = "Description 3"}
            };
        }
    
        
    }
}
