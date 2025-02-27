import '../../../domain/entities/book_entity.dart';

abstract class NewestBooksState {}

class NewestBooksInitial extends NewestBooksState {}

class NewestBooksPaginationLoading extends NewestBooksState {}

class NewestBooksPaginationFailure extends NewestBooksState {
  final String errMessage;

  NewestBooksPaginationFailure(this.errMessage);
}

class NewestBooksLoading extends NewestBooksState {}

class NewestBooksSuccess extends NewestBooksState {
  final List<BookEntity> books;

  NewestBooksSuccess(this.books);
}

class NewestBooksFailure extends NewestBooksState {
  final String errMessage;

  NewestBooksFailure(this.errMessage);
}