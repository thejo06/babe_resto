import 'package:babe_resto/data/models/restaurant_list.dart';

class Restaurants {
  Restaurants({
    required this.error,
    required this.message,
    required this.count,
    required this.restaurants,
  });

  bool error;
  String message;
  int count;
  List<RestaurantList> restaurants;

  factory Restaurants.fromJson(Map<String, dynamic> json) => Restaurants(
        error: json['error'],
        message: json['message'],
        count: json['count'],
        restaurants: List<RestaurantList>.from(
          (json['restaurants'] as List)
              .map((e) => RestaurantList.fromJson(e))
              .where(
                (restaurant) =>
                    restaurant.description != null &&
                    restaurant.pictureId != null &&
                    restaurant.rating != null,
              ),
        ),
      );
}
