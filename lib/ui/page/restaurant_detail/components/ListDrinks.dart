import 'package:babe_resto/common/styles.dart';
import 'package:babe_resto/data/models/screenArgs.dart';
import 'package:babe_resto/provider/restaurant_detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListOfDrinks extends StatelessWidget {
  const ListOfDrinks({
    Key? key,
    required this.args,
  }) : super(key: key);

  final ScreenArguments args;

  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantDetailProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.Loading) {
          return SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state.state == ResultState.HasData) {
          return SliverPadding(
            padding:
                EdgeInsets.symmetric(horizontal: defaultPadding, vertical: 10),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final item =
                      state.restaurantDetail.restaurant.menus.drinks[index];
                  return Stack(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              'assets/images/drinks.jpg',
                            ),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(4),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: greyColor.withOpacity(0.7),
                        ),
                        child: Text(
                          item.name,
                          style: bodyTextMenu,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  );
                },
                childCount:
                    state.restaurantDetail.restaurant.menus.drinks.length,
              ),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 150,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 2.0,
              ),
            ),
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
    );
  }
}
