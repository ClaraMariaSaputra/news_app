import 'package:dartz/dartz.dart';
import 'package:news_app/common/shared_code.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/repository/base_news_repository.dart';
import 'package:dio/dio.dart';

class NewsRepository implements BaseNewsRepository {
  final Dio _dio = Dio();
  final String _baseUrl = SharedCode.baseUrl;
  final String _apiKey = SharedCode.apiKeys;

  @override
  Future<Either<String, NewsModel>> getListNews(
      {required String category,
      required int page,
      required int pageSize}) async {
    try {
      final response = await _dio.get(
        _baseUrl,
        queryParameters: {
          'country': 'id',
          'category': category,
          'page': page,
          'pageSize': pageSize,
          'apiKey': _apiKey
        },
      );
      final news = NewsModel.fromJson(response.data);
      return right(news);
    } catch (e) {
      return left(e.toString());
    }
  }
}
