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
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(32),
          ),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () => setState(() => _selected = 0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: _selected == 0 ? Colors.blue : Colors.transparent,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: TextButton(
                      onPressed: () => setState(() => _selected = 0),
                      child: Text(
                        'Offers',
                        style: TextStyle(
                          color: _selected == 0 ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: InkWell(
                  onTap: () => setState(() => _selected = 1),
                  child: Container(
                    decoration: BoxDecoration(
                      color: _selected == 1 ? Colors.blue : Colors.transparent,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: TextButton(
                      onPressed: () => setState(() => _selected = 1),
                      child: Text(
                        'Guest Reviews',
                        style: TextStyle(
                          color: _selected == 1 ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        // AnimatedSwitcher handles fade-out/fade-in smoothly
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 320),
          transitionBuilder: (child, animation) {
            // combine fade + slight slide
            final offsetAnim = Tween<Offset>(
              begin: const Offset(0, 0.03),
              end: Offset.zero,
            ).animate(animation);
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(position: offsetAnim, child: child),
            );
          },
          child: _selected == 0
              ? Container(
                  key: const ValueKey('offers'),

                  child: Image.asset(
                    'assets/images/Background+Shadow.png',
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: 200,
                  ),
                )
              : Container(
                  key: const ValueKey('reviews'),
                  width: double.infinity,
                  height: 160,
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Row(
                        children: [
                          Text(
                            'John Doe',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              fontFamily: 'Work Sans',
                            ),
                          ),
                          Spacer(),
                          Text(
                            '★★★★☆',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Amazing stay, highly recommend the spa!',
                        style: TextStyle(fontSize: 14, fontFamily: 'Work Sans'),
                      ),
                      SizedBox(height: 16),
                       Row(
                        children: [
                          Text(
                            'Sarah K.',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              fontFamily: 'Work Sans',
                            ),
                          ),
                          Spacer(),
                          Text(
                            '★★★★☆',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Great service, room was very clean.',
                        style: TextStyle(fontSize: 14, fontFamily: 'Work Sans'),
                      ),
                    ],
                  ),
                ),
        ),
      ],
    );
  }
}
