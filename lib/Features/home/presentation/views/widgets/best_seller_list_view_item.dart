import 'package:bookly_app_clean/Core/utils/assets.dart';
import 'package:bookly_app_clean/Core/utils/styles.dart';
import 'package:bookly_app_clean/Features/home/presentation/views/book_details_screen.dart';
import 'package:flutter/material.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

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
            Container(
              height: 250,
              width: 130,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  image: const DecorationImage(image: AssetImage(Assets.itemPicture),
                      fit: BoxFit.fill)
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width*0.06,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Harry Potter and the Goblet of Fire",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Styles.textStyle24),
                  const SizedBox(height: 8,),
                  const Text("j.k.Rowling",style: Styles.textStyle20,),
                  const SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("19.90€",style:Styles.textStyle22),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.yellow,),
                          const Text("4.8",style: Styles.textStyle20),
                          Text("(2390)",style: Styles.textStyle20.copyWith(color: Colors.grey),)
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
