import 'package:animation/animation_conttroller/animation_controller.dart';
import 'package:animation/tween/tween_animation.dart';
import 'package:animation/tween/tween_animation2.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AnimationControllerTest(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double? _diminution = 100;
  Color _color = Colors.blue;
  double _circleRadius = 20;
  @override
  void initState() {

    super.initState();
    Future.delayed(const Duration(milliseconds: 500),() {
      _color = _color == Colors.blue ? Colors.red : Colors.blue;
      _diminution = _diminution == 100 ? 200 : 100;
      _circleRadius = _circleRadius == 20 ? 100 : 20;
      setState(() {

      });
    },);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter App'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 2),
              curve: Curves.easeOut,
              height: _diminution,
              width: _diminution,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: BorderRadius.circular(_circleRadius),
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () async {
                Future.delayed(const Duration(milliseconds: 1000),() {
                  _color = _color == Colors.blue ? Colors.red : Colors.blue;
                  _diminution = _diminution == 100 ? 200 : 100;
                  _circleRadius = _circleRadius == 20 ? 100 : 20;
                  setState(() {

                  });
                },);

              },
              child: const Text('Click Me'),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
