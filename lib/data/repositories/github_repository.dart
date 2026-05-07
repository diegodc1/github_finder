import 'package:github_find/domain/entities/repo.dart';
import 'package:github_find/domain/entities/user.dart';
import 'package:github_find/domain/repositories/github_repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/material.dart';


class GithubRepositoryImpl implements IGithubRepository {
  final http.Client client;
  static const gitHubUrl = 'https://api.github.com';

  GithubRepositoryImpl(this.client);

  @override
  Future<User> getUser(String username) async {
    try {
      final userResponse = await client.get(
        Uri.parse('$gitHubUrl/users/$username'),
        headers: {'User-Agent': 'GitHub-Finder-App'},
      ).timeout(const Duration(seconds: 10));

      if (userResponse.statusCode == 200) {
        final userData = jsonDecode(userResponse.body);
        return User.fromJson(userData);
      } else {
        throw Future.error("Não foi possível buscar o usuário");
      }
    } catch (e) {
      debugPrint('Erro detalhado: $e');
      throw Exception('Erro ao buscar usuário');
    }
  }

  @override
  Future<List<Repo>> getRepositories(String username) async {
    final reposResponse = await client.get(
      Uri.parse('$gitHubUrl/users/$username/repos'),
      headers: {'User-Agent': 'GitHub-Finder-App'},
    ).timeout(const Duration(seconds: 10));

    if (reposResponse.statusCode == 200) {
      final List decodedRepos = jsonDecode(reposResponse.body);
      return decodedRepos.map((e) => Repo.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}