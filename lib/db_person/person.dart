import 'package:floor/floor.dart';

@entity
class Person {
  @primaryKey
  final int? id;

  final String name;

  final String lastName;

  Person({this.id, required this.name, required this.lastName});
}
