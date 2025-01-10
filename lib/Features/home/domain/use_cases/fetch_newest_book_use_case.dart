import 'package:dartz/dartz.dart';
import '../../../../Core/errors/failure.dart';
import '../../../../Core/use-cases/use_case.dart';
import '../entities/book_entity.dart';
import '../repos/home_repo.dart';

class FetchNewestBooksUseCase extends UseCase<List<BookEntity>,int >{
final HomeRepo homeRepo;

FetchNewestBooksUseCase(this.homeRepo);

@override
Future<Either<Failure, List<BookEntity>>> call([int param =1]) async{
  return await homeRepo.fetchNewestBooks(pageNumber: param);
}

}
