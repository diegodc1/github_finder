import 'package:flutter/material.dart';
import 'package:github_find/data/repositories/github_repository.dart';
import 'package:github_find/presentation/pages/home_page.dart';
import 'package:github_find/presentation/providers/github_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'domain/repositories/github_repository.dart';

import 'package:github_find/domain/entities/repo.dart';
import 'package:github_find/presentation/pages/repo_page.dart';

final GoRouter _router = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/repo',
      builder: (context, state) {
        final repo = state.extra as Repo;
        return RepoPage();
      },
    ),
  ]
);

void main() {
  final IGithubRepository repository = GithubRepositoryImpl(http.Client());
  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GithubProvider(repository)),
      ],
      child: const GithubFind(),
    ),
  );
}

class GithubFind extends StatelessWidget {
  const GithubFind({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Buscardor de perfil Github',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        textTheme: GoogleFonts.ovoTextTheme(),
      ),
      routerConfig: _router,
    );
  }
}
