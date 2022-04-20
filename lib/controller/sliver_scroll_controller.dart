import 'package:animated_tabbar/data/data.dart';
import 'package:animated_tabbar/models/models.dart';
import 'package:flutter/cupertino.dart';

class SliverScrollController {
  //list of products
  late List<ProductCategory> listCategory;

  // list of offset values
  List<double> listOffSetItemHeader = [];

  //header notifier
  final headerNotifier = ValueNotifier<MyHeader?>(null);

//global offset value
  final globalOffsetValue = ValueNotifier<double>(0);

//value to do the validations of the top icons
  final valueScroll = ValueNotifier<double>(0);

// To move top items in sliver
  late ScrollController scrollControllerItemHeader;

//To have overall control of scrolling
  late ScrollController scrollControllerGlobally;

  void loadDataRandom() {
    final productsTwo = [...products];
    final productsThree = [...products];
    final productsFour = [...products];

    productsTwo.shuffle();
    productsThree.shuffle();
    productsFour.shuffle();

    listCategory = [
      ProductCategory(category: 'Order Again', products: products),
      ProductCategory(category: 'Picked For You', products: productsTwo),
      ProductCategory(category: 'Starts', products: productsThree),
      ProductCategory(category: 'Gimpuh Sushi', products: productsFour),
    ];
  }

  void init() {
    loadDataRandom();
    listOffSetItemHeader =
        List.generate(listCategory.length, (index) => index.toDouble());
    scrollControllerGlobally = ScrollController();
    scrollControllerItemHeader = ScrollController();
  }

  void dispose() {
    scrollControllerItemHeader.dispose();
    scrollControllerGlobally.dispose();
  }

  void refreshHeader(int index, bool visible, {int? lastIndex}) {
    final headerValue = headerNotifier.value;
    final headerTitle = headerValue?.index ?? index;
    final headerVisible = headerValue?.visible ?? visible;

    if (headerTitle != index || lastIndex != null || headerVisible) {
      Future.microtask(() {
        if (!visible && lastIndex != null) {
          headerNotifier.value = MyHeader(index: lastIndex, visible: true);
        } else {
          headerNotifier.value = MyHeader(index: index, visible: visible);
        }
      });
    }
  }
}
