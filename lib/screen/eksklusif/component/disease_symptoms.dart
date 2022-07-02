import 'package:flutter/material.dart';
import '../../../theme.dart';

// ignore: must_be_immutable
class DiseaseSymptoms extends StatelessWidget {
  DiseaseSymptoms(
      {Key? key, required this.imageAsset, required this.description})
      : super(key: key);

  String imageAsset, description;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(imageAsset),
        const SizedBox(
          width: 8,
        ),
        Text(
          description,
          style: secondTextStyle.copyWith(
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
