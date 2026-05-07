import 'package:flutter/material.dart';
import 'package:github_find/domain/entities/repo.dart';
import 'package:go_router/go_router.dart';

class RepoItem extends StatelessWidget {
  final Repo repo;

  const RepoItem({super.key, required this.repo});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push('/repo', extra: repo),
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade200)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              repo.name ?? 'Sem nome',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              repo.description ?? 'Sem descrição',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.grey[700]),
            ),
            SizedBox(height: 10),

            Row(
              children: [
                Icon(Icons.star, size: 16, color: Colors.amber),
                SizedBox(width: 4),
                Text('${repo.stargazersCount ?? 0}'),

                SizedBox(width: 16),
                Icon(Icons.code, size: 16, color: Colors.grey),
                SizedBox(width: 4),
                Text(repo.language ?? 'N/A')
              ],
            )
          ],
        ),
      ),
    );
  }
}
