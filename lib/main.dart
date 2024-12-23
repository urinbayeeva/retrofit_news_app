import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retrofit_news_app/features/daily_news/presentation/bloc/article/remote/remote_bloc.dart';
import 'package:retrofit_news_app/features/daily_news/presentation/bloc/article/remote/remote_event.dart';
import 'package:retrofit_news_app/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:retrofit_news_app/injection_container.dart';

void main() async {
  await initiliazDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticlesBloc>(
        create: (BuildContext context) => sl()..add(GetArticles()),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: DailyNews(),
        ));
  }
}
