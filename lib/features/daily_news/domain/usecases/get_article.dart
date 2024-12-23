import 'package:retrofit_news_app/core/resources/data_state.dart';
import 'package:retrofit_news_app/core/usecases/usecase.dart';
import 'package:retrofit_news_app/features/daily_news/domain/entities/article.dart';
import 'package:retrofit_news_app/features/daily_news/domain/repository/article_repository.dart';

class GetArticleUseCase
    implements Usecase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);
  @override
  Future<DataState<List<ArticleEntity>>> call({void param}) =>
      _articleRepository.getNewArticle();
}
