import 'package:api_task/widgets/dialog.dart';
import 'package:flutter/material.dart';
import '../logic/api_integration.dart';
import 'detailedScreen.dart';
import '../widgets/deleteButton.dart';

class AppHome extends StatefulWidget {
  @override
  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  Future<List<User>> futureUsers;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureUsers = fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List of users"),
      ),
      body: FutureBuilder<List<User>>(
        future: futureUsers,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<User> users = snapshot.data;
            return ListView(
              children: users
                  .map((m) => Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: ListTile(
                          tileColor: Colors.grey[300],
                          title: Text(m.name),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailedPage(id: m.userId),
                              ),
                            );
                          },
                          trailing: DeleteButton(id: m.userId),
                        ),
                      ))
                  .toList(),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner.
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, child: PopUpDialog());
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
