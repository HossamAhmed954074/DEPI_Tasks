import 'package:flutter/material.dart';

class AnimationControllerTest extends StatefulWidget {
  const AnimationControllerTest({super.key});

  @override
  State<AnimationControllerTest> createState() => _AnimationControllerTestState();
}

class _AnimationControllerTestState extends State<AnimationControllerTest>  with SingleTickerProviderStateMixin{

  late AnimationController _animationController;
  late Animation<AlignmentGeometry> _yellwAnimation;
  late Animation<AlignmentGeometry> _greenAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 2),reverseDuration: Duration(seconds: 4));
    _yellwAnimation = Tween<AlignmentGeometry>(begin: Alignment.centerLeft, end: Alignment.centerRight).animate(_animationController);
    _greenAnimation = Tween<AlignmentGeometry>(begin: Alignment.topCenter, end: Alignment.bottomCenter).animate(_animationController);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Controller'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(child: _ballsWidget()),
          _allButton(),
          SizedBox(height: 50),

        ],
      ),
    );
  }

 Widget _ballsWidget() {
    return Stack(
      children: [
        AlignTransition(
          alignment: _greenAnimation,
          child: CircleAvatar(
            backgroundColor: Colors.green,
            radius: 25,
          ),
        ),
        AlignTransition(
          alignment: _yellwAnimation,
          child: CircleAvatar(
            backgroundColor: Colors.yellow,
            radius: 25,
          ),
        ),
      ],
    );
  }

Widget _allButton(){
    return Wrap(
      spacing: 10,
      alignment: WrapAlignment.center,
      children: [
        _animatedBallAction('Forward', () {
          _animationController.forward();
        }),
        _animatedBallAction('Reverse', () {
          _animationController.reverse();
        }),
        _animatedBallAction('Stop', () {
          _animationController.stop();
        }),
        _animatedBallAction('Reset', () {
          _animationController.reset();
        }),
        _animatedBallAction('Repeat(reverse = false)', () {}),
        _animatedBallAction('Repeat(reverse = false)', () {}),
      ],
    );
}
  Widget _animatedBallAction(String ballTittleAction, VoidCallback onPressed) {
    return ElevatedButton(
      style: ButtonStyle(
       backgroundColor: MaterialStateProperty.all(Colors.blue),
      ),
      onPressed: onPressed,
      child: Text(ballTittleAction),
    );
  }
}
