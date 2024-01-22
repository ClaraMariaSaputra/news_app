import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:news_app/bloc/news/news_bloc.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/pages/home_page.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({this.title, super.key});
  final String? title;

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  static const _pageSize = 10;
  final PagingController<int, Article> _pagingController =
      PagingController(firstPageKey: 0);

  List<Article> _articles = [];

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      context.read<NewsBloc>().add(
            GetListNews(
                category: widget.title!.toLowerCase(),
                page: pageKey,
                pageSize: _pageSize),
          );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                  (route) => false);
            },
          ),
          title: Text(widget.title ?? ""),
        ),
        body: BlocConsumer<NewsBloc, NewsState>(
          listener: (context, state) {
            if (state is NewsLoaded) {
              _articles = state.newsModel.articles!;
              final isLastPage = state.newsModel.articles!.length < _pageSize;
              if (isLastPage) {
                _pagingController.appendLastPage(_articles);
              } else {
                final nextPage = state.newsModel.articles!.length ~/ _pageSize;
                _pagingController.appendPage(_articles, nextPage);
              }
            }
            if (state is NewsError) {
              _pagingController.error = state.message;
            }
          },
          builder: (context, state) {
            if (state is NewsError) {
              return Center(
                child: Text(state.message),
              );
            }
            return PagedListView<int, Article>(
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate<Article>(
                itemBuilder: (context, item, index) => ListTile(
                  title: Text(item.title ?? ""),
                  subtitle: Text(item.description ?? ""),
                  // leading: Image.network(item.urlToImage ?? ""),
                ),
              ),
            );
          },
        ));
  }
}
