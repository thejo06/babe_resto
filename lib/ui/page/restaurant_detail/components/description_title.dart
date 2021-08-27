import 'package:babe_resto/common/styles.dart';
import 'package:babe_resto/data/models/screenArgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DescriptionTitle extends StatelessWidget {
  const DescriptionTitle({
    Key? key,
    required this.args,
  }) : super(key: key);

  final ScreenArguments args;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
