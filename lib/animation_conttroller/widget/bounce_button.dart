/* ---------------- Book Now Button with Bounce ---------------- */
import 'package:flutter/material.dart';

class BookNowBounceButton extends StatefulWidget {
  const BookNowBounceButton({super.key});
  @override
  State<BookNowBounceButton> createState() => _BookNowBounceButtonState();
}

class _BookNowBounceButtonState extends State<BookNowBounceButton> with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    _scaleAnim = Tween<double>(begin: 1.0, end: 0.9).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.elasticOut),
    );
    _ctrl.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // return to normal (we used elasticOut so it will bounce back automatically)
        _ctrl.reverse();
      }
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _onPressed() {
    _ctrl.forward(from: 0.0);

  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScaleTransition(
        scale: _scaleAnim,
        child: ElevatedButton(
          onPressed: _onPressed,
          style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14)),
          child: const Text('Book Now', style: TextStyle(fontSize: 16)),
        ),
      ),
    );
  }
}
