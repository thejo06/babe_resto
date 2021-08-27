import 'package:babe_resto/common/styles.dart';
import 'package:babe_resto/data/models/screenArgs.dart';
import 'package:babe_resto/data/services/api_services.dart';
import 'package:babe_resto/provider/restaurant_detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class RestaurantDetailPage extends StatelessWidget {
  static const routeName = '/restaurant_detail';
  final ScreenArguments args;
  RestaurantDetailPage({
    required this.args,
  });
  @override
  Widget build(BuildContext context) {
    SizedBox sizedBox10 = SizedBox(height: 10);

    Widget header() {
      return Image.network(
        'https://restaurant-api.dicoding.dev/images/medium/${args.pictureId}',
        fit: BoxFit.contain,
      );
    }

    Widget description(SizedBox sizedBox10) {
      return Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      args.name,
                      style: titleText1.copyWith(letterSpacing: 0.2),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/icon-location.png',
                          width: 12,
                          color: greyColor,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          args.city,
                          style: subtitleText,
                        ),
                        Spacer(),
                        RatingBar.builder(
                          itemSize: 20,
                          initialRating: args.rating,
                          allowHalfRating: true,
                          minRating: 1,
                          direction: Axis.horizontal,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          unratedColor: Colors.grey.withOpacity(0.5),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          args.rating.toString(),
                          style: subtitleText.copyWith(color: blackColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                color: greyColor.withOpacity(0.5),
                thickness: 0.2,
              ),
              sizedBox10,
              Text(
                'Deskripsi',
                style: titleText2.copyWith(letterSpacing: 0.2),
              ),
              sizedBox10,
              Text(args.description),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: greyColor.withOpacity(0.5),
                thickness: 0.2,
              ),
              sizedBox10,
              Text(
                'Daftar Menu',
                style: titleText2.copyWith(letterSpacing: 0.2),
              ),
              sizedBox10,
            ],
          ),
        ),
      );
    }

    Widget menuTitle(String textTitle) {
      return Container(
        child: Center(
          child: Text(
            textTitle,
            style: titleTextMenu,
          ),
        ),
      );
    }

    return Scaffold(
      body: ListView(
        children: [
          header(),
          description(sizedBox10),
          menuTitle('Makanan'),
          ChangeNotifierProvider(
            create: (_) => RestaurantDetailProvider(
                apiService: ApiServices(), id: args.restoID),
            child: Consumer<RestaurantDetailProvider>(
              builder: (context, state, _) {
                if (state.state == ResultState.Loading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state.state == ResultState.HasData) {
                  return ListView.builder(
                      itemCount:
                          state.restaurantDetail.restaurant.menus.foods.length,
                      itemBuilder: (context, index) {
                        final item = state
                            .restaurantDetail.restaurant.menus.foods[index];
                        return Container(
                          child: Text(item.name),
                        );
                      });
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
          ),
          menuTitle('Minuman'),
        ],
      ),
    );
  }
}
