import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class chatScreen extends StatefulWidget {
  var name;
  chatScreen({this.name});
  app createState() => app();
}

class app extends State<chatScreen> {
  ScrollController scrollController = ScrollController();
  var list = [
    "View contact",
    "Media,links,and docs",
    "Search",
    "Mute notification",
    "Disappearing messages",
    "Wallpaper"
  ];
  var messages = [];
  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/wallpaper.jpg",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              Container(
                  color: Colors.white,
                  padding: const EdgeInsets.only(top: 5,bottom: 5),
                  child: SafeArea(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.arrow_back,
                                ),
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage("assets/image.jpg"),
                                  radius: 35 / 2,
                                )
                              ],
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          widget.name,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.video_call),
                          const SizedBox(
                            width: 15,
                          ),
                          const Icon(Icons.call),
                          PopupMenuButton(itemBuilder: (context) {
                            return list.map((e) {
                              return PopupMenuItem(
                                  child: Text(
                                e,
                                style: const TextStyle(fontSize: 17),
                              ));
                            }).toList();
                          })
                        ],
                      )
                    ],
                  ))),
              Expanded(
                  child: ListView.builder(
                controller: scrollController,
                itemBuilder: (context, index) {
                  return Align(
                    alignment: index % 2 == 0
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 3,
                        bottom: 3,
                        left: index % 2 == 0 ? 40 : 10,
                        right: index % 2 == 0 ? 10 : 40,
                      ),
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                          color: index % 2 == 0
                              ? Colors.green.shade300
                              : Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        messages[index],
                        style:
                            const TextStyle(color: Colors.black, fontSize: 17),
                      ),
                    ),
                  );
                },
                itemCount: messages.length,
              )),
              const SizedBox(
                height: 60,
              )
            ],
          ),
          Positioned(
              bottom: 0,
              left: 4,
              right: 60,
              child: Container(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18)),
                      child: TextFormField(
                        controller: controller,
                        maxLines: 4,
                        minLines: 1,
                        keyboardType: TextInputType.multiline,
                        autofocus: true,
                        decoration: const InputDecoration(
                            prefix: SizedBox(
                              width: 10,
                            ),
                            suffix: SizedBox(
                              width: 10,
                            ),
                            border: InputBorder.none,
                            hintText: "Message",
                            contentPadding: EdgeInsets.symmetric(vertical: 5)),
                      ),
                    )),
                  ],
                ),
              )),
          Positioned(
              bottom: 5,
              right: 4,
              child: InkWell(
                child: Container(
                  margin: const EdgeInsets.only(left: 2),
                  padding: const EdgeInsets.all(13),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(360)),
                  child: const Icon(Icons.send_rounded),
                ),
                onTap: () {
                  if (controller.text.trim().length > 0) {
                    messages.add(controller.text.toString().trim());
                    scrollController
                        .jumpTo(scrollController.position.maxScrollExtent);
                    print(scrollController.position.maxScrollExtent);
                    controller.text = "";
                    setState(() {});
                  }
                },
              ))
        ],
      ),
    );
  }
}//last
