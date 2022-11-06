import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../shared/constants.dart';
import '../../shared/styles.dart';
import 'information_tile.dart';

class StyledWebFooter extends StatelessWidget {
  const StyledWebFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HSpace(size: 120),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Flexible(
              child: InformationTile(
                header: 'Location',
                title: 'Remote,\nbased in London',
              ),
            ),
            Spacer(),
            Flexible(
              child: InformationTile(
                header: 'Contact',
                title: 'Let\'s get in touch',
                subtitle: ContactDetails.personalEmail,
              ),
            ),
            Spacer(),
          ],
        ),
        const HSpace(size: 80),
        const Divider(),
        const HSpace(size: Insets.l),
        Row(
          children: [
            Flexible(
              child: Text(
                "This portfolio is made from Flutter.  ",
                style: TextStyles.body1,
              ),
            ),
            const Icon(FontAwesomeIcons.githubAlt),
            const Spacer(),
            Text(
              '© 2022, FREEMAN. All rights reserved.',
              style: TextStyles.body1,
            )
          ],
        ),
      ],
    );
  }
}

class StyledMobileFooter extends StatelessWidget {
  const StyledMobileFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const HSpace(size: Insets.xl),
        const InformationTile(
          header: 'Location',
          title: 'Remote, based in London',
        ),
        const HSpace(size: Insets.xl),
        const InformationTile(
          header: 'Contact',
          title: 'Let\'s get in touch',
          subtitle: ContactDetails.personalEmail,
        ),
        const HSpace(size: Insets.l),
        const Divider(),
        const HSpace(size: Insets.l),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '© 2022, FREEMAN. All rights reserved.',
              style: TextStyles.body1,
            ),
            Text(
              "This portfolio is made from Flutter. ",
              style: TextStyles.body1,
            ),
            const HSpace(size: Insets.l),
            const Icon(FontAwesomeIcons.githubAlt),
          ],
        ),
        const HSpace(size: Insets.l),
      ],
    );
  }
}
