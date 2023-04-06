import 'dart:math';

import 'package:flutter/material.dart';
import 'package:formcreditcard/const.dart';

class FlipCardWidget extends StatefulWidget {
  final Image front;
  final Image back;

  FlipCardWidget({super.key, required this.front, required this.back});

  @override
  State<FlipCardWidget> createState() => _FlipCardWidgetState();
}

class _FlipCardWidgetState extends State<FlipCardWidget> {
  bool isFront = true;
  double dragPosition = 0;

  void flip() {
    setState(() {
      for (var i = 0; i < 180; i++) {
        dragPosition -= i;
      }
      dragPosition %= 360;

      setImageSide();
    });
  }

  void setImageSide() {
    if (dragPosition <= 90 || dragPosition >= 270) {
      isFront = false;
    } else {
      isFront = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final angle = dragPosition / 180 * pi;
    final transform = Matrix4.identity()
      ..setEntry(3, 2, 0.001)
      ..rotateY(angle);
    return GestureDetector(
        onHorizontalDragUpdate: (details) {
          setState(() {
            dragPosition -= details.delta.dx;
            dragPosition %= 360;

            setImageSide();
          });
        },
        child: Stack(
          children: [
            Transform(
              transform: transform,
              alignment: Alignment.center,
              child: isFront ? widget.front : widget.back,
            ),
            // Positioned(
            //   top: 88,
            //   left: 48,
            //   child: Text(
            //     '4716 8039 0268 5638',
            //     style: cardNumber,
            //   ),
            // ),
            // Positioned(
            //   child: Image(image: AssetImage('image/iconsCard/visa.png')),
            // ),
          ],
        ));
  }
}





// GestureDetector(
//       onHorizontalDragUpdate: (details) {
//         setState(() {
//           dragPosition -= details.delta.dx;
//           dragPosition %= 360;
//           print(dragPosition);
//           setImageSide();
//         });
//       },
//       child: Transform(
//         transform: transform,
//         alignment: Alignment.center,
//         child: isFront ? widget.front : widget.back,
//       ),
//     );
//   }
// }