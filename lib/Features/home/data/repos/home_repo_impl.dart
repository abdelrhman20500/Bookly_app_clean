import 'package:bookly_app_clean/Core/errors/failure.dart';
import 'package:bookly_app_clean/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_app_clean/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly_app_clean/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_clean/Features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDateSource homeRemoteDateSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl(
      {required this.homeRemoteDateSource, required this.homeLocalDataSource});
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    /// fetch data...
    /// first i check this data already find or not find
    /// if data is find i want to use local data source if not i want to use remote data source..
    try {
      var bookList = homeLocalDataSource.fetchFeaturedBooks();
      if (bookList.isNotEmpty) {
        return right(bookList);
      }
      var books = await homeRemoteDateSource.fetchFeaturedBooks();
      return right(books);
    } catch (e) {
      return left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      var bookList = homeLocalDataSource.fetchNewestBooks();
      if (bookList.isNotEmpty) {
        return right(bookList);
      }
      var books = await homeRemoteDateSource.fetchNewestBooks();
      return right(books);
    } catch (e) {
      return left(Failure());
    }
  }
}
