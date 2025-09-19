import 'package:flutter/material.dart';

class TweenAnimation extends StatefulWidget {
  const TweenAnimation({super.key});

  @override
  State<TweenAnimation> createState() => _TweenAnimationState();
}

class _TweenAnimationState extends State<TweenAnimation> {
  bool _isAnimating = false;
  int _value = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tween Animation'), centerTitle: true),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              child: LinearProgressIndicator(
                value: _value/100,
                minHeight: 10,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),

              ),
            ),
            SizedBox(height: 10,),
            _isAnimating
                ? TweenAnimationBuilder(
                    tween: IntTween(begin: 10, end: 100),
                    duration: const Duration(seconds: 2),
                    builder: (context, value, child) {
                      return Text(
                        value.toString(),
                        style: TextStyle(
                          fontSize: double.parse(value.toString()),
                          color: Colors.blue,
                        ),
                      );

                    },child: Text('Animating',style: TextStyle(fontSize: 20,color: Colors.red),),
                    // onEnd: () {
                    //
                    //   Future.delayed(const Duration(seconds: 1), () {
                    //     setState(() {
                    //       _value = 10;
                    //       _isAnimating = false;
                    //     });
                    //   });
                    // },
                  )
                : SizedBox.shrink(),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isAnimating = !_isAnimating;
                });
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
