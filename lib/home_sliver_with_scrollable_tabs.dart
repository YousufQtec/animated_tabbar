import 'package:animated_tabbar/background_sliver.dart';
import 'package:animated_tabbar/controller/sliver_scroll_controller.dart';
import 'package:animated_tabbar/my_header_title.dart';
import 'package:animated_tabbar/sliver_header_data.dart';
import 'package:animated_tabbar/widgets/list_item_sliver_header.dart';
import 'package:animated_tabbar/widgets/sliver_body_items.dart';
import 'package:flutter/material.dart';

class HomeSliverWithScrollableTabs extends StatefulWidget {
  const HomeSliverWithScrollableTabs({Key? key}) : super(key: key);

  @override
  State<HomeSliverWithScrollableTabs> createState() =>
      _HomeSliverWithScrollableTabsState();
}

class _HomeSliverWithScrollableTabsState
    extends State<HomeSliverWithScrollableTabs> {
  final bloc = SliverScrollController();

  @override
  void initState() {
    bloc.init();
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const _FlexibleSpaceBarHeader(),
          SliverPersistentHeader(
              pinned: true, delegate: _HeaderSliver(bloc: bloc)),
          for (var i = 0; i < bloc.listCategory.length; i++) ...[
            SliverPersistentHeader(
              delegate:
                  MyHeaderTitle((visible) {}, bloc.listCategory[i].category),
            ),
            SliverBodyItems(listItem: bloc.listCategory[i].products)
          ]
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
  final SliverScrollController bloc;

  _HeaderSliver({required this.bloc});

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
            color: Colors.black,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      AnimatedOpacity(
                          opacity: percent > 0.1 ? 1 : 0,
                          duration: const Duration(milliseconds: 300),
                          child: const Icon(Icons.arrow_back)),
                      AnimatedSlide(
                        duration: const Duration(milliseconds: 300),
                        offset: Offset(percent < 0.1 ? -0.18 : 0.1, 0),
                        curve: Curves.easeIn,
                        child: const Text(
                          'Kavsoft Bakery',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    child: percent > 0.1
                        ? ListItemSliverHeader(bloc: bloc)
                        : const SliverHeaderData())
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
