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
  final int? id;
  final String title;
  final TaskStatus status;
  final DateTime? dueDate;
  final List<String> tags;

  const TaskModel({
    this.id,
    required this.title,
    this.status = TaskStatus.notStarted,
    this.dueDate,
    this.tags = const [],
  });

  TaskModel copyWith({
    int? id,
    String? title,
    TaskStatus? status,
    DateTime? dueDate,
    List<String>? tags,
  }) {
    return TaskModel(
      id: id ?? this.id,
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
