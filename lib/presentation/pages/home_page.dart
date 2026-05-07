import 'package:flutter/material.dart';
import 'package:github_find/presentation/pages/favorites_page.dart';
import 'package:github_find/presentation/pages/home_content.dart';
import 'package:github_find/presentation/pages/repo_page.dart';
import 'package:github_find/presentation/providers/github_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = TextEditingController();
  int currentIndex = 0;

  Widget getPage() {
    switch (currentIndex) {
      case 0:
        return HomeContent(inputController: controller);
      case 1:
        return RepoPage();
      case 2:
        return const FavoritesPage();
      default:
        return HomeContent(inputController: controller,);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscador de Perfil GitHub'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<GithubProvider>().reset();
              controller.clear();
            },
          ),
        ],
      ),
      body: getPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            activeIcon: Icon(Icons.search),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            activeIcon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}
