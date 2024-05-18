// ignore: avoid_web_libraries_in_flutter
import 'dart:js';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  title: Text(
                    "Dashboard",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(color: Colors.white54),
                  ),
                  subtitle: Text(
                    "Nom User",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(color: Colors.white54),
                  ),
                  trailing: const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                      "assets/images/citycons+road+transport+icon-1320136425633085703 (1).png",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
          Container(
            color: Theme.of(context).primaryColor,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                ),
              ),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 40,
                mainAxisSpacing: 30,
                children: [
                  itemDashboard("Reservations", Icons.shop, Colors.deepOrange),
                  itemDashboard("Reservations", Icons.shop, Colors.green),
                  itemDashboard("Reservations", Icons.shop, Colors.purple),
                  itemDashboard("Reservations", Icons.shop, Colors.brown),
                  itemDashboard("Reservations", Icons.shop, Colors.indigo),
                  itemDashboard("Reservations", Icons.shop, Colors.teal),
                  itemDashboard("Reservations", Icons.shop, Colors.blue),
                  itemDashboard("Reservations", Icons.shop, Colors.pinkAccent),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

itemDashboard(String title, IconData iconData, Color background) => Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 5),
              color: Theme.of(context as BuildContext)
                  .primaryColor
                  .withOpacity(.2),
              spreadRadius: 2,
              blurRadius: 5,
            )
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: background,
              shape: BoxShape.circle,
            ),
            child: Icon(
              iconData,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: Theme.of(context as BuildContext).textTheme.titleMedium,
          )
        ],
      ),
    );
