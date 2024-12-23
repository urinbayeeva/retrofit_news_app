import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:retrofit_news_app/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:retrofit_news_app/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:retrofit_news_app/features/daily_news/domain/repository/article_repository.dart';
import 'package:retrofit_news_app/features/daily_news/domain/usecases/get_article.dart';
import 'package:retrofit_news_app/features/daily_news/presentation/bloc/article/remote/remote_bloc.dart';

final sl = GetIt.instance;

Future<void> initiliazDependencies() async {
  sl.registerSingleton<Dio>(Dio());

  //Api Service
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  //Repository
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));

  //UseCases
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));

  //Bloc
  sl.registerFactory<RemoteArticlesBloc>(
    () => RemoteArticlesBloc(sl())
  );
}
