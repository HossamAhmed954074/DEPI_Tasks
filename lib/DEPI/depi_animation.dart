import 'package:flutter/material.dart';

import '../animation_conttroller/widget/bounce_button.dart';
import '../animation_conttroller/widget/hotel_card.dart';
import '../animation_conttroller/widget/offers_reviews.dart';
import '../animation_conttroller/widget/price_slider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animation DEPI Task Demo',
      theme: ThemeData(useMaterial3: true, primarySwatch: Colors.blue),
      home: const DemoPage(),
    );
  }
}

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
            const SizedBox(height: 24),
            OffersReviewsSwitcher(),
            const SizedBox(height: 24),
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





