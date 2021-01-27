import 'package:api_task/widgets/dialog.dart';
import 'package:flutter/material.dart';
import '../logic/api_integration.dart';
import 'detailedScreen.dart';
import '../widgets/deleteButton.dart';
import 'package:get/get.dart';
import 'package:residemenu/residemenu.dart';

class AppHome extends StatefulWidget {
  @override
  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> with TickerProviderStateMixin {
  Future<List<User>> futureUsers;
  ApiController controller = Get.put(ApiController());
  MenuController _menuController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureUsers = controller.fetchUser();
    _menuController =
        new MenuController(vsync: this, direction: ScrollDirection.LEFT);
  }

  Widget buildItem(String msg1) {
    return new Material(
      color: Colors.transparent,
      child: new InkWell(
        child: ResideMenuItem(
          title: msg1,
          icon: const Icon(
            Icons.home,
          ),
          titleStyle: TextStyle(color: Colors.black),
          right: null,
        ),
        onTap: () {
          Scaffold.of(context)
              .showSnackBar(new SnackBar(content: new Text("MyMenu")));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new ResideMenu.scaffold(
      enableFade: false,
      controller: _menuController,
      decoration: new BoxDecoration(
          // image: new DecorationImage(
          //     image: new AssetImage("images/menu_background.png"),
          //     fit: BoxFit.none),
          color: Colors.white),
      leftScaffold: new MenuScaffold(
        header: new ConstrainedBox(
          constraints: new BoxConstraints(maxHeight: 80.0, maxWidth: 80.0),
          child: new CircleAvatar(
            // backgroundImage: new AssetImage('images/author.jpeg'),
            radius: 40.0,
          ),
        ),
        children: <Widget>[
          buildItem("Account"),
          buildItem("Profile"),
          buildItem("Wallet"),
          buildItem("Sign Up"),
          buildItem("Register")
        ],
      ),
      child: new Scaffold(
        appBar: AppBar(
          leading: new GestureDetector(
            child: const Icon(Icons.menu),
            onTap: () {
              _menuController.openMenu(true);
            },
          ),
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
                              Get.to(DetailedPage(
                                id: m.userId,
                              ));
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
          },
          child: Icon(Icons.add),
        ),
      ),
      onClose: () {
        print("closed");
      },
      onOpen: (left) {
        print(left);
      },
      onOffsetChange: (offset) {},
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _menuController.dispose();
    super.dispose();
  }
}
