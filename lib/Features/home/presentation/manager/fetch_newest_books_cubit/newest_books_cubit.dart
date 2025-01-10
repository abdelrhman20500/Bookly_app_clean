import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/use_cases/fetch_newest_book_use_case.dart';
import 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.newestBooksUseCase) : super(NewestBooksInitial());

  final FetchNewestBooksUseCase newestBooksUseCase;
  Future<void> fetchNewestBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(NewestBooksLoading());
    } else {
      emit(NewestBooksPaginationLoading());
    }
    var result = await newestBooksUseCase.call(pageNumber);
    result.fold((failure) {
      if (pageNumber == 0) {
        emit(NewestBooksFailure(failure.errorMessage));
      } else {
        emit(NewestBooksPaginationFailure(failure.errorMessage));
      }
    }, (books) {
      emit(NewestBooksSuccess(books));
    });
  }
}