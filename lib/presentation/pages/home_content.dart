import 'package:flutter/material.dart';
import 'package:github_find/presentation/providers/github_provider.dart';
import 'package:http/http.dart' as http;
import '../widgets/search_input.dart';
import 'package:github_find/presentation/widgets/card_info_box.dart';
import 'package:github_find/presentation/widgets/repo_item.dart';
import 'dart:convert';
import 'package:provider/provider.dart';


class HomeContent extends StatelessWidget {
  final TextEditingController inputController;

  const HomeContent({super.key, required this.inputController});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<GithubProvider>();

    return  Container(
      decoration: BoxDecoration(color: Colors.grey[200]),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Card(
              color: Colors.white,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: SearchInput(
                        controller: inputController,
                          onSearch: () => context.read<GithubProvider>().buscarUsuario(inputController.text),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Column(
                children: [
                  if (provider.isLoading)
                    const CircularProgressIndicator()
                  else if (provider.user != null)
                    Expanded(
                      child: Column(
                        children: [
                          Card(
                            color: Colors.white,
                            elevation: 2, // sombra
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 50,
                                        backgroundImage: NetworkImage(
                                          provider.user!.avatarUrl,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              provider.user!.name ?? '',
                                              style: Theme.of(
                                                context,
                                              ).textTheme.headlineSmall,
                                            ),
                                            Text('@' + provider.user!.login),
                                            Text(
                                              provider.user!.bio ?? '',
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: true,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 15),
                                  Row(
                                    spacing: 10,
                                    children: [
                                      CardInfoBox(
                                        infoTitle: 'Seguidores',
                                        infoValue: (provider.user!.followers ?? 0).toString(),
                                      ),
                                      CardInfoBox(
                                        infoTitle: 'Seguindo',
                                        infoValue: (provider.user!.following ?? 0).toString(),
                                      ),
                                      CardInfoBox(
                                        infoTitle: 'Repositórios',
                                        infoValue: (provider.user!.publicRepos ?? 0).toString(),
                                      ),
                                      CardInfoBox(
                                        infoTitle: 'Gists',
                                        infoValue: (provider.user!.publicGists ?? 0).toString(),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Expanded(
                            child: Card(
                              color: Colors.white,
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Repositórios',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Expanded(
                                      child: ListView(
                                        padding: EdgeInsets.zero,
                                        children: [
                                          if (provider.repos != null && provider.repos!.isNotEmpty)
                                            for (var repo in provider.repos!)
                                              RepoItem(repo: repo)
                                          else
                                            const Center(
                                              child: Text(
                                                'Nenhum repositório encontrado',
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  else if (provider.error != null)
                    Expanded(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.error_outline, size: 60, color: Colors.red),
                            const SizedBox(height: 10),
                            Text(
                              provider.error!,
                              style: const TextStyle(fontSize: 16, color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    )
                  else
                    const Expanded(
                      child: Center(
                        child: Text('Digite um usuário e busque'),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
