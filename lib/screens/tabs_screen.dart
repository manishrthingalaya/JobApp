import 'package:flutter/material.dart';
import 'package:job_app/screens/account_screen.dart';
import 'package:job_app/screens/home_screen.dart';
import 'package:job_app/screens/notification_screen.dart';
import 'package:job_app/screens/post_job_screen.dart';
import 'package:job_app/screens/profile_screen.dart';
import 'package:job_app/screens/search_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  final List<String> languages = ['En', 'Sp'];

  String selectedLanguage = 'En';

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _navigateToLoginScreen() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => const AccountScreen()));
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = const HomeScreen();

    if (_selectedPageIndex == 2) {
      activePage = const PostJobScreen();
    } else if (_selectedPageIndex == 3) {
      activePage = const NotificationScreen();
    } else if (_selectedPageIndex == 4) {
      activePage = const ProfileScreen();
    } else if (_selectedPageIndex == 1) {
      activePage = const SearchScreen();
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // backgroundColor: const Color.fromARGB(255, 20, 20, 20),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/Images/logo-1.png',
                  width: 80,
                  height: 80,
                ),
              ],
            ),
            Row(
              children: [
                const Row(
                  children: [
                    Icon(
                      Icons.language,
                      color: Colors.white,
                      size: 20,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                DropdownButton<String>(
                  dropdownColor: Theme.of(context).appBarTheme.backgroundColor,
                  value: selectedLanguage,
                  underline: const SizedBox(),
                  items:
                      languages.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Row(
                        children: [
                          Text(
                            value,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedLanguage = newValue!;
                    });
                  },
                ),
                const SizedBox(
                  width: 8,
                ),
                TextButton(
                  onPressed: () {
                    _navigateToLoginScreen();
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          currentIndex: _selectedPageIndex,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline_sharp),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_outlined),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined),
              label: '',
            ),
          ]),
    );
  }
}
