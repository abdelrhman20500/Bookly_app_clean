import 'package:bookly_app_clean/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly_app_clean/Features/home/presentation/manager/fetch_feature_books_cubit/featured_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState>{
  FeaturedBooksCubit(this.featuredBooksUseCase) :super(FeaturedBooksInitial());
  final FetchFeaturedBooksUseCase featuredBooksUseCase;
   Future<void> fetchFeaturedBooks()async {
     emit(FeaturedBooksLoading());
     var result=  await featuredBooksUseCase.call();
     result.fold((failure){
       emit(FeaturedBooksFailure(failure.errorMessage));
     },(books){
       emit(FeaturedBooksSuccess(books));
     });
   }
}