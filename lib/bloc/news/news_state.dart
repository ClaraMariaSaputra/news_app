part of 'news_bloc.dart';

sealed class NewsState extends Equatable {
  const NewsState();
  
  @override
  List<Object> get props => [];
}

final class NewsInitial extends NewsState {}


final class NewsLoading extends NewsState {}

final class NewsLoaded extends NewsState {
  final NewsModel newsModel;

  const NewsLoaded({required this.newsModel});

  @override
  List<Object> get props => [newsModel];
}

final class NewsError extends NewsState {
  final String message;

  const NewsError({required this.message});

  @override
  List<Object> get props => [message];
}

