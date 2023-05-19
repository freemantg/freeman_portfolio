import 'package:flutter/material.dart';

class StyledCircleProgressIndicator extends StatelessWidget {
  const StyledCircleProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height / 2,
      width: size.width,
      child: Center(
        child: CircularProgressIndicator(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}
