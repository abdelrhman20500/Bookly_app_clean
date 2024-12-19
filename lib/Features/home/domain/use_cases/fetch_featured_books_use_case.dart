import 'package:bookly_app_clean/Core/use-cases/no_param_use_case.dart';
import 'package:bookly_app_clean/Core/use-cases/use_case.dart';
import 'package:bookly_app_clean/Features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../../Core/errors/failure.dart';
import '../entities/book_entity.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>,NoParam >{
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([NoParam? param]) async{
    return await homeRepo.fetchFeaturedBooks();
  }

}


