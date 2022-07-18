import 'package:flutter/material.dart';

class BmiCard extends StatefulWidget {
  const BmiCard({
    Key? key,
    this.child,
    this.color,
  }) : super(key: key);

  final Widget? child;
  final Color? color;

  @override
  State<BmiCard> createState() => _BmiCardState();
}

class _BmiCardState extends State<BmiCard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(15.0),
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: widget.color ?? Theme.of(context).colorScheme.secondary,
        ),
        child: widget.child,
      ),
    );
  }
}
