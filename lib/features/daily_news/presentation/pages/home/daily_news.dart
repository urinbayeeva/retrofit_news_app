import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:retrofit_news_app/features/daily_news/presentation/bloc/article/remote/remote_bloc.dart';
import 'package:retrofit_news_app/features/daily_news/presentation/bloc/article/remote/remote_state.dart';
// import 'package:flutter/widgets.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daily News"),
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteArticlesBloc, RemoteArticleState>(
        builder: (_, state) {
      if (state is RemoteArticlesLoading) {
        return Center(
          child: LoadingAnimationWidget.newtonCradle(
            color: Colors.black,
            size: 2 * 100,
          ),
        );
      }
      if (state is RemoteArticlesError) {
        return const Center(child: Icon(Icons.refresh));
      }
      if (state is RemoteArticlesDone) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("$index "),
            );
          },
          itemCount: state.articles!.length,
        );
      }
      return SizedBox();
    });
  }
}
