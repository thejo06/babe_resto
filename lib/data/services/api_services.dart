import 'dart:convert';

import 'package:babe_resto/data/models/restaurant.dart';
import 'package:babe_resto/data/models/restaurant_detail.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static final String _baseUrl = 'https://restaurant-api.dicoding.dev/';

  Future<dynamic> getRestaurantList() async {
    var url = '$_baseUrl/list';
    final _response = await http.get(Uri.parse(url));
    if (_response.statusCode == 200) {
      return Restaurants.fromJson(json.decode(_response.body));
    } else {
      throw Exception('Gagal Memuat Data');
    }
  }

  Future<dynamic> getRestaurantDetail(String id) async {
    var url = '$_baseUrl/detail/$id';
    final _response = await http.get(Uri.parse(url));
    if (_response.statusCode == 200) {
      return RestaurantDetailItem.fromJson(json.decode(_response.body));
    } else {
      throw Exception('Gagal Memuat Data');
    }
  }
}
