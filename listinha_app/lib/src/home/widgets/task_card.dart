import 'package:flutter/material.dart';
import 'package:listinha/src/shared/services/realm/models/task_model.dart';

enum TaskCardStatus {
  pending(iconData: Icons.access_time, title: 'Pendente'),
  completed(iconData: Icons.check_circle, title: 'Concluído'),
  disabled(iconData: Icons.alarm_off, title: 'Desabilitado'),
  ;

  final String title;
  final IconData iconData;

  const TaskCardStatus({
    required this.title,
    required this.iconData,
  });
}

class TaskCard extends StatelessWidget {
  final TaskBoardModel board;
  final double height;
  const TaskCard({
    super.key,
    required this.board,
    this.height = 130,
  });

  double getProgress(List<TaskModel> tasks) {
    final total = tasks.length;
    if (total == 0) {
      return 0;
    }
    final completed = tasks.where((task) => task.complete).length;
    return completed / total;
  }

  String getProgressText(List<TaskModel> tasks) {
    final total = tasks.length;
    final completed = tasks.where((task) => task.complete).length;
    return '$completed/$total';
  }

  TaskCardStatus getStatus(TaskBoardModel board, double progress) {
    if (!board.enabled) {
      return TaskCardStatus.disabled;
    } else if (progress == 1) {
      return TaskCardStatus.completed;
    } else {
      return TaskCardStatus.pending;
    }
  }

  Color getBackgroundColor(TaskCardStatus status, ThemeData theme) {
    switch (status) {
      case TaskCardStatus.pending:
        return theme.colorScheme.primaryContainer;
      case TaskCardStatus.completed:
        return theme.colorScheme.tertiaryContainer;
      case TaskCardStatus.disabled:
        return theme.colorScheme.errorContainer;
    }
  }

  Color getColor(TaskCardStatus status, ThemeData theme) {
    switch (status) {
      case TaskCardStatus.pending:
        return theme.colorScheme.primary;
      case TaskCardStatus.completed:
        return theme.colorScheme.tertiary;
      case TaskCardStatus.disabled:
        return theme.colorScheme.error;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final progress = getProgress(board.tasks);
    final progressText = getProgressText(board.tasks);
    final title = board.title;
    final status = getStatus(board, progress);
    final statusText = status.title;
    final iconData = status.iconData;
    final backgroundColor = getBackgroundColor(status, theme);
    final color = getColor(status, theme);
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(25),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                iconData,
                color: theme.iconTheme.color?.withOpacity(0.5),
              ),
              const Spacer(),
              Text(
                statusText,
                style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.textTheme.bodySmall?.color?.withOpacity(0.5),
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            title,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Visibility(
            visible: board.tasks.isNotEmpty,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 8,
                ),
                LinearProgressIndicator(
                  value: progress,
                  color: color,
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  progressText,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.textTheme.bodySmall?.color?.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
