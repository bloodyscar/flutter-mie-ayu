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
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        child: BottomNavigationBar(
          onTap: (int currentInd) {
            setState(() {
              currentIndex = currentInd;
            });
          },
          currentIndex: currentIndex,
          fixedColor: Colors.black,
          items: [
            BottomNavigationBarItem(
              backgroundColor: backgroundColor2,
              icon: Icon(
                Icons.home_outlined,
                color: backgroundColor1,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                backgroundColor: backgroundColor2,
                icon: Icon(
                  Icons.chat_outlined,
                  color: backgroundColor1,
                ),
                label: 'Chat'),
            BottomNavigationBarItem(
                backgroundColor: backgroundColor2,
                icon: Icon(
                  Icons.shopping_bag_outlined,
                  color: backgroundColor1,
                ),
                label: 'Cart'),
            BottomNavigationBarItem(
                backgroundColor: backgroundColor2,
                icon: Icon(
                  Icons.person_outline,
                  color: backgroundColor1,
                ),
                label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
