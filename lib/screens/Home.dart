import 'package:api_task/widgets/dialog.dart';
import 'package:flutter/material.dart';
import '../logic/api_integration.dart';
import 'detailedScreen.dart';
import '../widgets/deleteButton.dart';
import 'package:get/get.dart';
import 'package:residemenu/residemenu.dart';
import '../routes/Transparentroute.dart';
import 'Slider.dart';

class AppHome extends StatefulWidget {
  @override
  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> with TickerProviderStateMixin {
  Future<List<User>> futureUsers;
  ApiController controller = Get.put(ApiController());
  MenuController _menuController;
  bool _dark = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureUsers = controller.fetchUser();
    _menuController =
        new MenuController(vsync: this, direction: ScrollDirection.LEFT);
  }

  void theme(BuildContext context) {
    if (MediaQuery.of(context).platformBrightness == Brightness.dark) {
      setState(() {
        Get.changeTheme(ThemeData.dark());
      });
    } else {
      setState(() {
        Get.changeTheme(ThemeData.light());
      });
    }
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
          titleStyle: TextStyle(color: _dark ? Colors.white : Colors.black),
        ),
        onTap: () {
          if (msg1 == "Users") {
            _menuController.closeMenu();
            Get.offAll(AppHome());
          }
          Get.snackbar("My Menu", msg1);
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
          color: _dark ? Colors.grey[900] : Colors.white),
      leftScaffold: new MenuScaffold(
        header: new ConstrainedBox(
          constraints: new BoxConstraints(maxHeight: 80.0, maxWidth: 80.0),
          child: new CircleAvatar(
            // backgroundImage: new AssetImage('images/author.jpeg'),
            radius: 40.0,
          ),
        ),
        children: <Widget>[
          buildItem("Users"),
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
          actions: [
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                Navigator.of(context).push(TransparentRoute(
                    builder: (BuildContext context) => SliderScreen()));
              },
            ),
            // IconButton(
            //   icon: Icon(Icons.dark_mode),
            //   onPressed: () {
            //     Navigator.of(context).push(TransparentRoute(
            //         builder: (BuildContext context) => SliderScreen()));
            //   },
            // )
            FlatButton(
              child: Text("dark"),
              onPressed: () {
                _dark = !_dark;
                if (_dark) {
                  Get.changeTheme(ThemeData.dark());
                } else {
                  Get.changeTheme(ThemeData.light());
                }
              },
            )
          ],
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
                            title: Text(
                              m.name,
                              style: TextStyle(color: Colors.black),
                            ),
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
