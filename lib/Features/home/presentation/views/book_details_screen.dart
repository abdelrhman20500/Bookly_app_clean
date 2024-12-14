import 'package:bookly_app_clean/Features/home/presentation/views/widgets/book_details_body.dart';
import 'package:flutter/material.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(onPressed: ()
          {
            Navigator.pop(context);
          }, icon: const Icon(Icons.close, color: Colors.white, size: 34,)),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_cart_checkout,size: 34, color: Colors.white,)),
          )
        ],
      ),
      body: const BookDetailsBody(),
    );
  }
}
