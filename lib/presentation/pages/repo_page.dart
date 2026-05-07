import 'package:flutter/material.dart';
import 'package:github_find/domain/entities/repo.dart';
import 'package:github_find/presentation/providers/github_provider.dart';
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

    return Container(child: Text("texp"));

  }
}
