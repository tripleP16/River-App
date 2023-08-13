import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_app/config/config.dart';

// final namesStreamProvider = StreamProvider<List<String>>((ref) async* {
//   await Future.delayed(Duration(seconds: 2));
//   yield [];
//   await Future.delayed(Duration(seconds: 2));
//   yield ['John'];
//   await Future.delayed(Duration(seconds: 2));
//   yield ['John', 'Doe'];
//   await Future.delayed(Duration(seconds: 2));
//   yield ['John', 'Doe', 'Jane'];
// });

final namesStreamProvider = StreamProvider.autoDispose<String>((ref) async* {
  // RandomGenerator.getRandomNameStream().listen((event) {
  //   print(event);
  //
  // });
  await for( final name in RandomGenerator.getRandomNameStream()) {
    yield name;
  }
});