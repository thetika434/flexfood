import 'package:flutter/material.dart';
import 'dashboard_screen.dart';
import 'etudiants_screen.dart';
import 'transactions_screen.dart';
import 'agents_screen.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback onLogout;
  const HomeScreen({super.key, required this.onLogout});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _idx = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      DashboardScreen(onLogout: widget.onLogout),
      const EtudiantsScreen(),
      const TransactionsScreen(),
      const AgentsScreen(),
    ];

    return Scaffold(
      body: screens[_idx],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _idx,
        onTap: (i) => setState(() => _idx = i),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF1B5E20),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard_outlined),  activeIcon: Icon(Icons.dashboard),  label: 'Tableau bord'),
          BottomNavigationBarItem(icon: Icon(Icons.people_outline),      activeIcon: Icon(Icons.people),     label: 'Étudiants'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long_outlined),activeIcon: Icon(Icons.receipt_long),label: 'Transactions'),
          BottomNavigationBarItem(icon: Icon(Icons.badge_outlined),      activeIcon: Icon(Icons.badge),      label: 'Agents'),
        ],
      ),
    );
  }
}
