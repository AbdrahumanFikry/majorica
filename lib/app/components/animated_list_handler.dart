import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimatedListHandler extends StatelessWidget {
  final List<Widget> children;
  final bool shrinkWrap;
  final bool noScroll;
  final bool disableGlow;
  final Axis scrollDirection;

  const AnimatedListHandler({
    required this.children,
    this.noScroll = false,
    this.shrinkWrap = false,
    this.disableGlow = false,
    this.scrollDirection = Axis.vertical,
  });

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overScroll) {
        if (disableGlow) overScroll.disallowGlow();
        return true;
      },
      child: AnimationLimiter(
        child: ListView.builder(
          shrinkWrap: shrinkWrap,
          scrollDirection: scrollDirection,
          physics: noScroll ? const NeverScrollableScrollPhysics() : null,
          itemCount: children.length,
          itemBuilder: (BuildContext context, int position) {
            return AnimationConfiguration.staggeredList(
              position: position,
              duration: const Duration(milliseconds: 500),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: children[position],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
