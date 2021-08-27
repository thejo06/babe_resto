import 'package:flutter/material.dart';
import 'package:babe_resto/common/styles.dart';
import 'package:babe_resto/data/models/screenArgs.dart';
import 'package:babe_resto/data/services/api_services.dart';
import 'package:babe_resto/provider/restaurant_detail_provider.dart';
import 'package:provider/provider.dart';
import '../restaurant_detail/components/description_title.dart';
import '../restaurant_detail/components/ListFoods.dart';
import '../restaurant_detail/components/ListDrinks.dart';

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
      return SliverAppBar(
        floating: true,
        stretch: true,
        expandedHeight: 200,
        flexibleSpace: FlexibleSpaceBar(
          background: Image.network(
            'https://restaurant-api.dicoding.dev/images/medium/${args.pictureId}',
            fit: BoxFit.cover,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: yellowColor,
          iconSize: 30,
        ),
      );
    }

    Widget description(SizedBox sizedBox10) {
      return SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DescriptionTitle(args: args),
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
      return SliverToBoxAdapter(
        child: Center(
          child: Text(
            textTitle,
            style: titleTextMenu,
          ),
        ),
      );
    }

    return Scaffold(
      body: ChangeNotifierProvider(
        create: (_) => RestaurantDetailProvider(
            apiService: ApiServices(), id: args.restoID),
        child: CustomScrollView(
          slivers: [
            header(),
            description(sizedBox10),
            menuTitle('Makanan'),
            ListOfFoods(args: args),
            menuTitle('Minuman'),
            ListOfDrinks(args: args),
          ],
        ),
      ),
    );
  }
}
