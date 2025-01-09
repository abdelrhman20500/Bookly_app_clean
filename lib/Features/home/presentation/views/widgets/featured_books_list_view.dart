import 'package:bookly_app_clean/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_clean/Features/home/presentation/manager/fetch_feature_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'custom_book_image.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({super.key, required this.books});

  final List<BookEntity> books;

  @override
  _FeaturedBooksListViewState createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
  final ScrollController _scrollController = ScrollController();
  var nextPage =1;
  var isLoading= false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() async{
    var currentPositions =_scrollController.position.pixels;
    var maxScrollLength= _scrollController.position.maxScrollExtent;
    if (currentPositions >=0.7 * maxScrollLength) {
      if(!isLoading)
        {
          isLoading= true;
          // Trigger the request to fetch featured books
          await BlocProvider.of<FeaturedBooksCubit>(context).fetchFeaturedBooks(pageNumber: nextPage++);
          isLoading= false;
        }
    }
  }

  void fetchFeaturedBooks() {
    // Implement your fetch logic here
    print("Fetching more featured books...");
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.32,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.books.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(6.0),
            child: CustomBookImage(image: widget.books[index].image ?? ""),
          );
        },
      ),
    );
  }
}
