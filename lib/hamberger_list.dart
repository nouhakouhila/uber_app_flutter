import 'package:flutter/material.dart';
import 'berger_page.dart';

class HambergerList extends StatefulWidget {
  final int row;
  const HambergerList({super.key, required this.row});
  @override
  State<HambergerList> createState() => _HambergerListState();
}

class _HambergerListState extends State<HambergerList> {
  @override
  Widget build(BuildContext context) {
    int items = 10;
    Widget busImage = SizedBox(
      height: 160,
      child: Image.asset("images/icons8-driver-100.png"),
    );
    Widget travelerImage = SizedBox(
      height: 170,
      child: Image.asset("images/icons8-favorite-folder-100.png"),
    );
    return SliverToBoxAdapter(
      child: Container(
        height: widget.row == 2 ? 330 : 240,
        margin: const EdgeInsets.only(top: 10),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items,
          itemBuilder: (context, index) {
            bool reverse = widget.row == 2 ? index.isEven : index.isOdd;
            return Stack(
              children: [
                Container(
                  height: 240,
                  width: 200,
                  margin: EdgeInsets.only(
                    left: 20,
                    right: index == items ? 20 : 0,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(BergerPage.tag);
                    },
                    child: Card(
                      color: Theme.of(context).primaryColor,
                      elevation: 3,
                      margin: const EdgeInsets.all(10),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(45),
                          bottomRight: Radius.circular(15),
                          topLeft: Radius.circular(45),
                          topRight: Radius.circular(45),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            Text(
                              reverse ? "Berguer" : "Baken Burger",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                const Spacer(),
                                const Text(
                                  "15.9 \$ USD",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Spacer(),
                                SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadiusDirectional.circular(10),
                                    ),
                                    child: const Icon(Icons.add),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: reverse ? 50 : 50,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(BergerPage.tag);
                    },
                    child: reverse ? busImage : travelerImage,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
