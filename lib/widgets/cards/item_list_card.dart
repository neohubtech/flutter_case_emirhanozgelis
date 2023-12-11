import 'package:flutter/material.dart';

class ItemListCard extends StatelessWidget {
  const ItemListCard(
      {super.key,
      required this.child,
      this.height,
      this.width,
      this.color,
      this.padding,
      this.margin});
  final Widget child;
  final double? width;
  final double? height;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      padding: padding ?? const EdgeInsets.all(10),
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFDEE3ED),
            offset: Offset(0, 10),
            blurRadius: 24,
          )
        ],
      ),
      child: child,
    );
  }
}
