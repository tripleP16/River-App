import 'package:random_name_generator/random_name_generator.dart';

class RandomGenerator {
  static String getRandomName() {
    final randomNames = RandomNames(Zone.catalonia);
    return randomNames.fullName();
  }


  static Stream<String> getRandomNameStream() {
    return Stream.periodic(const Duration(seconds: 2), (_) => getRandomName());
  }
}