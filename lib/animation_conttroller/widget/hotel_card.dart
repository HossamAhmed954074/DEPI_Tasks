import 'package:flutter/material.dart';

class HotelCard extends StatefulWidget {
  const HotelCard({super.key});

  @override
  State<HotelCard> createState() => _HotelCardState();
}

class _HotelCardState extends State<HotelCard>
    with SingleTickerProviderStateMixin {
  bool _expanded = false;
  late final AnimationController _textController;
  late final Animation<Offset> _slideAnim;
  late final Animation<double> _fadeAnim;

  static const double collapsedHeight = 180;
  static const double expandedHeight = 320;

  @override
  void initState() {
    super.initState();
    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 320),
    );
    _slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _textController, curve: Curves.easeOut));
    _fadeAnim = CurvedAnimation(parent: _textController, curve: Curves.easeIn);
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() => _expanded = !_expanded);
    if (_expanded) {
      _textController.forward();
    } else {
      _textController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(_expanded ? 12 : 20);
    return GestureDetector(
      onTap: _toggle,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
        height: _expanded ? expandedHeight : collapsedHeight,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderRadius,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        clipBehavior: Clip.hardEdge,
        child: Column(
          children: [
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/images/Image.png'),

                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizeTransition(
                      sizeFactor: _fadeAnim, // smooth height appearance
                      axisAlignment: -1.0,
                      child: SlideTransition(
                        position: _slideAnim,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  'Grand Hyatt Manila',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Work Sans',
                                  ),
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/Container.png',
                                      height: 24,
                                      width: 16,
                                      fit: BoxFit.cover,
                                    ),
                                    Image.asset(
                                      'assets/images/Container.png',
                                      height: 24,
                                      width: 16,
                                      fit: BoxFit.cover,
                                    ),
                                    Image.asset(
                                      'assets/images/Container.png',
                                      height: 24,
                                      width: 16,
                                      fit: BoxFit.cover,
                                    ),
                                    Image.asset(
                                      'assets/images/Container.png',
                                      height: 24,
                                      width: 16,
                                      fit: BoxFit.cover,
                                    ),
                                    Image.asset(
                                      'assets/images/Container.png',
                                      height: 24,
                                      width: 16,
                                      fit: BoxFit.cover,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            const Text(
                              'Deluxe King Room',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Work Sans',
                              ),
                            ),
                            const SizedBox(height: 6),
                            const Text(
                              'Deluxe King Roome a to din I Ansor',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Work Sans',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
