import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app/chatScreen.dart';
import 'package:flutter/widgets.dart';

class chat extends StatefulWidget {
  app createState() => app();
}

class app extends State<chat> {
  var list = [
    "New group",
    "New broadcast",
    "Linked devices",
    "Starred messages",
    "Payments",
    "Settings"
  ];
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
    "Ansh",
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              const Icon(Icons.camera_alt_outlined),
              const SizedBox(width: 8,),
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
                  }),
            ],
            toolbarHeight: 45,
            pinned: true,
            title: const Text(
              "WhatsApp",
              style:
                  TextStyle(fontWeight: FontWeight.w700, color: Colors.green),
            ),
          ),
          //search start
          SliverToBoxAdapter(
              child: Container(
                  margin: const EdgeInsets.only(
                      left: 13, right: 13, top: 24, bottom: 12),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: const Color(0xffd3d3d3),
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(children: [
                    const Icon(
                      Icons.search,
                      size: 30,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: const Text(
                        "Search...",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ]))), //search last
          //name list start
          SliverList.builder(
            itemBuilder: ((context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => chatScreen(
                                name: names[index],
                              )));
                },
                child: Row(
                  children: [
                    const SizedBox(
                      width: 13,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 12, bottom: 12),
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/image.jpg"),
                        radius: 50 / 2,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                names[index],
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w900),
                              ),
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                            const Text(
                              "2/12/24",
                              style: TextStyle(fontSize: 12),
                            ),
                            const SizedBox(
                              width: 13,
                            )
                          ],
                        ),
                        const Row(
                          children: [
                            Expanded(
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                "This is message from bharat kumar suthar",
                                style: TextStyle(
                                    //fontWeight: FontWeight.w500,
                                    fontSize: 16),
                              ),
                            ),
                            SizedBox(
                              width: 25,
                            )
                          ],
                        ),
                      ],
                    ))
                  ],
                ),
              );
            }),
            itemCount: names.length,
          ), //name list last
          SliverToBoxAdapter(
            child: Column(
              children: [
                const Divider(
                  height: 1,
                ),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                    text: const TextSpan(children: [
                  TextSpan(
                    text: "Your personal chats are",
                    style: TextStyle(fontSize: 13, color: Colors.black),
                  ),
                  TextSpan(
                      text: " end-to-end encrypted",
                      style: TextStyle(fontSize: 13, color: Colors.green))
                ])),
                const SizedBox(
                  height: 80,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
