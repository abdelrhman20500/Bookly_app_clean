import 'package:bookly_app_clean/Core/utils/api_service.dart';
import 'package:bookly_app_clean/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app_clean/Features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDateSource{
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDateSource{

  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async{
    var data = await apiService.get(endpoint: "volumes?Filtering=free-ebooks&q=programming");
    List<BookEntity> books = getBookList(data);
    return books;
  }

  /// Refactor Method...
  List<BookEntity> getBookList(Map<String, dynamic> data) {
    List<BookEntity> books =[];
    for(var bookMap in data["items"]){
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }

}