import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Ticket extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget child;
  final Color? color;
  final BorderRadius? borderRadius;

  const Ticket({
    this.width,
    this.height,
    required this.child,
    this.color = Colors.white,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TicketClipper(),
      child: Container(
        width: width ?? Get.width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius ?? BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              child,
            ],
          ),
        ),
      ),
    );
  }
}

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    path.addOval(
      Rect.fromCircle(
        center: Offset(0.0, size.height * 0.5),
        radius: 20.0,
      ),
    );
    path.addOval(
      Rect.fromCircle(
        center: Offset(size.width, size.height * 0.5),
        radius: 20.0,
      ),
    );

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
