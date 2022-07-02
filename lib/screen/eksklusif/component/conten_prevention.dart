import 'package:flutter/material.dart';
import '../../../theme.dart';

// ignore: must_be_immutable
class ContentPrevention extends StatelessWidget {
  ContentPrevention(
      {Key? key, required this.imageAsset, required this.description})
      : super(key: key);

  String imageAsset, description;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(imageAsset),
        const SizedBox(
          width: 20,
        ),
        Expanded(
            child: Text(
          description,
          style: secondTextStyle.copyWith(
              fontSize: 12, fontWeight: FontWeight.w500),
        ))
      ],
    );
  }
}
