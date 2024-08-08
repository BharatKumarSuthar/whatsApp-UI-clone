import 'package:flutter/material.dart';

class calls extends StatefulWidget {
  app createState() => app();
}

class app extends State<calls> {
  var list = ["Clear call logs", "Settings"];
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
        appBar: AppBar(
          toolbarHeight: 45,
          title: const Text("Calls"),
          actions: [
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
        body: CustomScrollView(
          slivers: [
            SliverList.builder(
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    const SizedBox(
                      width: 13,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 8,
                        bottom: 8,
                      ),
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/calluser.jpg"),
                        radius: 45 / 2,
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
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                        const Text("Today,5:50 pm")
                      ],
                    )),
                    const SizedBox(
                      width: 50,
                    ),
                    const Icon(
                      Icons.video_call,
                      size: 35,
                    ),
                    const SizedBox(
                      width: 13,
                    )
                  ],
                );
              },
              itemCount: names.length,
            ),
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
                        text: "Your personal calls are",
                        style: TextStyle(fontSize: 13, color: Colors.black)),
                    TextSpan(
                        text: " end-to-end encrypted",
                        style: TextStyle(fontSize: 13, color: Colors.green))
                  ])),
                  const SizedBox(
                    height: 50,
                  )
                ],
              ),
            )
          ],
        ));
  }
}
