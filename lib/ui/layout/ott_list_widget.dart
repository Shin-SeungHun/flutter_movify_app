import 'package:flutter/material.dart';
import 'package:flutter_movify/data/model/ott_item.dart';

class OttListWidget extends StatelessWidget {
  const OttListWidget({
    Key? key,
    required this.ottItem,
  }) : super(key: key);

  final OttItem ottItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.network(
            'https://image.tmdb.org/t/p/w500${ottItem.logoPath}',
            fit: BoxFit.cover,
            width: 70,
            height: 70,
          ),
        ),
      ],
    );
  }
}
