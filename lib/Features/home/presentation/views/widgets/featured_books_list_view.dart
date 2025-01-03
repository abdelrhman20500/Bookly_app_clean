import 'package:bookly_app_clean/Features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'custom_book_image.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key, required this.books});

  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.32,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: books.length,
          itemBuilder: (context, index)
          {
            return  Padding(
              padding: const EdgeInsets.all(6.0),
              child: CustomBookImage(image: books[index].image ?? "",),
            );
          }
      ),
    );
  }
}
