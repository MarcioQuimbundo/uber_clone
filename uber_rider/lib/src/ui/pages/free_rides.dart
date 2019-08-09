import 'package:flutter/material.dart';

class FreeRidesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FreeRidesView();
  }
}

class FreeRidesView extends StatefulWidget {
  @override
  _FreeRidesViewState createState() => _FreeRidesViewState();
}

class _FreeRidesViewState extends State<FreeRidesView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Free Rides"),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Text(
                "Want more Uber",
                style: TextStyle(fontSize: 36),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "for less?",
                style: TextStyle(fontSize: 36),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Get a free ride worth up to \$20 when you refer a friend to try Uber.",
                style: TextStyle(height: 1.4, fontSize: 20, color: Colors.grey),
              ),
              SizedBox(
                height: 12,
              ),
              GestureDetector(
                  onTap: () {
                    print("How Invites work tapped");
                  },
                  child: Text(
                    "How Invites work",
                    style: TextStyle(
                        height: 1.4, fontSize: 20, color: Colors.blue),
                  )),
              Container(
                width: double.infinity,
                height: 160,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Icon(
                      Icons.person_outline,
                      size: 110,
                    ),
                    Icon(
                      Icons.chat_bubble_outline,
                      size: 110,
                    ),
                    Icon(
                      Icons.person_outline,
                      size: 110,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Your Invite Code",
                style: TextStyle(height: 1.4, fontSize: 20, color: Colors.grey),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                  decoration: InputDecoration(border: OutlineInputBorder(), hintText: "q1yzx", hintStyle: TextStyle(color: Colors.black,))),
              SizedBox(
                height: 14,
              ),
              GestureDetector(
                onTap: (){},
                              child: Container(
                      width: double.infinity,
                      height: 60,
                      margin: EdgeInsets.only(bottom: 10),
                      alignment: FractionalOffset.center,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius:
                            BorderRadius.all(const Radius.circular(4.0)),
                      ),
                      child: Text('SEND INVITES',
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                    ),
              ),
            ],
          ),
        ));
  }
}
