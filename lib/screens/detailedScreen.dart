import 'package:api_task/widgets/dialogUpdate.dart';
import 'package:flutter/material.dart';
import '../logic/api_integration.dart';

class DetailedPage extends StatefulWidget {
  final int id;
  DetailedPage({this.id});
  @override
  _DetailedPageState createState() => _DetailedPageState();
}

class _DetailedPageState extends State<DetailedPage> {
  Future<User> futureUser;

  @override
  void initState() {
    futureUser = detailedUser(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detailed view"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder<User>(
          future: futureUser,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "User Details:",
                      style: TextStyle(fontSize: 20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.create,
                          ),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) =>
                                    PopUpDialogUpdate(id: widget.id));
                          },
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      width: MediaQuery.of(context).size.width,
                      // color: Colors.red,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.black.withOpacity(0.3))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name: ${snapshot.data.name}",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.email,
                                color: Colors.brown[400],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(snapshot.data.email)
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_city,
                                color: Colors.blueAccent,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                  "${snapshot.data.suite} ${snapshot.data.street}"),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                // color: Colors.blueAccent,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(snapshot.data.city),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.language,
                                // color: Colors.blueAccent,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(snapshot.data.website),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
