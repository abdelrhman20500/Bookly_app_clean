import 'package:bookly_app_clean/Features/home/presentation/views/widgets/book_details_body.dart';
import 'package:flutter/material.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.authorName,
      required this.price,
      required this.rating});

  final String image;
  final String title;
  final String authorName;
  final num price;
  final num rating;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                color: Colors.white,
                size: 34,
              )),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_cart_checkout,
                  size: 34,
                  color: Colors.white,
                )),
          )
        ],
      ),
      body:  BookDetailsBody(
        image: image,
        title: title,
        authorName: authorName,
        price: price,
        rating: rating,
      ),
    );
  }
}
