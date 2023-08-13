class Todo {
  final String id;

  final String description;
  final DateTime? completedAt;

  const Todo({
    required this.id,
    required this.description,
    this.completedAt,
  });

  bool get done => completedAt != null;

  Todo copyWith({
    String? description,
    DateTime? completedAt,
  }) =>
      Todo(
        id: id,
        description: description ?? this.description,
        completedAt: completedAt ,
      );
}
