import 'package:flutter/material.dart';

class GetBoxOffset extends StatefulWidget {
  const GetBoxOffset({Key? key}) : super(key: key);

  @override
  State<GetBoxOffset> createState() => _GetBoxOffsetState();
}

class _GetBoxOffsetState extends State<GetBoxOffset> {
  GlobalKey widgetKey = GlobalKey();

  late Offset offset;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      final box = widgetKey.currentContext?.findRenderObject() as RenderBox;
      offset = box.localToGlobal(Offset.zero);

    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
