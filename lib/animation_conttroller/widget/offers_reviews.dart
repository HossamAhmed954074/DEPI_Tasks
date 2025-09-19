/* -------------- Offers / Guest Reviews Switcher -------------- */
import 'package:flutter/material.dart';

class OffersReviewsSwitcher extends StatefulWidget {
  const OffersReviewsSwitcher({super.key});
  @override
  State<OffersReviewsSwitcher> createState() => _OffersReviewsSwitcherState();
}

class _OffersReviewsSwitcherState extends State<OffersReviewsSwitcher> {
  int _selected = 0; // 0 = Offers, 1 = Reviews

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => setState(() => _selected = 0),
                style: OutlinedButton.styleFrom(
                    backgroundColor: _selected == 0 ? Colors.blue.shade50 : null),
                child: const Text('Offers'),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: OutlinedButton(
                onPressed: () => setState(() => _selected = 1),
                style: OutlinedButton.styleFrom(
                    backgroundColor: _selected == 1 ? Colors.blue.shade50 : null),
                child: const Text('Guest Reviews'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        // AnimatedSwitcher handles fade-out/fade-in smoothly
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 320),
          transitionBuilder: (child, animation) {
            // combine fade + slight slide
            final offsetAnim = Tween<Offset>(begin: const Offset(0, 0.03), end: Offset.zero)
                .animate(animation);
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(position: offsetAnim, child: child),
            );
          },
          child: _selected == 0
              ? Container(
            key: const ValueKey('offers'),
            width: double.infinity,
            height: 120,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text('Special bundle: 2 nights + breakfast',
                style: TextStyle(fontWeight: FontWeight.bold)),
          )
              : Container(
            key: const ValueKey('reviews'),
            width: double.infinity,
            height: 120,
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              '“Very clean room, staff were friendly and responsive.” — Ahmed',
              style: TextStyle(color: Colors.black87),
            ),
          ),
        ),
      ],
    );
  }
}