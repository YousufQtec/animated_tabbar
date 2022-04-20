import 'package:animated_tabbar/background_sliver.dart';
import 'package:animated_tabbar/sliver_header_data.dart';
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
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const _FlexibleSpaceBarHeader(),
          SliverPersistentHeader(pinned: true, delegate: _HeaderSliver())
        ],
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

const _maxHeaderExtent = 100.00;

class _HeaderSliver extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final percent = shrinkOffset / _maxHeaderExtent;
    return Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            height: _maxHeaderExtent,
            color: Colors.blue,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: const [
                      Icon(Icons.arrow_back),
                      Text(
                        'Kavsoft Bakery',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                const SliverHeaderData()
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  double get maxExtent => _maxHeaderExtent;

  @override
  double get minExtent => _maxHeaderExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
