import 'package:flutter/material.dart';
import 'package:primeiro_projeto/components/task.dart';
import 'package:primeiro_projeto/data/task_inherited.dart';
import 'package:primeiro_projeto/screens/form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    double calculoBarraGeral = 0;
    int somaNiveis = 0;
    int somaDificuldades = 0;
    for (Task i in TaskInherited.of(context).taskList) {
      somaNiveis += i.nivel;
      somaDificuldades += i.dificuldade;
    }
    calculoBarraGeral += (somaNiveis / somaDificuldades) / 10;
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: Container(
            height: 40,
            color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 200,
                    child: LinearProgressIndicator(
                      color: Colors.white,
                      value: calculoBarraGeral,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Nível: $somaNiveis',
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                Container(
                  height: 60,
                  width: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {});
                    },
                    child: Image.network('https://www.kindpng.com/picc/m/220-2203430_png-file-refresh-icon-png-transparent-png-download.png'),
                  ),
                ),
              ],
            ),
          ),
        ),
        title: Text("Tarefas"),
      ),
      body: ListView(
        children: TaskInherited.of(context).taskList,
        padding: EdgeInsets.only(top: 8, bottom: 70),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(
                taskContext: context,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
