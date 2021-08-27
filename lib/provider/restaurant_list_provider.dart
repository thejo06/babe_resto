import 'package:babe_resto/data/models/restaurant.dart';
import 'package:babe_resto/data/services/api_services.dart';
import 'package:flutter/widgets.dart';

enum ResultState { Loading, NoData, HasData, Error }

class RestaurantListProvider extends ChangeNotifier {
  final ApiServices apiService;
  RestaurantListProvider({required this.apiService}) {
    _fetchRestaurantList();
  }

  late Restaurants _restaurants;
  late ResultState _state;
  String _message = '';

  String get message => _message;
  Restaurants get result => _restaurants;
  ResultState get state => _state;

  Future<dynamic> _fetchRestaurantList() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final restaurant = await apiService.getRestaurantList();
      if (restaurant.restaurants.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Gagal Mendapatkan Data';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _restaurants = restaurant;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}
