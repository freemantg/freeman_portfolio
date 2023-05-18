import 'package:flutter/material.dart';

class StyledDivider extends StatelessWidget {
  const StyledDivider({
    Key? key,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Divider(
        color: Theme.of(context).colorScheme.onTertiary,
        thickness: 2,
      ),
    );
  }
}
