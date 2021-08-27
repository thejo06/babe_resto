import 'package:babe_resto/data/models/restaurant_detail.dart';
import 'package:babe_resto/data/services/api_services.dart';
import 'package:flutter/widgets.dart';

enum ResultState { Loading, NoData, HasData, Error }

class RestaurantDetailProvider extends ChangeNotifier {
  final ApiServices apiService;
  final String id;
  RestaurantDetailProvider({required this.apiService, required this.id}) {
    _fetchRestaurantDetail(id);
  }

  RestaurantDetail? _restaurantDetail;
  ResultState? _state;
  String? _message;

  String get message => _message!;
  RestaurantDetail get restaurantDetail => _restaurantDetail!;
  ResultState get state => _state!;

  Future<dynamic> _fetchRestaurantDetail(String id) async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final restaurantDetail = await apiService.getRestaurantDetail(id);
      if (restaurantDetail.restaurant.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Gagal Mendapatkan Data';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _restaurantDetail = restaurantDetail;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}
