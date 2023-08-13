import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';

class PokemonScreen extends ConsumerWidget {
  const PokemonScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final pokemonId = ref.watch(pokemonIdProvider);
    // final pokemonAsyncValue = ref.watch(pokemonProvider(pokemonId));
    final pokemonAsyncValue = ref.watch(pokemonProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemon:  $pokemonId'),
      ),
      body: Center(
        child: pokemonAsyncValue.when(
          data: (pokemonName) => Text(pokemonName),
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Text(error.toString()),
        ),
      ),
      floatingActionButton:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton(
          onPressed: () {
            ref.read(pokemonIdProvider.notifier).update((state) => state + 1);
          },
          child: const Icon(Icons.exposure_plus_1),
        ),
        const SizedBox(height: 8),
        FloatingActionButton(
          onPressed: () {
            ref.read(pokemonIdProvider.notifier).update((state) => state - 1 );
            
          },
          child: const Icon(Icons.exposure_minus_1),
        ),
      ]),
    );
  }
}
