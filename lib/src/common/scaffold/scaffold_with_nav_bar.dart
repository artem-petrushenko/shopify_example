import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavBar extends StatefulWidget {
  const ScaffoldWithNavBar({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  State<ScaffoldWithNavBar> createState() => _ScaffoldWithNavBarState();
}

class _ScaffoldWithNavBarState extends State<ScaffoldWithNavBar> {
  final ValueNotifier<int> _index = ValueNotifier(0);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: widget.navigationShell,
        bottomNavigationBar: ValueListenableBuilder(
          valueListenable: _index,
          builder: (BuildContext context, int selectedIndex, Widget? child) =>
              NavigationBar(
            selectedIndex: selectedIndex,
            onDestinationSelected: (index) => _onTap(index),
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
              NavigationDestination(
                icon: Icon(Icons.shopping_cart),
                label: 'Cart',
              ),
            ],
          ),
        ),
      );

  void _onTap(int index) {
    if (index == _index.value) return;
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
    _index.value = index;
  }
}
