import 'package:flutter/material.dart';

class ProductCart extends StatelessWidget {
  final String title;
  final double price;
  final String urlImage;
  final Color backGroundColor;
  const ProductCart(
      {super.key,
      required this.title,
      required this.price,
      required this.urlImage,
      required this.backGroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backGroundColor,
      ),
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            '\$$price',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          SizedBox(
            height: 5,
          ),
          // Image(
          //   image: AssetImage(urlImage),
          //   height: 175,
          // ),
          Center(
            child: Image.asset(
              urlImage,
              height: 175,
            ),
          )
        ],
      ),
    );
  }
}
