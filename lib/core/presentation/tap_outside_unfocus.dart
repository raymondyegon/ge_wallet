import 'package:flutter/material.dart';

class TapOutsideUnfocus extends StatelessWidget {
  final Widget child;

  const TapOutsideUnfocus({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: child,
      );
}
