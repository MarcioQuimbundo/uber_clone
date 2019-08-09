import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SettingsView();
  }
}

class SettingsView extends StatefulWidget {
  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Account Settings"),
        ),
        body: ListView(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            ListTile(
              leading: ClipOval(
                child: Image.asset(
                  "assets/images/user_profile.jpg",
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text("Márcio Quimbundo"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("+244 922 88 40 32"),
                  SizedBox(
                    height: 1,
                  ),
                  Text("marciotquimbundo@gmail.com",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Divider(),
            SizedBox(
              height: 40,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Favorites",
                    style: TextStyle(fontSize: 22, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text(
                      "Add Home",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.work),
                    title: Text(
                      "Add Work",
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Profiles",
                    style: TextStyle(fontSize: 22, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    title: Text(
                      "Add Home",
                      style: TextStyle(fontSize: 18, color: Colors.blue),
                    ),
                    subtitle: Text("Separate work and personal receips"),
                  ),
                  ListTile(
                    title: Text(
                      "Add Family Profile",
                      style: TextStyle(fontSize: 18, color: Colors.blue),
                    ),
                    subtitle: Text("Pay for loved ones track their rides"),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
