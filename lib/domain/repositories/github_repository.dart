import 'package:github_find/domain/entities/user.dart';
import 'package:github_find/domain/entities/repo.dart';

abstract class IGithubRepository {
  Future<User> getUser(String username);
  Future<List<Repo>> getRepositories(String username);
}