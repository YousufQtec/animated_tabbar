import 'package:animated_tabbar/background_sliver.dart';
import 'package:flutter/material.dart';

class HomeSliverWithScrollableTabs extends StatefulWidget {
  const HomeSliverWithScrollableTabs({Key? key}) : super(key: key);

  @override
  State<HomeSliverWithScrollableTabs> createState() =>
      _HomeSliverWithScrollableTabsState();
}

class _HomeSliverWithScrollableTabsState
    extends State<HomeSliverWithScrollableTabs> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [_FlexibleSpaceBarHeader()],
      ),
    );
  }
}

class _FlexibleSpaceBarHeader extends StatelessWidget {
  const _FlexibleSpaceBarHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 250,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: const [
            BackgroundSliver(),
            Positioned(
                right: 10,
                top: 30,
                child: Icon(
                  Icons.favorite,
                  size: 30,
                )),
            Positioned(
                left: 10,
                top: 30,
                child: Icon(
                  Icons.arrow_back,
                  size: 30,
                ))
          ],
        ),
      ),
    );
  }
}
