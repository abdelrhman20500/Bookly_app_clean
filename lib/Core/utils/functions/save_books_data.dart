import 'package:hive/hive.dart';
import '../../../Features/home/domain/entities/book_entity.dart';

/// this method to save data in hive..
void saveBooksData(List<BookEntity> books, String boxName) {
  var box= Hive.box<BookEntity>(boxName);
  box.addAll(books);
}