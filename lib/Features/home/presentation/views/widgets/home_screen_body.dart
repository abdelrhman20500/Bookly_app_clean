import 'package:flutter/material.dart';
import '../../../../../Core/utils/styles.dart';
import 'best_seller_list_view_bloc_builder.dart';
import 'custom_app_bar.dart';
import 'featured_books_list_view_bloc_consumer.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Column(
                children: [
                  const CustomAppBar(),
                   const FeaturedBooksListViewBlocConsumer(),
                  SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                  const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text("Best Seller",style: Styles.titleMedium, ),
                      )),
                ],
              ),
            ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: BestSellerListViewBlocConsumer(),
          ),
        )
      ],
    );
  }
}



