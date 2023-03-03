import 'package:flutter_test/flutter_test.dart';
import 'package:listinha/src/home/widgets/task_card.dart';
import 'package:listinha/src/shared/services/realm/models/task_model.dart';
import 'package:realm/realm.dart';

void main() {
  final board = TaskBoardModel(
    Uuid.v4(),
    'Nova lista de tarefas',
  );

  test('getProgress', () {
    final tasks = [
      TaskModel(Uuid.v4(), '', complete: true),
      TaskModel(Uuid.v4(), '', complete: true),
      TaskModel(Uuid.v4(), ''),
      TaskModel(Uuid.v4(), ''),
      TaskModel(Uuid.v4(), '', complete: true),
    ];
    final progress = TaskCard(
      board: board,
    ).getProgress(tasks);
    expect(progress, 0.6);
  });
}
