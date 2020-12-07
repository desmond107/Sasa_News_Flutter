import 'package:flutter/material.dart';
import 'package:newsapp/ui/screens/loginScreen.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  String fName, lName, email;
  bool logged;

  checkLoggedIn() async {}

  loggedInOut() {
    String text;
    setState(() {
      if (logged ?? true) {
        text = "Log Out";
      } else {
        text = "Log In";
      }
    });

    return text;
  }

  getFromSharedPref() async {}

  @override
  void initState() {
    super.initState();
    getFromSharedPref();
  }

  @override
  Widget build(BuildContext context) {
    getFromSharedPref();
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Drawer(
          child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: UserAccountsDrawerHeader(
                      accountName: Text('John' ' ' 'Doe' ?? "empty"),
                      accountEmail: Text("doe@gmail.com"),
                      currentAccountPicture: GestureDetector(
                        onTap: () {},
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage('assets/avatar.png'),
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                      leading: Icon(Icons.shop),
                      title: Text('Blogs',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      onTap: () {}),
                  ListTile(
                      leading: Icon(Icons.share),
                      title: Text(
                        'Share',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onTap: () {}),
                  ListTile(
                    leading: Icon(Icons.help),
                    title: Text('Help',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    onTap: () async {},
                  ),
                ]),
                Column(children: <Widget>[
                  ListTile(
                      leading: Icon(Icons.exit_to_app),
                      title: Text(loggedInOut(),
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                      }),
                  Divider(),
                  ListTile(
                    title: Text('Powered By SasaNews'),
                    onTap: () {},
                  ),
                ])
              ]),
        ),
      )),
    );
  }
}

Future<void> logOut() async {}

// logout user
enum ConfirmAction { CANCEL, ACCEPT }
Future<ConfirmAction> _asyncConfirmLogOutDialog(BuildContext context) async {
  return showDialog<ConfirmAction>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Logout ?'),
        content: const Text('Are you sure you want to logout?'),
        actions: <Widget>[
          FlatButton(
            child: const Text('NO'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.CANCEL);
            },
          ),
          FlatButton(
            child: const Text('YES'),
            onPressed: () {},
          )
        ],
      );
    },
  );
}
