import 'package:task_app/domain/subentity/data_marker.dart';
import 'package:task_app/domain/subentity/task_status.dart';

class TaskEntity {
  const TaskEntity(
      {required this.id,
      required this.title,
      required this.description,
      required this.deadline,
      required this.owner,
      required this.status,
      required this.stat,
      this.isPriority = false});
  final String id;
  final String title;
  final String description;
  final DateTime deadline;
  final String owner;
  final TaskStatus status;
  final DateStat stat;
  final bool isPriority;

  @override
  String toString() {
    return "Task(id: $id, title: $title, description: $description, deadline: $deadline, owner: $owner, status: $status, stat: $stat, isPriority: $isPriority)";
  }
}
