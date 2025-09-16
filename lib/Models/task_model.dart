enum TaskStatus { notStarted, inProgress, completed }

extension TaskStatusExtension on TaskStatus {
  String get label {
    switch (this) {
      case TaskStatus.notStarted:
        return "Not Started";
      case TaskStatus.inProgress:
        return "In Progress";
      case TaskStatus.completed:
        return "Completed";
    }
  }
}

class TaskModel {
  final String title;
  final TaskStatus status;
  final DateTime? dueDate;
  final List<String> tags;

  const TaskModel({
    required this.title,
    this.status = TaskStatus.notStarted,
    this.dueDate,
    this.tags = const [],
  });

  TaskModel copyWith({
    String? title,
    TaskStatus? status,
    DateTime? dueDate,
    List<String>? tags,
  }) {
    return TaskModel(
      title: title ?? this.title,
      status: status ?? this.status,
      dueDate: dueDate ?? this.dueDate,
      tags: tags ?? this.tags,
    );
  }

  @override
  String toString() =>
      '$title • ${status.name} • ${dueDate?.toIso8601String() ?? "-"}';
}
