using System;
using System.Collections.Generic;
using System.Text;

namespace Metanit
{
    internal class Program
    {
        static void Main(string[] args)
        {
            int choise = 0;
            bool close = false;

            List<Task> tasks = new List<Task>()
            {
                new Task {title = "Task 1", description = "This is random text", readiness = false },
                new Task {title = "Task 2", description = "This is random text", readiness = false },
                new Task {title = "Task 3", description = "This is random text", readiness = false }
            };

            Console.WriteLine("Welcom to <<To do huist>>");

            Console.WriteLine("\nВсе задачи:");
            ShowTasks(tasks);
            
            while(close == false)
            {
                choise = 0;
                
                WhatToDo(tasks);

                while(choise != 3 ^ choise != 2 ^ choise != 1)
                {
                    string str = Console.ReadLine();
                    if (str == "1" ^ str == "2" ^ str == "3")
                        choise = Convert.ToInt32(str);

                    else
                        WhatToDo(tasks);
                }

                if (tasks.Count > 0)
                {
                    switch (choise)
                    {
                        case 1:
                            AddTask(tasks);
                            break;
                        case 2:
                            DeleteTask(tasks, choise);
                            break;
                        case 3:
                            close = true;
                            break;
                    }
                }

                else
                {
                    switch (choise)
                    {
                        case 1:
                            AddTask(tasks);
                            break;
                        case 3:
                            close = true;
                            break;
                    }
                }
            }
        }

        private static void WhatToDo(List<Task> tasks)
        {
            if(tasks.Count > 0)
            Console.WriteLine('\n' + "Что делать дальше? " +
                                "\nЧтобы добавить новую задачу нажмите <1>. " +
                                "\nЧтобы удалить задачу, нажмите <2>. " +
                                "\nЧтобы завершить программу, нажмите <3>:");
            else
                Console.WriteLine('\n' + "Что делать дальше? " +
                                "\nЧтобы добавить новую задачу нажмите <1>. " +
                                "\nЧтобы завершить программу, нажмите <3>:");
        }

        private static void AddTask(List<Task> tasks)
        {
            string _title, _description;

            Console.WriteLine('\n' + "Введите название задачи");
            _title = Console.ReadLine();

            Console.WriteLine("Введите описание задачи");
            _description = Console.ReadLine();

            tasks.Add(new Task { title = _title, description = _description, readiness = false });

            ShowTasks(tasks);
        }

        private static void ShowTasks(List<Task> tasks)
        {
            int count = 1;

            Console.WriteLine("");

            foreach (var task in tasks)
            {
                Console.WriteLine(count + ". " + task.title + "    " + task.description);
                count++;
            }
        }

        private static void DeleteTask(List<Task> tasks, int element)
        {
            Console.WriteLine("Задачу под каким номером вы хотете удалить?:");
            int taskNumber = Convert.ToInt32(Console.ReadLine());

            if (tasks.Count > 0)
                tasks.RemoveAt(taskNumber - 1);
            else
                Console.WriteLine("Нет задач, которые можно удалить");


            if (tasks.Count > 0)
            {
                Console.WriteLine("Оставшиеся задачи:");
                ShowTasks(tasks);
            }
            else
                Console.WriteLine("Список задач пуст, добавьте свою первую задачу");

        }
    }
}
