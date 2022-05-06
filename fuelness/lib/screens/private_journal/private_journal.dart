import 'package:flutter/material.dart';

class PrivateJournal extends StatefulWidget {
  @override
  State<PrivateJournal> createState() => _PrivateJournalState();
}

class _PrivateJournalState extends State<PrivateJournal> {
  List<Map<String, dynamic>> thoughts = [];
  final todoTitleController = TextEditingController();
  final todoDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 50),
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/background.jpeg"),
            fit: BoxFit.cover,
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 30, 10, 100),
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
                    itemCount: thoughts.length,
                    itemBuilder: (BuildContext context, int index) {
                      var map = thoughts[index];
                      var title = map['title'];
                      var description = map['description'];

                      return Column(
                        children: <Widget>[
                          ListTile(
                            title: Text("$title", style: const TextStyle(fontSize: 16),),
                            subtitle: Text("$description", style: const TextStyle(fontSize: 13)),

                          ),
                          const Divider(
                            height: 2.0,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              todoTitleController.clear();
              todoDescriptionController.clear();
              return AlertDialog(
                backgroundColor: Colors.amber[800],
                title: const Text("New thought"),
                content: Form(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: todoTitleController,
                        autofocus: true,
                        textCapitalization: TextCapitalization.sentences,
                        strutStyle: StrutStyle.disabled,
                        decoration: InputDecoration(
                          hintText: 'Title',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        style: const TextStyle(
                          fontSize: 13
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: todoDescriptionController,
                        autofocus: true,
                        textCapitalization: TextCapitalization.sentences,
                        maxLines: 4,
                        strutStyle: StrutStyle.disabled,
                        decoration: InputDecoration(
                          hintText: 'Description',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        style: const TextStyle(
                            fontSize: 11
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            thoughts.add({
                              'title': todoTitleController.text,
                              'description': todoDescriptionController.text,
                            });
                          });
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.amber[800]
                        ),
                        child: const Text('Add'),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.add_rounded),
        tooltip: 'New thought',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
