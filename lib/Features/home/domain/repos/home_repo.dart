import 'package:bookly_app_clean/Features/home/domain/entities/book_entity.dart';

abstract class HomeRepo{
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}