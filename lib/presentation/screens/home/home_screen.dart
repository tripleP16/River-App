import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const _HomeWidget(),
    );
  }
}

class _HomeWidget extends StatelessWidget {
  const _HomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        _CustomListTile(
          title: 'State Provider',
          subtitle: 'Un estado simple',
          location: '/state-provider',
        ),
        _CustomListTile(
          title: 'Future Provider',
          subtitle: 'Un estado que se resuelve en el futuro + family',
          location: '/future-provider',
        ),
        _CustomListTile(
          title: 'Stream Provider',
          subtitle: 'Un simple stream',
          location: '/stream-provider',
        ),
        _CustomListTile(
          title: 'State Notifier',
          subtitle: 'Un estado que se actualiza con un StateNotifier',
          location: '/state-notifier',
        ),
      //
      ],
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String location;
  const _CustomListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.location,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
      onTap: () => context.push(location)
    );
  }
}

