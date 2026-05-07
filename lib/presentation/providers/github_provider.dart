import 'package:flutter/material.dart';
import 'package:github_find/domain/entities/repo.dart';
import 'package:github_find/domain/entities/user.dart';
import 'package:github_find/domain/repositories/github_repository.dart';

class GithubProvider extends ChangeNotifier {
  final IGithubRepository repository;
  User? user;
  List<Repo>? repos;
  bool isLoading = false;
  String? error;

  GithubProvider(this.repository);

  Future<void> buscarUsuario(String username) async {
    final cleanUsername = username.trim();
    if (cleanUsername.isEmpty) return;

    reset();
    isLoading = true;
    notifyListeners();

    try {
      user = await repository.getUser(cleanUsername);
      repos = await repository.getRepositories(cleanUsername);
    } catch (e) {
      error = 'Erro na busca. Verifique sua conexão.';
      debugPrint('Erro detalhado: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void reset() {
    user = null;
    repos = null;
    isLoading = false;
    error = null;
    notifyListeners();
  }
}
