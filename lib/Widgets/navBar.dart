import 'package:flutter/material.dart';
import 'package:motus_client/main.dart';
import 'package:provider/provider.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var selectedIndex = appState.selectedPageIndex;
    return NavigationBar(
      onDestinationSelected: (index){appState.setSelectedPageIndex(index);},
      selectedIndex: selectedIndex,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          label: 'Inicio',
          selectedIcon: Icon(Icons.home),
          tooltip: 'Inicio',
        ),
        NavigationDestination(
          icon: Icon(Icons.group_outlined),
          label: 'Amigos',
          selectedIcon: Icon(Icons.group),
          tooltip: 'Amigos',
        ),
        NavigationDestination(
          icon: Icon(Icons.auto_stories_outlined),
          selectedIcon: Icon(Icons.auto_stories),
          label: 'Emociones',
          tooltip: 'Emociones',
        ),
      ],
    );
  }
}
