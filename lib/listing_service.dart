import 'package:flutter/material.dart';
import 'listing.dart';

class ListingService extends ChangeNotifier {
  ListingService._privateConstructor();
  static final ListingService instance = ListingService._privateConstructor();

  final List<Listing> _listings = [];

  List<Listing> get allListings => _listings;

  void seed(List<Listing> initialListings) {
    _listings.clear();
    _listings.addAll(initialListings);
    notifyListeners();
  }

  void addListing(Listing newListing) {
    _listings.insert(0, newListing);
    notifyListeners();
  }
}
