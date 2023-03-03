import 'package:flutter/material.dart';
import 'package:realm/realm.dart';

import '../shared/services/realm/models/task_model.dart';
import '../shared/widgets/user_image_button.dart';
import 'widgets/custom_drawer.dart';
import 'widgets/task_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text('Listinha'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(
              right: 8,
            ),
            child: UserImageButton(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pushNamed('./edit');
        },
        label: const Text('Nova lista'),
        icon: const Icon(Icons.edit),
      ),
      body: Center(
        child: Stack(
          children: [
            ListView.separated(
              padding: const EdgeInsets.only(
                top: 65,
                left: 30,
                right: 30,
                bottom: 200,
              ),
              itemBuilder: (_, index) {
                final board = TaskBoardModel(
                  Uuid.v4(),
                  'Nova lista de tarefas',
                  // tasks: [
                  //   TaskModel(Uuid.v4(), '', complete: true),
                  //   TaskModel(Uuid.v4(), '', complete: true),
                  //   TaskModel(Uuid.v4(), ''),
                  //   TaskModel(Uuid.v4(), ''),
                  //   TaskModel(Uuid.v4(), '', complete: true),
                  // ],
                );
                return TaskCard(
                  board: board,
                  height: 140,
                );
              },
              itemCount: 100,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 10,
                );
              },
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: SegmentedButton<int>(
                  segments: const [
                    ButtonSegment<int>(
                      value: 0,
                      label: Text('Todos'),
                    ),
                    ButtonSegment<int>(
                      value: 1,
                      label: Text('Pendentes'),
                    ),
                    ButtonSegment<int>(
                      value: 2,
                      label: Text('Concluídas'),
                    ),
                    ButtonSegment<int>(
                      value: 3,
                      label: Text('Desativadas'),
                    ),
                  ],
                  selected: const {0},
                  onSelectionChanged: (values) {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
