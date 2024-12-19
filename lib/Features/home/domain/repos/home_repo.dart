import 'package:bookly_app_clean/Core/errors/failure.dart';
import 'package:bookly_app_clean/Features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo{
  Future<Either<Failure,List<BookEntity>>> fetchFeaturedBooks();
  Future<Either<Failure,List<BookEntity>>> fetchNewestBooks();
}