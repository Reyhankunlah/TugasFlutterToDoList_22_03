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

class Task {
  final String title;
  final TaskStatus status;
  final DateTime? dueDate;
  final List<String> tags;

  const Task({
    required this.title,
    this.status = TaskStatus.notStarted,
    this.dueDate,
    this.tags = const [],
  });

  Task copyWith({
    String? title,
    TaskStatus? status,
    DateTime? dueDate,
    List<String>? tags,
  }) {
    return Task(
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
