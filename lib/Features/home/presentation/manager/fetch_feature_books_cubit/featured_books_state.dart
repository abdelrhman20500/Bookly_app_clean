import 'package:bookly_app_clean/Features/home/domain/entities/book_entity.dart';

abstract class FeaturedBooksState{}
class FeaturedBooksInitial extends FeaturedBooksState{}
class FeaturedBooksLoading extends FeaturedBooksState{}
class FeaturedBooksLoadingPaginationLoading extends FeaturedBooksState{}
class FeaturedBooksLoadingPaginationFailure extends FeaturedBooksState{
  final String errMessage;

  FeaturedBooksLoadingPaginationFailure(this.errMessage);
}

class FeaturedBooksFailure extends FeaturedBooksState{
  final String errMessage ;
  FeaturedBooksFailure(this.errMessage);
}
class FeaturedBooksSuccess extends FeaturedBooksState{
  final List<BookEntity>books;
  FeaturedBooksSuccess(this.books);

}