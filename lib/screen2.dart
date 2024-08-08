import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app/calls.dart';
import 'package:app/chats.dart';
import 'package:app/updates.dart';

class mainScreen extends StatefulWidget {
  app createState() => app();
}

class app extends State<mainScreen> with TickerProviderStateMixin {
  late TabController tabController;
  var tabs = ["Chats", "Updates", "Calls"];
  var icons = ["chat (1).png", "refresh.png", "device.png"];
  var float = [
    const Icon(Icons.message_outlined),
    const Icon(Icons.camera_alt_outlined),
    const Icon(Icons.call)
  ];
  var list;
  var current = 0;
  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: tabs.length, vsync: this);
    list = List.filled(tabs.length, false);
    list[0] = true;
    tabController.addListener(() {
      current = tabController.index;
      list[tabController.previousIndex] = false;
      list[tabController.index] = true;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
        body: Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [chat(), update(), calls()],
              ),
            ),
            Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Divider(
                  height: 1,
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: tabs.map((e) {
                      return InkWell(
                        onTap: () {
                          tabController.animateTo(
                            tabs.indexOf(e),
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 4, bottom: 4),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: list[tabs.indexOf(e)]
                                      ? Colors.green
                                      : Colors.transparent),
                              child: Image.asset(
                                "assets/${icons[tabs.indexOf(e)]}",
                                height: 25,
                                width: 25,
                              ),
                            ),
                            Text(
                              e,
                              style: TextStyle(
                                  fontWeight: list[tabs.indexOf(e)]
                                      ? FontWeight.w900
                                      : FontWeight.normal,
                                  fontSize: 17),
                            )
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                )
              ],
            )
          ],
        ),
        Positioned(
            right: 15,
            bottom: 90,
            child: Container(
              padding: const EdgeInsets.all(17),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.green),
              child: float[current],
            ))
      ],
    ));
  }
}//last 
