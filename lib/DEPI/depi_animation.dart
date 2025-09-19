import 'package:flutter/material.dart';

import 'widget/bounce_button.dart';
import 'widget/hotel_card.dart';
import 'widget/offers_reviews.dart';
import 'widget/price_slider.dart';


class DemoPage extends StatelessWidget {
  const DemoPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Smart Hotel Booking'),centerTitle: true,),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            HotelCard(),
            const SizedBox(height: 32),
            OffersReviewsSwitcher(),
            const SizedBox(height: 32),
            const PriceSliderWidget(),
            const SizedBox(height: 24),
            const BookNowBounceButton(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}





