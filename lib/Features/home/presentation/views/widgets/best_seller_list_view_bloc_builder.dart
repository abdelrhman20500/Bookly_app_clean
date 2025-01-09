import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/fetch_newest_books_cubit/newest_books_cubit.dart';
import '../../manager/fetch_newest_books_cubit/newest_books_state.dart';
import 'best_seller_list_view.dart';

class BestSellerListViewBlocBuilder extends StatelessWidget {
  const BestSellerListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState >(

      builder: (BuildContext context, state) {
        if(state is NewestBooksSuccess)
        {
          return  BestSellerListView(books: state.books);
        }else if(state is NewestBooksFailure)
        {
          return Text(state.errMessage);
        }else
        {
          return const Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }
}
