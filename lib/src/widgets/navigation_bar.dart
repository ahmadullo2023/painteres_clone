import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import '../pages/profil.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedItemColor: Colors.red,
        currentIndex: currentPageIndex,
        unselectedItemColor: Colors.white,
        items: const[
          BottomNavigationBarItem(
            backgroundColor:  Colors.black,
            icon: Icon(Icons.home_outlined,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor:  Colors.black,
            icon: Icon(Icons.menu,),
            label: 'Boards',
          ),
          BottomNavigationBarItem(
            backgroundColor:  Colors.black,
            icon: Icon(Icons.add,),
            label: 'add',
          ),
          BottomNavigationBarItem(
            backgroundColor:  Colors.black,
            icon: Icon(Icons.person,),
            label: 'Profile',
          ),
        ],
      ),
      body: <Widget>[
        const Home(),
        Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: const Text('Page 3'),
        ),
        Container(
          color: Colors.green,
          alignment: Alignment.center,
          child: const Text('Page 2'),
        ),
        const Profile(),
      ][currentPageIndex],
    );
  }
}


