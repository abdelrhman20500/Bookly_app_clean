import 'package:bookly_app_clean/Core/errors/failure.dart';
import 'package:bookly_app_clean/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_app_clean/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly_app_clean/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_clean/Features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDateSource homeRemoteDateSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl(
      {required this.homeRemoteDateSource, required this.homeLocalDataSource});
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks({int pageNumber=0}) async {
    /// fetch data...
    /// first i check this data already find or not find
    /// if data is find i want to use local data source if not i want to use remote data source..
    try {
      List<BookEntity> books;
      books= homeLocalDataSource.fetchFeaturedBooks(
        pageNumber: pageNumber
      );
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDateSource.fetchFeaturedBooks(pageNumber: pageNumber);
      return right(books);
    } catch(e) {
      if(e is DioException )
      {
        return left(ServerFailure.fromDiorError(e));
      }
      /// i not need to write else so if not achieve state in if condition you achieve in return...
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks({int pageNumber = 0}) async {
    try {
      List<BookEntity> books;
      books= homeLocalDataSource.fetchNewestBooks(pageNumber: pageNumber);
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDateSource.fetchNewestBooks(pageNumber: pageNumber);
      return right(books);
    } catch(e) {
      if(e is DioException )
      {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
