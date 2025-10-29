import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'listing_service.dart';
import 'sample_sellers.dart';
import 'horizontal_listing_carousel.dart';
import 'horizontal_seller_carousel.dart';
import 'deal_of_the_day_card.dart'; // 🚀 UPDATE: New widget
import 'notifications_screen.dart';
import 'search_screen.dart';
import 'page_transition.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final listingService = Provider.of<ListingService>(context);
    final topSelling = listingService.allListings.where((l) => l.isSold).toList();
    final topRated = listingService.allListings.where((l) => l.rating > 4.5).toList();
    final recentlyAdded = listingService.allListings.take(4).toList();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            title: const Text("EcoByte", style: TextStyle(fontWeight: FontWeight.bold)),
            actions: [
              IconButton(onPressed: () => Navigator.of(context).push(FadeSlidePageRoute(page: const SearchScreen())), icon: const Icon(Icons.search)),
              IconButton(onPressed: () => Navigator.of(context).push(FadeSlidePageRoute(page: const NotificationsScreen())), icon: const Icon(Icons.notifications_none_rounded)),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(height: 10),
              // 🚀 UPDATE: Added Deal of the Day card for better layout
              if (topSelling.isNotEmpty) DealOfTheDayCard(listing: topSelling.first),
              HorizontalListingCarousel(title: "Top Selling", listings: topSelling),
              HorizontalSellerCarousel(title: "Top Sellers", sellers: sampleSellers),
              HorizontalListingCarousel(title: "Top Rated", listings: topRated),
              HorizontalListingCarousel(title: "Recently Added", listings: recentlyAdded),
            ]),
          ),
        ],
      ),
    );
  }
}