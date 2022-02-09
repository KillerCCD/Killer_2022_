import 'package:flutter/material.dart';

class TextButtonForAll extends StatelessWidget {
  final Function() onPressed;
  final ButtonStyle style;
  final Text text;
  final double width;
  final EdgeInsetsGeometry padding;
  const TextButtonForAll(
      {Key key,
      this.text,
      this.style,
      this.onPressed,
      this.padding,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: padding,
      child: TextButton(
        style: style,
        onPressed: onPressed,
        child: text,
      ),
    );
  }
}
