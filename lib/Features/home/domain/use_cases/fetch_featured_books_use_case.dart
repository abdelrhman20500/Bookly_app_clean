import 'package:bookly_app_clean/Features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../../Core/errors/failure.dart';
import '../entities/book_entity.dart';

class FetchFeaturedBooksUseCase{
  final HomeRepo homeRepo;
  FetchFeaturedBooksUseCase(this.homeRepo);
  Future<Either<Failure,List<BookEntity>>> fetchFeaturedBooks(){
    /// check permission
   return homeRepo.fetchFeaturedBooks();
  }

}


/// use case achieve single responsibility for solid principles.