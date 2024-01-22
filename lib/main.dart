import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_tags/repositories/hashtag_repository.dart';
import 'package:insta_tags/screens/home_screen.dart';
import 'package:insta_tags/services/add_hashtag/add_hashtag_bloc.dart';
import 'package:insta_tags/services/list_hashtag/list_hashtag_bloc.dart';
import 'package:insta_tags/services/remove_hashtag/remove_hashtag_bloc.dart';

final List<Map<String, dynamic>> listHashtags = [
  {
    'name': 'flutter',
  },
  {
    'name': 'dart',
  },
  {
    'name': 'hesed',
  },
  {
    'name': 'pdg',
  },
  {
    'name': 'koyiabe',
  },
  {
    'name': 'otto',
  },
  {
    'name': 'tome3',
  },
  {
    'name': 'tome4',
  },
  {
    'name': 'outro',
  },
];

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final HashtagRepository hashtagRepository = HashtagRepository(
      listHashtags: listHashtags,
    );
    return MultiBlocProvider(
        providers: [
          BlocProvider<ListHashtagBloc>(
            lazy: false,
            create: (context) => ListHashtagBloc(
                hashtagRepository,
            ),
          ),
          BlocProvider(
              create: (context) => AddHashtagBloc(
                hashtagRepository,
              ),
          ),
          BlocProvider(
            create: (context) => RemoveHashtagBloc(
              hashtagRepository,
            ),
          )

        ],
        child: const MaterialApp(
          title: 'Insta Tags',
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
        ),
    );
  }
}
