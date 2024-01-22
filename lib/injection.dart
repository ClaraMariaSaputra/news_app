import 'package:get_it/get_it.dart';
import 'package:news_app/bloc/news/news_bloc.dart';
import 'package:news_app/bloc/splash/splash_cubit.dart';
import 'package:news_app/repository/base_news_repository.dart';
import 'package:news_app/repository/news_repository.dart';
import 'package:news_app/usecase/get_news.dart';

final locator = GetIt.instance;

void initialize() {
  //cubit or bloc
  locator.registerFactory(() => SplashCubit());
  locator.registerFactory(() => NewsBloc(locator()));

  //usecase
  locator.registerFactory(() => GetNews(locator()));

  //repository
  locator.registerLazySingleton<BaseNewsRepository>(() => NewsRepository());
}
