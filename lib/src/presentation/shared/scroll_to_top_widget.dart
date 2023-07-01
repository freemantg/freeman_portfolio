import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../shared/styles.dart';

class ScrollToTopWidget extends HookWidget {
  final ScrollController scrollController;
  const ScrollToTopWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    final progress = useState<double>(0.0);
    final isHovered = useState<bool>(false);

    useEffect(() {
      void _updateScrollProgress() {
        if (scrollController.hasClients &&
            scrollController.position.maxScrollExtent > 0) {
          var maxScrollExtent = scrollController.position.maxScrollExtent;
          var currentScroll = scrollController.position.pixels;
          progress.value = (currentScroll / maxScrollExtent).clamp(0.0, 1.0);
        } else {
          progress.value = 0;
        }
      }

      scrollController.addListener(_updateScrollProgress);

      return () => scrollController.removeListener(_updateScrollProgress);
    }, [scrollController]);

    void _scrollToTop() {
      scrollController.animateTo(0,
          duration: const Duration(seconds: 1), curve: Curves.easeInOut);
    }

    Color determineColor() => isHovered.value
        ? Theme.of(context).colorScheme.secondary
        : Theme.of(context).colorScheme.primary;

    return AnimatedOpacity(
      opacity: scrollController.position.pixels > 0 ? 1 : 0,
      duration: kThemeAnimationDuration,
      child: MouseRegion(
        onEnter: (_) => isHovered.value = true,
        onExit: (_) => isHovered.value = false,
        child: RotatedBox(
          quarterTurns: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Transform.rotate(
                angle: pi, // Rotate by 180 degrees
                child: SizedBox(
                  height: 1.5,
                  width: 65,
                  child: LinearProgressIndicator(
                    value: progress.value,
                    color: determineColor(),
                  ),
                ),
              ),
              TextButton(
                onPressed: _scrollToTop,
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.hovered)) {
                      return Colors.transparent;
                    }
                    return null; // Defer to the default behavior.
                  }),
                ),
                child: Text('scroll to top',
                    style: TextStyles.title2.copyWith(color: determineColor())),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
