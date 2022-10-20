import 'package:flutter/material.dart';
import 'package:primeiro_projeto/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Task> taskList = [
    Task('Aprender Flutter', 3, 'assets/images/flutter.png'),
    Task('Bike', 2, 'assets/images/bike.jpg'),
    Task('Ler', 1, 'assets/images/ler.jpg'),
    Task('Meditar', 5, 'assets/images/meditar.jpeg'),
    Task('Jogar', 3, 'assets/images/jogar.jpg'),
  ];

  void newTask(String name, String photo, int difficulty) {
    taskList.add(Task(name, difficulty, photo));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
