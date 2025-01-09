import 'package:bookly_app_clean/Features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

import 'best_seller_list_view_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key, required this.books});

  final List<BookEntity>books;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        // shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: books.length,
        itemBuilder: (context, index)
        {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: BestSellerListViewItem(
              image: books[index].image!,
              title: books[index].title,
              authorName: books[index].authorName!,
              price: books[index].price!,
              rating: books[index].rating ?? 0.0,
            ),
          );
        }
    );
  }
}
