import 'package:flutter/material.dart';

class TweenAnimation2 extends StatefulWidget {
  const TweenAnimation2({super.key});

  @override
  State<TweenAnimation2> createState() => _TweenAnimation2State();
}

class _TweenAnimation2State extends State<TweenAnimation2> {
  double _begain = 100;
  double _end = 200;

  Widget _getColumnWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Builder', style: TextStyle(fontSize: 20, color: Colors.red)),
        Text('VS', style: TextStyle(fontSize: 20, color: Colors.red)),
        Text('Child', style: TextStyle(fontSize: 20, color: Colors.red)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tween Animation 2 '), centerTitle: true),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            TweenAnimationBuilder(
              tween: Tween<double>(begin: _begain, end: _end),
              duration: const Duration(seconds: 2),
              child: _getColumnWidget(),
              builder: (context, value, child) {
                return Container(
                  height: value,
                  width: value,
                  // alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue,
                  ),
                  child: child,
                );
              },
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                _begain = _begain == 100 ? 200 : 100;
                _end = _end == 200 ? 100 : 200;

                setState(() {});
              },
              child: Text('Start Animation'),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
