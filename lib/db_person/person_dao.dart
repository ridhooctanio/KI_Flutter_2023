import 'package:floor/floor.dart';
import 'package:ki_flutter_2023/db_person/person.dart';

@dao
abstract class PersonDao {
  @insert
  Future<void> insertPerson(Person person);

  @Query('SELECT * FROM Person')
  Future<List<Person>> findAllPersons();

  @Query('SELECT * FROM Person WHERE id = :id')
  Future<Person?> findPersonById(int id);
}
