import 'package:flutter/material.dart';
import 'package:eurointegrate_app/pages/conquistas_screen.dart';
import 'package:eurointegrate_app/pages/guia.dart';
import 'package:eurointegrate_app/pages/home.dart';
import 'package:eurointegrate_app/pages/perfil.dart';
import 'package:eurointegrate_app/pages/video_screen.dart';
import 'package:eurointegrate_app/components/button_navigation.dart';

class MainScreen extends StatefulWidget {
  final String token;

  const MainScreen({Key? key, required this.token}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      Home(token: widget.token),
      VideoScreen(),
      Perfil(token: widget.token),
      GuiaScreen(),
      ConquistasScreen(),
    ];

    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: _screens,
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) {
          setState(() {
            _selectedIndex = index;
            _pageController.jumpToPage(index);
          });
        },
      ),
    );
  }
}
