import 'package:dartz/dartz.dart';
import 'package:news_app/model/news_model.dart';

abstract class BaseNewsRepository {
  Future<Either<String, NewsModel>> getListNews(
      {required String category, required int page, required int pageSize});
}
