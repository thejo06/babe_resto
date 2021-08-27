import 'package:babe_resto/common/styles.dart';
import 'package:babe_resto/data/models/screenArgs.dart';
import 'package:babe_resto/data/services/api_services.dart';
import 'package:babe_resto/provider/restaurant_list_provider.dart';
import 'package:babe_resto/ui/page/restaurant_detail/restaurant_detail.dart';
import './components/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RestaurantHomePage extends StatelessWidget {
  static const routeName = '/restaurant_home';
  @override
  Widget build(BuildContext context) {
    Widget _buildList() {
      return ChangeNotifierProvider(
        create: (_) => RestaurantListProvider(
          apiService: ApiServices(),
        ),
        child: Consumer<RestaurantListProvider>(
          builder: (context, state, _) {
            if (state.state == ResultState.Loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.state == ResultState.HasData) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.result.restaurants.length,
                itemBuilder: (context, index) {
                  var restaurant = state.result.restaurants[index];
                  ScreenArguments args = new ScreenArguments(
                    restaurant.id,
                    restaurant.pictureId as String,
                    restaurant.name,
                    restaurant.city,
                    restaurant.rating as double,
                    restaurant.description as String,
                  );
                  return ListTile(
                    onTap: () {
                      Navigator.pushNamed(
                          context, RestaurantDetailPage.routeName,
                          arguments: args);
                    },
                    leading: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            'https://restaurant-api.dicoding.dev/images/medium/${restaurant.pictureId}',
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 7),
                            height: 20,
                            decoration: BoxDecoration(
                              color: greyColor.withOpacity(0.7),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  'assets/icons/icon-star.png',
                                  width: 15,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  restaurant.rating.toString(),
                                  style: ratingText,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    title: Text(
                      restaurant.name,
                      style: titleTextListResto,
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/icons/icon-location.png',
                              width: 10,
                              color: greyColor,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              restaurant.city,
                              style: subtitleTextListResto,
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: Icon(
                      Icons.chevron_right_rounded,
                      color: yellowColor,
                    ),
                  );
                },
              );
            } else if (state.state == ResultState.NoData) {
              return Center(
                child: Text(state.message),
              );
            } else if (state.state == ResultState.Error) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return Center(
                child: Text(''),
              );
            }
          },
        ),
      );
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: CustomAppBar(),
      ),
      body: _buildList(),
    );
  }
}
