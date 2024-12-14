import 'package:bookly_app_clean/Core/utils/styles.dart';
import 'package:bookly_app_clean/Features/home/presentation/views/widgets/similar-books_list_view.dart';
import 'package:flutter/material.dart';
import 'action_button.dart';
import 'custom_book_image.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.all( 12.0),
            child: Column(
              children: [
                SizedBox(height: height*0.05,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width*0.27),
                  child: const CustomBookImage(),
                ),
                SizedBox(height: height*0.05,),
                const Text("The Jungle Book", style: Styles.textStyle24),
                SizedBox(height: height*0.01,),
                const Text("Rudyard Kipling", style: Styles.textStyle20),
                SizedBox(height: height*0.01,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.star, color: Colors.yellow,),
                    const Text("4.8",style: Styles.textStyle20),
                    Text("(2390)",style: Styles.textStyle20.copyWith(color: Colors.grey),)
                  ],
                ),
                SizedBox(height: height*0.04,),
                const BookAction(),
                Expanded(child: SizedBox(height: height*0.03,)),
                const Align(
                    alignment: Alignment.topLeft,
                    child: Text("You can also like", style: Styles.textStyle22,)),
                SizedBox(height: height*0.01,),
                const SimilarBooksListView(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
