import 'package:bookly_app_clean/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly_app_clean/Features/home/presentation/manager/fetch_feature_books_cubit/featured_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState>{
  FeaturedBooksCubit(this.featuredBooksUseCase) :super(FeaturedBooksInitial());
  final FetchFeaturedBooksUseCase featuredBooksUseCase;
   Future<void> fetchFeaturedBooks({int pageNumber=0})async {
     if(pageNumber ==0)
       {
         emit(FeaturedBooksLoading());
       }else
         {
           emit(FeaturedBooksLoadingPaginationLoading());
         }
     var result=  await featuredBooksUseCase.call(pageNumber);
     result.fold((failure){
       if(pageNumber ==0 )
         {
           emit(FeaturedBooksFailure(failure.errorMessage));
         }else
           {
             emit(FeaturedBooksLoadingPaginationFailure(failure.errorMessage));
           }
     },(books){
       emit(FeaturedBooksSuccess(books));
     });
   }
}