import 'package:result_dart/result_dart.dart';

import '../entities/task_board.dart';
import '../exceptions/exception.dart';

abstract class TaskBoardService {
  AsyncResult<Unit, ListinhaException> createBoard(TaskBoard board);
}
