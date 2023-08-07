import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_app/config/config.dart';

final pokemonIdProvider = StateProvider<int>((ref) {
  return  1;
});

final pokemonProvider = FutureProvider.autoDispose.family<String, int>((ref, id) async {
  final name = await PokemonService.getPokemonName(id);
  return name;
});
