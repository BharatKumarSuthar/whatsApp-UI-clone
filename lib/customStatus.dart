import 'package:flutter/material.dart';

class customScreen extends StatefulWidget {
  var total, seen;
  customScreen({this.total, this.seen});
  app createState() => app();
}

class app extends State<customScreen> {
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(
              painter: custom(total: widget.total, seen: widget.seen),
              size: const Size(70, 70),
            ),
            const CircleAvatar(
              backgroundImage: AssetImage("assets/user (1).png"),
              radius: (70 / 2) - 4,
            )
          ],
        ));
  }
}

class custom extends CustomPainter {
  var total, seen;
  custom({this.total, this.seen});
  @override
  void paint(Canvas canvas, Size size) {
    var rect = Rect.fromCircle(
        center: Offset(size.width / 2, size.width / 2), radius: size.width / 2);
    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2.5;
    if (total > 1) {
      var start = -90.0;
      var sweep = (360 / total);
      for (int i = 1; i <= total; i++) {
        canvas.drawArc(
            rect,
            (3.14 / 180) * (start + 10),
            -(3.14 / 180) * (sweep - 10),
            false,
            paint..color = i <= seen ? Colors.grey : Colors.green);
        start = sweep + start;
      }
    } else {
      var start = 0.0;
      var sweep = (360 / total);
      canvas.drawArc(rect, (3.14 / 180) * start, (3.14 / 180) * sweep, false,
          paint..color = total == seen ? Colors.grey : Colors.green);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
