import 'package:flutter/material.dart';

class CenteredView extends StatelessWidget {
  const CenteredView({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 60, left: 70, right: 70, bottom: 28),
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1260),
        child: child,
      ),
    );
  }
}
