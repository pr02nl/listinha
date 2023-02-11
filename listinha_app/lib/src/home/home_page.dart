import 'package:flutter/material.dart';

import '../shared/widgets/user_image_button.dart';
import 'widgets/custom_drawer.dart';

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
        onPressed: () {},
        label: const Text('Nova lista'),
        icon: const Icon(Icons.edit),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
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
          ],
        ),
      ),
    );
  }
}
