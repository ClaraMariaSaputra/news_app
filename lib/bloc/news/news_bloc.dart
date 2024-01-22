import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/usecase/get_news.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetNews getNews;
  NewsBloc(this.getNews) : super(NewsInitial()) {
    on<GetListNews>((event, emit) async {
      emit(NewsLoading());
      final result = await getNews.getListNews(
          category: event.category, page: event.page, pageSize: event.pageSize);

      result.fold((l) => emit(NewsError(message: l)),
          (r) => emit(NewsLoaded(newsModel: r)));
    });
  }
}
