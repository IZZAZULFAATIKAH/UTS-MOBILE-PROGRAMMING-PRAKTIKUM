import 'package:flutter/material.dart';
import '../data/coffee_repository.dart';
import '../models/coffee.dart';
import 'explore_screen.dart';
import 'home_screen.dart';

/// Kerangka utama dengan BottomNavigation (Beranda & Jelajah).
class MainShell extends StatefulWidget {
  const MainShell({super.key});
  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _index = 0;
  late final Future<List<Coffee>> _future = CoffeeRepository().fetchAll();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Coffee>>(
      future: _future,
      builder: (context, snap) {
        if (snap.connectionState != ConnectionState.done) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        if (snap.hasError) {
          return Scaffold(body: Center(child: Text('Gagal memuat data: ${snap.error}')));
        }
        final data = snap.data!;
        final pages = [
          HomeScreen(coffees: data, onSeeAll: () => setState(() => _index = 1)),
          ExploreScreen(coffees: data),
        ];
        return Scaffold(
          body: pages[_index],
          bottomNavigationBar: NavigationBar(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.transparent,
            indicatorColor: const Color(0xFFD7A86E),
            selectedIndex: _index,
            onDestinationSelected: (i) => setState(() => _index = i),
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home),
                label: 'Beranda',
              ),
              NavigationDestination(
                icon: Icon(Icons.explore_outlined),
                selectedIcon: Icon(Icons.explore),
                label: 'Jelajah',
              ),
            ],
          ),
        );
      },
    );
  }
}