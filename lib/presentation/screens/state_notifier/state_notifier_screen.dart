import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_app/presentation/providers/providers.dart';

class TodosScreen extends ConsumerWidget {
  const TodosScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de invitados'),
      ),
      body: const _TodosView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.add ),
        onPressed: () {
          ref.read(todosProvider.notifier).add();

        },
      ),
    );
  }
}


class _TodosView extends ConsumerWidget {
  const _TodosView();

  @override
  Widget build(BuildContext context, WidgetRef ref ) {

    final _todos = ref.watch(todosProvider);

    return ListView.builder(
      itemCount: _todos.length,
      itemBuilder: (context, index) {
        final todo = _todos[index];
        return SwitchListTile(
            title: Text( todo.description),
            value: (todo.completedAt != null),

            // True o False
            onChanged: ( value ) {
              ref.read(todosProvider.notifier).toggle(todo.id);
            }
        );
      },
    );
  }
}