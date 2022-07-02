import 'package:flutter/material.dart';

import '../../shared/styles.dart';


class InformationTile extends StatelessWidget {
  const InformationTile({
    Key? key,
    required this.header,
    required this.title,
    this.subtitle,
  }) : super(key: key);

  final String header;
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: TextStyles.title1,
        ),
        const HSpace(size: Insets.m),
        Text(
          title,
          style: TextStyles.body1.copyWith(height: 1.5),
        ),
        if (subtitle != null)
          SelectableText(
            subtitle!,
            style: TextStyles.body1
                .copyWith(fontWeight: FontWeight.w400, height: 1.5),
          ),
      ],
    );
  }
}
