part of 'news_bloc.dart';

sealed class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}


class GetListNews extends NewsEvent {
  final String category;
  final int page;
  final int pageSize;

  const GetListNews({required this.category, required this.page, required this.pageSize});

  @override
  List<Object> get props => [category, page, pageSize];
}