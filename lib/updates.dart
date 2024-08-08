import 'dart:math';

import 'package:app/statusScreen.dart';
import 'package:flutter/material.dart';
import 'package:app/customStatus.dart';
import 'package:flutter/widgets.dart';

class update extends StatefulWidget {
  app createState() => app();
}

class app extends State<update> {
  var list = ["Status privacy", "Settings"];
  var names = [
    "Bharat",
    "Aditya",
    "Rahul",
    "Vishal",
    "Ramlal",
    "Deepak",
    "Ravi",
    "Vikas",
    "Vansh",
    "Ansh"
  ];
  var total = [10, 7, 5, 7, 9, 8, 3, 6, 10, 4];
  var seen = [5, 3, 1, 4, 5, 2, 3, 0, 7, 1];
  static var recent = [];
  @override
  void initState() {
    for (int i = 0; i < names.length; i++) {
      recent.add({"name": names[i], "total": total[i], "seen": seen[i]});
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Updates"),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.camera_alt_outlined),
                const SizedBox(
                  width: 25,
                ),
                const Icon(Icons.search),
                const SizedBox(
                  width: 8,
                ),
                PopupMenuButton(
                    position: PopupMenuPosition.under,
                    itemBuilder: (context) {
                      return list.map((e) {
                        return PopupMenuItem(
                            child: Text(
                          e,
                          style: const TextStyle(fontSize: 17),
                        ));
                      }).toList();
                    })
              ],
            ),
          ],
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 15, right: 10),
                        child: const CircleAvatar(
                          backgroundImage: AssetImage("assets/user (1).png"),
                          radius: 60 / 2,
                        ),
                      ),
                      Positioned(
                          bottom: 10,
                          right: 10,
                          child: Container(
                            padding: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(360),
                                border:
                                    Border.all(color: Colors.white, width: 2)),
                            child: const Icon(
                              Icons.add,
                              color: Colors.black,
                              size: 15,
                            ),
                          ))
                    ],
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "My status",
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 17),
                      ),
                      Text(
                        "Tap to add status updates",
                      )
                    ],
                  )
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.only(left: 15, top: 8, bottom: 8),
                color: Colors.grey.shade300,
                child: const Text(
                  "Recent updates",
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
              ),
            ),
            SliverList.builder(
              itemBuilder: ((context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => statusScreen(
                                  recent: recent[index],
                                )));
                  },
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        child: customScreen(
                          total: recent[index]["total"],
                          seen: recent[index]["seen"],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Text(
                              names[index],
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w900),
                            ),
                            const Text("Today,5:50 pm"),
                          ])),
                      const SizedBox(
                        width: 80,
                      )
                    ],
                  ),
                );
              }),
              itemCount: names.length,
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(bottom: 10, top: 5),
                padding: const EdgeInsets.only(left: 15, top: 8, bottom: 8),
                color: Colors.grey.shade300,
                child: const Text(
                  "Viewed updates",
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
              ),
            ),
            /*SliverList.builder(
              itemBuilder: ((context, index) {
                total = Random().nextInt(10) + 1;
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => statusScreen(
                                  name: names[index],
                                )));
                  },
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        child: customScreen(
                          total: total,
                          seen: Random().nextInt(5),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Text(
                              names[index],
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w900),
                            ),
                            const Text("Today,5:50 pm"),
                          ])),
                      const SizedBox(
                        width: 80,
                      )
                    ],
                  ),
                );
              }),
              itemCount: names.length,
            ),*/
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            )
          ],
        ));
  }
}
