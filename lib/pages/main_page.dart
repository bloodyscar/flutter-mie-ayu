import 'package:flutter/material.dart';
import 'package:mie_ayu_rawalumbu/pages/CartPage/cart_page.dart';
import 'package:mie_ayu_rawalumbu/pages/ChatPage/chat_page.dart';
import 'package:mie_ayu_rawalumbu/pages/HomePage/home_page.dart';
import 'package:mie_ayu_rawalumbu/pages/ProfilePage/profile_page.dart';
import 'package:mie_ayu_rawalumbu/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  final screens = [
    const HomePage(),
    const ChatPage(),
    const CartPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: screens[currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        child: BottomNavigationBar(
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.3),
          onTap: (int currentInd) {
            setState(() {
              currentIndex = currentInd;
            });
          },
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(
              backgroundColor: backgroundColor1,
              icon: Icon(
                Icons.home_outlined,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                backgroundColor: backgroundColor1,
                icon: Icon(
                  Icons.chat_outlined,
                ),
                label: 'Chat'),
            BottomNavigationBarItem(
                backgroundColor: backgroundColor1,
                icon: Icon(
                  Icons.shopping_bag_outlined,
                ),
                label: 'Cart'),
            BottomNavigationBarItem(
                backgroundColor: backgroundColor1,
                icon: Icon(
                  Icons.person_outline,
                ),
                label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
