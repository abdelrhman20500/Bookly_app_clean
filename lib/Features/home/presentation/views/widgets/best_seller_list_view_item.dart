import 'package:bookly_app_clean/Core/utils/styles.dart';
import 'package:bookly_app_clean/Features/home/presentation/views/book_details_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/book_entity.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key, required this.book,});
  final BookEntity book;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=>const BookDetailsScreen()));
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height*0.22,
        child: Row(
          children: [
          AspectRatio(
          aspectRatio: 2.2/3.2,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              imageUrl: book.image ?? "",
              fit: BoxFit.fill,
            ),
          ),
        ),
            SizedBox(width: MediaQuery.of(context).size.width*0.06,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text(book.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Styles.textStyle24),
                  const SizedBox(height: 8,),
                   Text(book.authorName!,style: Styles.textStyle20,),
                  const SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       const Text("free",style:Styles.textStyle22),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.yellow,),
                          Text( (book.rating).toString(), style: Styles.textStyle20, ),                          Text("(2390)",style: Styles.textStyle20.copyWith(color: Colors.grey),)
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
