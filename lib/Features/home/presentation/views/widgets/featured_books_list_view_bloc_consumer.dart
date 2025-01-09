import 'package:bookly_app_clean/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_clean/Features/home/presentation/manager/fetch_feature_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app_clean/Features/home/presentation/manager/fetch_feature_books_cubit/featured_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../Core/utils/functions/build_error_snakbar.dart';
import 'featured_books_list_view.dart';

class FeaturedBooksListViewBlocConsumer extends StatefulWidget {
  const FeaturedBooksListViewBlocConsumer({
    super.key,
  });

  @override
  State<FeaturedBooksListViewBlocConsumer> createState() =>
      _FeaturedBooksListViewBlocBuilderState();
}

class _FeaturedBooksListViewBlocBuilderState
    extends State<FeaturedBooksListViewBlocConsumer> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (BuildContext context, state) {
        if (state is FeaturedBooksSuccess) {
          books.addAll(state.books);
        }
        if(state is FeaturedBooksLoadingPaginationFailure)
          {
            ScaffoldMessenger.of(context).showSnackBar(buildErrorSnackBar(state.errMessage));
          }
      },
      builder: (BuildContext context, state) {
        if (state is FeaturedBooksSuccess ||
            state is FeaturedBooksLoadingPaginationLoading ||
            state is FeaturedBooksLoadingPaginationFailure) {
          return FeaturedBooksListView(books: books);
        } else if (state is FeaturedBooksFailure) {
          return Text(state.errMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

}
