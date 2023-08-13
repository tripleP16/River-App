import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_app/presentation/providers/providers.dart';

class StreamScreen extends ConsumerWidget {
  const StreamScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final randomNames$ = ref.watch(namesStreamProvider);
    // if(!randomNames$.hasValue){
    //   return const  Scaffold(
    //     body: Center(
    //       child: CircularProgressIndicator(),
    //     ),
    //   );
    // }
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream'),

      ),
      body: randomNames$.when(
          data: (names) => Center(
            child: Text(names),
          ),
          error: (error, stackTrace) => Center(
            child: Text(error.toString()),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          )
      )
    );
  }
}
