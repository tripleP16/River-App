import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_app/config/config.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entities/todos.dart';

const uuid = Uuid();

final todosProvider = StateNotifierProvider<TodosNotifier, List<Todo> >((ref) {
  return TodosNotifier();
});


class TodosNotifier extends StateNotifier<List<Todo>> {
  TodosNotifier(): super([
    Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
    Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
    Todo(
      id: uuid.v4(),
      description: RandomGenerator.getRandomName(),
      completedAt: DateTime.now(),
    ),
    Todo(
      id: uuid.v4(),
      description: RandomGenerator.getRandomName(),
      completedAt: null,
    )
  ]);

  void add() {
    state = [
      ...state,
      Todo(
        id: uuid.v4(),
        description: RandomGenerator.getRandomName(),
        completedAt: null,
      )
    ];
  }

  void toggle(String id) {
    state = state.map((todo) {
      if(todo.id != id) return todo;

      if(todo.done) return todo.copyWith(completedAt: null);

      return todo.copyWith(completedAt: DateTime.now());
    }).toList();
  }


}