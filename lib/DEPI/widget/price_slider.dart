/* ---------------- Price Slider Widget ---------------- */
import 'package:flutter/material.dart';

class PriceSliderWidget extends StatefulWidget {
  const PriceSliderWidget({super.key});
  @override
  State<PriceSliderWidget> createState() => _PriceSliderWidgetState();
}

class _PriceSliderWidgetState extends State<PriceSliderWidget> {
  final TextEditingController _controller = TextEditingController();
  double _sliderValue = 0.0; // internal current stable value (0..1)
  double _targetValue = 0.0; // where we want to animate to

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _applyPrice() {
    final text = _controller.text.replaceAll(',', '').trim();
    final p = double.tryParse(text) ?? 0.0;
    final t = (p / 10000.0).clamp(0.0, 1.0);
    setState(() {
      _targetValue = t;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Price filter', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter price (EG: 3500)',
                  suffixIcon: IconButton(
                    onPressed: _applyPrice,
                    icon: const Icon(Icons.check_circle_outline),
                  ),
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(width: 12),
            SizedBox(
              width: 80,
              child: Text('${(_targetValue * 100).round()}%', textAlign: TextAlign.center),
            )
          ],
        ),
        const SizedBox(height: 12),
        // TweenAnimationBuilder animates slider from _sliderValue to _targetValue
        TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: _sliderValue, end: _targetValue),
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeInOut,
          builder: (context, animatedVal, child) {
            return Slider(
              value: animatedVal,
              min: 0.0,
              max: 1.0,
              onChanged: (v) {
                // user-interaction: update both values
                setState(() {
                  _sliderValue = v;
                  _targetValue = v;
                });
              },
            );
          },
          onEnd: () {
            // keep stable state in sync after animation finishes
            _sliderValue = _targetValue;
          },
        ),
      ],
    );
  }
}