import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'animated_item.dart';

class CourseCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Demo();
  }
}

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> with TickerProviderStateMixin {
  final scrollController = ScrollController();
  final int listItemCount = 20;
  final Duration listShowItemDuration = const Duration(milliseconds: 250);
  final options = const LiveOptions(
    delay: Duration(seconds: 1),
    showItemInterval: Duration(milliseconds: 500),
    showItemDuration: Duration(seconds: 1),
    visibleFraction: 0.05,
    reAnimateOnVisibility: true,
  );
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: <Widget>[
          LiveSliverList(
            controller: scrollController,
            showItemDuration: listShowItemDuration,
            itemCount: listItemCount,
            itemBuilder: buildAnimatedItem,
          ),
        ],
      ),
    );
  }
}

Widget buildAnimatedItem(
  BuildContext context,
  int index,
  Animation<double> animation,
) =>
    FadeTransition(
      opacity: Tween<double>(
        begin: 0,
        end: 1,
      ).animate(animation),
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, -0.1),
          end: Offset.zero,
        ).animate(animation),
        child: const AnimatedItem(
          'data',
          animation: null,
          hasBanner: false,
        ),
      ),
    );
