import 'package:bookly_app_clean/Features/home/domain/use_cases/fetch_newest_book_use_case.dart';
import 'package:bookly_app_clean/Features/home/presentation/manager/fetch_newest_books_cubit/newest_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksCubit extends Cubit<NewestBooksState>{
  NewestBooksCubit(this.fetchNewestBooksUseCase): super(NewestBooksInitial());
  final FetchNewestBooksUseCase fetchNewestBooksUseCase;
  Future<void> fetchNewestBooks()async {
    emit(NewestBooksLoading());
    var result=  await fetchNewestBooksUseCase.call();
    result.fold((failure){
      emit(NewestBooksFailure(failure.errorMessage));
    },(books){
      emit(NewestBooksSuccess(books));
    });
  }
}