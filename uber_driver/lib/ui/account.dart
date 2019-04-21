import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AccountView();
  }
}

class AccountView extends StatefulWidget {
  @override
  _AccountViewState createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Account"),
        ),
        body: ListView(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Divider(),
            ListTile(
              onTap: () {},
              title: Text("Documents", style: TextStyle(fontSize: 20)),
              leading: Icon(
                Icons.note,
                color: Colors.grey,
                size: 30,
              ),
              trailing:
                  Icon(Icons.chevron_right, color: Colors.black, size: 20),
            ),
            Divider(),
            ListTile(
              onTap: () {},
              title: Text("Payment", style: TextStyle(fontSize: 20)),
              leading: Icon(
                Icons.credit_card,
                color: Colors.grey,
                size: 30,
              ),
              trailing:
                  Icon(Icons.chevron_right, color: Colors.black, size: 20),
            ),
            Divider(),
            ListTile(
              onTap: () {},
              title: Text("Perks", style: TextStyle(fontSize: 20)),
              leading: Icon(
                Icons.favorite,
                color: Colors.grey,
                size: 30,
              ),
              trailing:
                  Icon(Icons.chevron_right, color: Colors.black, size: 20),
            ),
            Divider(),
            ListTile(
              onTap: () {},
              title: Text("Ensurance", style: TextStyle(fontSize: 20)),
              leading: Icon(
                Icons.security,
                color: Colors.grey,
                size: 30,
              ),
              trailing:
                  Icon(Icons.chevron_right, color: Colors.black, size: 20),
            ),
            Divider(),
            ListTile(
              onTap: () {},
              title: Text("App Settings", style: TextStyle(fontSize: 20)),
              leading: Icon(
                Icons.settings,
                color: Colors.grey,
                size: 30,
              ),
              trailing:
                  Icon(Icons.chevron_right, color: Colors.black, size: 20),
            ),
            Divider(),
            ListTile(
              onTap: () {},
              title: Text("About", style: TextStyle(fontSize: 20)),
              leading: Icon(
                Icons.info,
                color: Colors.grey,
                size: 30,
              ),
              trailing:
                  Icon(Icons.chevron_right, color: Colors.black, size: 20),
            ),
            Divider(),
          ],
        ));
  }
}
