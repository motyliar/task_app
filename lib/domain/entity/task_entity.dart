import 'package:task_app/domain/subentity/task_status.dart';

class TaskEntity {
  const TaskEntity(
      {required this.title,
      required this.description,
      required this.deadline,
      required this.owner,
      required this.status});

  final String title;
  final String description;
  final DateTime deadline;
  final String owner;
  final TaskStatus status;
}
