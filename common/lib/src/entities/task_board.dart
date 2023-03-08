import 'package:common/src/value_objects/value_object.dart';
import 'package:result_dart/result_dart.dart';

import '../value_objects/text_vo.dart';
import '../value_objects/uuid_vo.dart';
import 'entity.dart';
import 'task.dart';

enum TaskBoardStatus { completed, pending, disable }

class TaskBoard extends Entity {
  final UuidVO id;
  final List<Task> tasks;
  final TaskBoardStatus status;
  final TextVO title;

  TaskBoard({
    required this.id,
    required this.tasks,
    required this.status,
    required this.title,
  });

  factory TaskBoard.empty() {
    return TaskBoard(
      id: const UuidVO(''),
      status: TaskBoardStatus.disable,
      tasks: [],
      title: const TextVO(''),
    );
  }

  @override
  Validation validator([Object? _]) {
    return id
        .validator() //
        .flatMap(title.validator)
        .flatMap(_validateTasks);
  }

  Validation _validateTasks([Object? _]) {
    return tasks.fold<Validation>(const Success(unit), (value, task) {
      return value.flatMap(task.validator);
    });
  }
}
