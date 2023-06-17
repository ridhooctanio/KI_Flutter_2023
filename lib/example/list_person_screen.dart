import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:ki_flutter_2023/db_person/app_database.dart';
import 'package:ki_flutter_2023/db_person/person.dart';

class ListPersonScreen extends StatefulWidget {
  const ListPersonScreen({super.key});

  @override
  State<ListPersonScreen> createState() => _ListPersonScreenState();
}

class _ListPersonScreenState extends State<ListPersonScreen> {
  final nameController = TextEditingController();
  final searchController = TextEditingController();

  List<Person> listPersons = [];

  @override
  void initState() {
    super.initState();

    getAllData();
  }

  Future<void> getAllData() async {
    final database = await databaseLocal;
    final datas = await database.personDao.findAllPersons();
    setState(() {
      listPersons = datas;
    });
  }

  Future<Person?> getData({required int id}) async {
    final database = await databaseLocal;
    final data = await database.personDao.findPersonById(id);
    return data;
  }

  Future<void> saveData({required String name}) async {
    final database = await databaseLocal;
    await database.personDao.insertPerson(Person(name: name, lastName: 'Doe'));

    getAllData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Person'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.person),
                labelText: 'Find person by ID',
                hintText: 'Fill here',
                suffixIcon: IconButton(
                  onPressed: () {
                    final id = int.parse(searchController.text);
                    getData(id: id).then(
                      (person) {
                        if (person != null) {
                          showSnacbar(
                              context: context,
                              message: 'Data ${person.name} ditemukan');
                        } else {
                          showSnacbar(
                              context: context,
                              message: 'Data tidak ditemukan');
                        }
                      },
                    );
                  },
                  icon: const Icon(Icons.search),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: listPersons.length,
              itemBuilder: (context, index) {
                final data = listPersons[index];
                return ListTile(
                  title: Text(data.name),
                  subtitle: Text(data.lastName),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showForm(context: context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void showSnacbar({required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void showForm({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Input Data'),
          content: TextField(
            controller: nameController,
            decoration: const InputDecoration(hintText: 'Isi disini'),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  saveData(name: nameController.text);
                  Navigator.pop(context);
                },
                child: const Text('OK'))
          ],
        );
      },
    );
  }
}
