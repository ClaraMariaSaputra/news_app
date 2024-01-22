import 'package:dartz/dartz.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/repository/base_news_repository.dart';

class GetNews {
  final BaseNewsRepository repository;

  GetNews(this.repository);

  Future<Either<String, NewsModel>> getListNews(
      {required String category,
      required int page,
      required int pageSize}) async {
    return await repository.getListNews(
        category: category, page: page, pageSize: pageSize);
  }
}
