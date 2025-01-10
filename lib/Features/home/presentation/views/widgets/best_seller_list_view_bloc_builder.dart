import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/book_entity.dart';
import '../../manager/fetch_newest_books_cubit/newest_books_cubit.dart';
import '../../manager/fetch_newest_books_cubit/newest_books_state.dart';
import 'best_seller_list_view.dart';

class BestSellerListViewBlocConsumer extends StatefulWidget {
  BestSellerListViewBlocConsumer({super.key,});

  @override
  State<BestSellerListViewBlocConsumer> createState() => _BestSellerListViewBlocConsumerState();
}

class _BestSellerListViewBlocConsumerState extends State<BestSellerListViewBlocConsumer> {
  final List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksState >(
      listener: (BuildContext context, NewestBooksState state) {
        if (state is NewestBooksSuccess) {
          books.addAll(state.books);
        }
        if (state is NewestBooksPaginationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errMessage),
          ));
        }
      },
      builder: (BuildContext context, state) {
        if(state is NewestBooksSuccess || state is NewestBooksPaginationLoading ||
        state is NewestBooksPaginationFailure)
        {
          return  BestSellerListView(books:books);
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
