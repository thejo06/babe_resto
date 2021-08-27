// import 'package:babe_resto/common/styles.dart';
// import 'package:babe_resto/data/models/restaurant_list.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// class DescriptionTitle extends StatelessWidget {
//   final RestaurantList restaurantDetailItem;

//   DescriptionTitle({
//     required this.restaurantDetailItem,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(top: 20, bottom: 10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             restaurantDetailItem.name,
//             style: titleText1.copyWith(letterSpacing: 0.2),
//             overflow: TextOverflow.ellipsis,
//           ),
//           Row(
//             children: [
//               Image.asset(
//                 'assets/icons/icon-location.png',
//                 width: 12,
//                 color: greyColor,
//               ),
//               SizedBox(
//                 width: 5,
//               ),
//               Text(
//                 restaurantDetailItem.city,
//                 style: subtitleText,
//               ),
//               Spacer(),
//               RatingBar.builder(
//                 itemSize: 20,
//                 initialRating: restaurantDetailItem.rating as double,
//                 allowHalfRating: true,
//                 minRating: 1,
//                 direction: Axis.horizontal,
//                 itemBuilder: (context, _) => Icon(
//                   Icons.star,
//                   color: Colors.amber,
//                 ),
//                 unratedColor: Colors.grey.withOpacity(0.5),
//                 onRatingUpdate: (rating) {
//                   print(rating);
//                 },
//               ),
//               SizedBox(
//                 width: 5,
//               ),
//               Text(
//                 restaurantDetailItem.rating.toString(),
//                 style: subtitleText.copyWith(color: blackColor),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
