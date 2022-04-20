import 'package:animated_tabbar/models/models.dart';
import 'package:flutter/material.dart';

class SliverBodyItems extends StatelessWidget {
  const SliverBodyItems({Key? key, required this.listItem}) : super(key: key);

  final List<Product> listItem;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final product = listItem[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Row(
            children: [
              Expanded(
                  flex: 7,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          product.description,
                          maxLines: 4,
                          style: const TextStyle(
                              fontWeight: FontWeight.w300),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          product.price,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                      ],
                    ),
                  )),
              Container(
                height: 140,
                width: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage(product.image),
                        fit: BoxFit.cover)),
              ),
              if (index == listItem.length - 1) ...[
                Container(
                  height: 0.5,
                  color: Colors.white.withOpacity(0.3),
                )
              ]
            ],
          ),
        );
      }, childCount: listItem.length),
    );
  }
}
