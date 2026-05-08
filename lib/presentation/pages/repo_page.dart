import 'package:flutter/material.dart';
import 'package:github_find/domain/entities/repo.dart';
import 'package:github_find/presentation/providers/github_provider.dart';
import 'package:github_find/presentation/widgets/card_repo_info_box.dart';
import 'package:github_find/presentation/widgets/commit_item.dart';
import 'package:github_find/presentation/widgets/contributor_item.dart';
import 'package:github_find/presentation/widgets/language_badget.dart';
import 'package:github_find/presentation/widgets/version_item.dart';
import 'package:provider/provider.dart';

class RepoPage extends StatefulWidget {
  const RepoPage({super.key});

  @override
  State<RepoPage> createState() => _RepoPageState();
}

class _RepoPageState extends State<RepoPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<GithubProvider>();

    return Container(
      decoration: BoxDecoration(color: Colors.grey[200]),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            spacing: 20,
            children: [
              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 20,
                  ),
                  child: Column(
                    spacing: 15,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.book_outlined,
                            size: 25,
                            color: Colors.blue,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "flutter/flutter",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Flutter makes it easy and fast to build beautiful apps for mobile and beyond",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade700,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          CardRepoInfoBox(
                            icon: Icons.star_outline,
                            infoTitle: 'Stars',
                            infoValue: '160k',
                          ),
                          CardRepoInfoBox(
                            icon: Icons.fork_right_outlined,
                            infoTitle: 'Forks',
                            infoValue: '26k',
                          ),
                          CardRepoInfoBox(
                            icon: Icons.remove_red_eye_outlined,
                            infoTitle: 'Watchers',
                            infoValue: '3.5k',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Linguagens',
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  Wrap(
                    alignment: WrapAlignment.start,
                    runAlignment: WrapAlignment.start,
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      LanguageBadget(language: "Dart", percentage: 10, color: Colors.blue),
                      LanguageBadget(language: "JavaScript", percentage: 30, color: Colors.yellow),
                      LanguageBadget(language: "Dart", percentage: 10, color: Colors.blue),
                      LanguageBadget(language: "Java", percentage: 30, color: Colors.lightGreen),
                      LanguageBadget(language: "Ruby", percentage: 30, color: Colors.redAccent),
                    ],
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Últimos Commits',
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                          child: Column(
                            spacing: 0,
                            children: [
                              CommitItem(commitMessage: "Fix overflow in login screen", username: "diegodc1", date: "2 hours ago"),
                              Divider(color: Colors.grey.shade300, thickness: 1),
                              CommitItem(commitMessage: "Fix overflow in login screen", username: "diegodc1", date: "2 hours ago"),
                              Divider(color: Colors.grey.shade300, thickness: 1),
                              CommitItem(commitMessage: "Fix overflow in login screen", username: "diegodc1", date: "2 hours ago"),
                              Divider(color: Colors.grey.shade300, thickness: 1),
                              CommitItem(commitMessage: "Fix overflow in login screen", username: "diegodc1", date: "2 hours ago"),
                              Divider(color: Colors.grey.shade300, thickness: 1),
                              CommitItem(commitMessage: "Fix overflow in login screen", username: "diegodc1", date: "2 hours ago"),
                            ],
                          )
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Últimas Versões',
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                            child: Column(
                              spacing: 0,
                              children: [
                                VersionItem(versionTag: "3.19.0", description: "Flutter 3.19 stable", date: "Feb 15, 2024"),
                                Divider(color: Colors.grey.shade300, thickness: 1),
                                VersionItem(versionTag: "3.18.0", description: "Flutter 3.18 stable", date: "Feb 15, 2024"),
                                Divider(color: Colors.grey.shade300, thickness: 1),
                                VersionItem(versionTag: "3.17.0", description: "Flutter 3.17 stable", date: "Feb 15, 2024"),
                                Divider(color: Colors.grey.shade300, thickness: 1),
                                VersionItem(versionTag: "3.17.0", description: "Flutter 3.17 stable", date: "Feb 15, 2024"),
                                Divider(color: Colors.grey.shade300, thickness: 1),
                                VersionItem(versionTag: "3.17.0", description: "Flutter 3.17 stable", date: "Feb 15, 2024"),
                                Divider(color: Colors.grey.shade300, thickness: 1),
                              ],
                            )
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Contribuidores',
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  Wrap(
                    alignment: WrapAlignment.start,
                    runAlignment: WrapAlignment.start,
                    spacing: 20,
                    runSpacing: 10,
                    children: [
                      ContributorItem(linkImage: "https://picsum.photos/200", username: "diegodc1"),
                      ContributorItem(linkImage: "https://picsum.photos/200", username: "diegodc1"),
                      ContributorItem(linkImage: "https://picsum.photos/200", username: "diegodc1"),
                    ],
                  ),
                  SizedBox(height: 25),
                ],
              
              ),
            ],
          ),
        ),
      ),
    );
  }
}



