import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'listing.dart';
import 'listing_detail_screen.dart';
import 'page_transition.dart';

class DealOfTheDayCard extends StatelessWidget {
  final Listing listing;
  const DealOfTheDayCard({super.key, required this.listing});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context, FadeSlidePageRoute(page: ListingDetailScreen(listing: listing))),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: CachedNetworkImage(imageUrl: listing.imageUrl, fit: BoxFit.cover,
                  errorWidget: (c, u, e) => const Icon(Icons.error)),
            ),
            Container(
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(0.8), Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Deal of the Day", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                  Text(listing.title, style: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
