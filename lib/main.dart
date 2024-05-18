//import 'dart:html';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'header.dart';
import 'categories.dart';
import 'hamberger_list.dart';
import 'berger_page.dart';
import 'pages/login_page.dart';
//import 'pages/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.teal,
        cardColor: Colors.white,
        appBarTheme: const AppBarTheme(color: Colors.purple, centerTitle: true),
        bottomAppBarTheme: const BottomAppBarTheme(color: Colors.purple),
        floatingActionButtonTheme:
            const FloatingActionButtonThemeData(backgroundColor: Colors.purple),
      ),
      home: const Hamberger(),
      routes: {BergerPage.tag: (_) => const BergerPage()},
      debugShowCheckedModeBanner: false,
    );
  }
}

class Hamberger extends StatefulWidget {
  const Hamberger({super.key});

  @override
  State<Hamberger> createState() => _HambergerState();
}

class _HambergerState extends State<Hamberger> {
  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true, //to fix the appbar
            title: const Text('Deliver Me'),
            leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
            actions: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.shopping_cart))
            ],
          ),
          const Header(),
          const Categories(),
          const HambergerList(
            row: 1,
          ),
          const HambergerList(
            row: 2,
          ),
        ],
      ),
      /*floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.home,
        ),
      ),*/
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        index: index,
        backgroundColor: Colors.transparent,
        height: 54,
        color: const Color.fromARGB(255, 93, 18, 139),
        items:  const <Widget>[
          Icon(
            Icons.bus_alert,
            size: 25,
            color: Colors.white,
          ),
          Icon(
            Icons.home,
            size: 25,
            color: Colors.white,
            //semanticLabel: Text('Home'),
            //key: Text("Home"),
          ),
          Icon(
            Icons.manage_accounts,
            size: 25,
            color: Colors.white,
          ),
        ],
        onTap: (index) {
          //Handle button tap
          setState(() {
            index = index;
            //print(index);
            if (index == 2) {
              //print(index);
              //MaterialPageRoute(builder: (_) => const LoginPage());
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            }
          });
        },
        letIndexChange: (index) => true,
      ),

      /*bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(45),
        ),
        child: Container(
          color: Colors.black38,
          child: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            child: Row(
              children: [
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.add_alert),
                  color: Colors.white,
                  onPressed: () {},
                ),
                const Spacer(),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.turned_in),
                  color: Colors.white,
                  onPressed: () {},
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),*/
    );
  }
}
