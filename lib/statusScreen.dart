import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class statusScreen extends StatefulWidget {
  var recent;
  statusScreen({required this.recent});
  app createState() => app();
}

class app extends State<statusScreen> {
  late AnimationController animationController;
  late Animation animation;
  var width;
  var count;
  var pop = [
    "Mute",
    "Message",
    "Voice call",
    "Video call",
    "View contact",
    "Report"
  ];
  var list = [];
  var visibl = true;
  var visible;
  var seen;
  @override
  void initState() {
    list = List.filled(widget.recent["total"], 1);
    visible = List.filled(widget.recent["total"], false);
    count = widget.recent["seen"];
    seen = widget.recent["seen"];
    for (int i = 0; i < seen; i++) {
      visible[i] = true;
    }
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            GestureDetector(
              child: Image.asset(
                "assets/nature.jpg",
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.contain,
              ),
              onTapUp: (obj) {
                if (obj.globalPosition.dx > width / 2) {
                  if (count < widget.recent["total"]) {
                    visible[count] = true;
                    count++;
                  }
                } else {
                  if (count >= 1) {
                    visible[--count] = false;
                  }
                }
                setState(() {});
              },
              onLongPress: () {
                visibl = false;
                setState(() {});
              },
              onLongPressUp: () {
                visibl = true;
                setState(() {});
              },
            ),
            SafeArea(
                child: Visibility(
              visible: visibl,
              child: Column(
                children: [
                  Row(
                    children: list.asMap().entries.map((e) {
                      return Expanded(
                          child: Container(
                        margin: const EdgeInsets.only(left: 1, right: 1),
                        child: Stack(
                          children: [
                            Container(
                              height: 2.5,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            Container(
                              height: 2.5,
                              decoration: BoxDecoration(
                                  color: visible[e.key]
                                      ? Colors.white
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(20)),
                            )
                          ],
                        ),
                      ));
                    }).toList(),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Row(
                          children: [
                            Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            CircleAvatar(
                              backgroundImage: AssetImage("assets/image.jpg"),
                              maxRadius: 35 / 2,
                            )
                          ],
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
                            widget.recent["name"],
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          ),
                          const Text(
                            "Today,5:50 pm",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      )),
                      const SizedBox(
                        width: 20,
                      ),
                      PopupMenuButton(
                          position: PopupMenuPosition.under,
                          iconColor: Colors.white,
                          itemBuilder: (context) {
                            return pop.map((e) {
                              return PopupMenuItem(
                                  child: Text(
                                e,
                                style: const TextStyle(fontSize: 17),
                              ));
                            }).toList();
                          }),
                    ],
                  )
                ],
              ),
            )),
          ],
        ));
  }
}
