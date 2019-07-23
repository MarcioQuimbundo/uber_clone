import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:uber_rider/src/ui/register.dart';

const double minHeight = 220;

class ExhibitionBottomSheet extends StatefulWidget {
  @override
  _ExhibitionBottomSheetState createState() => _ExhibitionBottomSheetState();
}

TextEditingController emailTextController;
TextEditingController passwordTextController;
FocusNode focusNode;
FocusNode focusNodePassword;

class _ExhibitionBottomSheetState extends State<ExhibitionBottomSheet>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  double get headerTopMargin =>
      lerp(20, 20 + MediaQuery.of(context).padding.top);

  double get headerFontSize => lerp(24, 34);
  double get maxHeight => MediaQuery.of(context).size.height;
  double get itemBorderRadius => lerp(8, 24);
  double get iconLeftBorderRadius => itemBorderRadius;
  double get iconRightBorderRadius => lerp(8, 0);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3600));
    focusNode = FocusNode();
    focusNodePassword = FocusNode();
  }

  double lerp(double min, double max) =>
      lerpDouble(min, max, _controller.value);

  int _timesTapped = 0;

  @override
  void dispose() {
    _controller.dispose();
    emailTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Positioned(
          height: lerp(minHeight, maxHeight),
          left: 0,
          right: 0,
          bottom: 0,
          child: GestureDetector(
            onVerticalDragUpdate: _handleDragUpdate,
            onVerticalDragEnd: _handleDragEnd,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Stack(
                children: <Widget>[
                  
                  
                  _builtPassField(),
                  Padding(
                    padding: EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 50,
                        ),
                        Expanded(
                            child: GestureDetector(
                          onTap: _toogle,
                          child: Container(
                            color: Colors.transparent,
                            child: IgnorePointer(
                              child: TextField(
                                  focusNode: focusNode,
                                  controller: emailTextController,
                                  keyboardType: TextInputType.text,
                                  onSubmitted: (text) {
                                  FocusScope.of(context).requestFocus(focusNodePassword);
                                },
                                  decoration: InputDecoration(
                                      prefixIcon: Container(
                                        width: 50,
                                        child: Icon(Icons.email),
                                      ),
                                      border: InputBorder.none,
                                      labelText: "Enter your email",
                                      labelStyle: TextStyle(fontSize: 20))),
                            ),
                          ),
                        )),
                      ],
                    ),
                  ),
                  _builtFloatingButton(),
                  //_builtCreateAccount(),
                  //MenuButton(),
                  _builtGetMoving(),
                  _builtSocial(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _builtFloatingButton() {
    return FloatinButtonLogin(
      isVisible: _controller.status == AnimationStatus.completed,
    );
  }

  Widget _builtCreateAccount() {
    return CreateAccountLabel(
      isVisible: _controller.status == AnimationStatus.completed,
    );
  }

  Widget _builtGetMoving() {
    return CreateGetMoving(
      isVisible: _controller.status != AnimationStatus.completed,
    );
  }

  Widget _builtPassField() {
    return CreatePassField(
      isVisible: _controller.status == AnimationStatus.completed,
    );
  }

  Widget _builtSocial() {
    return CreateSocialNetwork(
      isVisible: _controller.status != AnimationStatus.completed,
    );
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    _controller.value -= details.primaryDelta / maxHeight;
  }

  void _handleDragEnd(DragEndDetails details) {
    if (_controller.isAnimating ||
        _controller.status == AnimationStatus.completed) return;

    final double flingVelocity =
        details.velocity.pixelsPerSecond.dy / maxHeight;

    if (flingVelocity < 0.0) {
      _controller.fling(velocity: math.max(2.0, -flingVelocity));
    } else if (flingVelocity > 0.0) {
      _controller.fling(velocity: math.min(-2.0, -flingVelocity));
    } else {
      _controller.fling(velocity: _controller.value < 0.5 ? -2.0 : 2.0);
    }
  }

  void _toogle() {
    print("teste");
    final bool isOpen = _controller.status == AnimationStatus.completed;
    print(isOpen.toString());
    _controller.fling(velocity: 0.1); //isOpen ? -2 :

    FocusScope.of(context).requestFocus(focusNode);
  }
}

final List<Event> events = [
  Event('steve-johnson.jpeg', 'Shenzhen GLOBAL DESIGN AWARD 2018', '4.20-30'),
  Event('efe-kurnaz.jpg', 'Shenzhen GLOBAL DESIGN AWARD 2018', '4.20-30'),
  Event('rodion-kutsaev.jpeg', 'Dawan District Guangdong Hong Kong', '4.28-31'),
];

class Event {
  final String assetName;
  final String title;
  final String date;

  Event(this.assetName, this.title, this.date);
}

class FloatinButtonLogin extends StatelessWidget {
  final double bottomMargin;
  final bool isVisible;

  const FloatinButtonLogin({Key key, this.bottomMargin, this.isVisible})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30,
      right: 20,
      child: AnimatedOpacity(
        opacity: isVisible ? 1 : 0,
        duration: Duration(milliseconds: 200),
        child: RawMaterialButton(
          onPressed: () {
            Navigator.pushNamed(context, "/home");
          },
          splashColor: Colors.white,
          fillColor: Colors.black,
          elevation: 15.0,
          shape: CircleBorder(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Icon(
              Icons.arrow_forward,
              size: 30.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class CreateAccountLabel extends StatelessWidget {
  final bool isVisible;

  const CreateAccountLabel({Key key, this.isVisible}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30,
      left: 20,
      child: AnimatedOpacity(
        opacity: isVisible ? 1 : 0,
        duration: Duration(milliseconds: 200),
        child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RegisterPage()));
            },
            child: Text("Create an Account",
                style: TextStyle(fontSize: 18, color: Colors.blue))),
      ),
    );
  }
}

class CreateGetMoving extends StatelessWidget {
  final bool isVisible;

  const CreateGetMoving({Key key, this.isVisible}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 20,
        left: 30,
        child: AnimatedOpacity(
            opacity: isVisible ? 1 : 0,
            duration: Duration(milliseconds: 200),
            child: Text("Get moving with Uber",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500))));
  }
}

class CreatePassField extends StatelessWidget {
  final bool isVisible;

  const CreatePassField({Key key, this.isVisible}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _reqFocusPassword() {
      FocusScope.of(context).requestFocus(focusNodePassword);
    }

    return Positioned(
        top: 160,
        left: 30,
        child: AnimatedOpacity(
            opacity: isVisible ? 1 : 0,
            duration: Duration(milliseconds: 200),
            child: GestureDetector(
              onTap: _reqFocusPassword,
              child: Container(
                width: 600,
                child: IgnorePointer(
                  child: TextField(
                      focusNode: focusNodePassword,
                      controller: passwordTextController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          prefixIcon: Container(
                            width: 50,
                            child: Icon(Icons.lock),
                          ),
                          border: InputBorder.none,
                          labelText: "Enter your password",
                          labelStyle: TextStyle(fontSize: 20))),
                ),
              ),
            )));
  }
}

class CreateSocialNetwork extends StatelessWidget {
  final bool isVisible;

  const CreateSocialNetwork({Key key, this.isVisible}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 30,
        left: 30,
        child: AnimatedOpacity(
          opacity: isVisible ? 1 : 0,
          duration: Duration(milliseconds: 200),
          child: GestureDetector(
              onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RegisterPage()));
            },
              child: Text("Or create an account",
                  style: TextStyle(fontSize: 18, color: Colors.blue))),
        ));
  }
}
