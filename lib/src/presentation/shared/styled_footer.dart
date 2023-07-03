import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freeman_portfolio/src/shared/styled_divider.dart';

import '../../shared/constants.dart';
import '../../shared/styles.dart';
import 'information_tile.dart';
import 'logo.dart';

class StyledWebFooter extends StatelessWidget {
  const StyledWebFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const double maxWidthPercentage = 0.8;
    double screenWidth = MediaQuery.sizeOf(context).width;
    double maxWidth = screenWidth * maxWidthPercentage;

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: Column(
        children: [
          const HSpace(size: 120),
          Stack(
            children: [
              const LogoFooter(),
              Column(
                children: [
                  const Align(
                    alignment: Alignment.centerRight,
                    child: FractionallySizedBox(
                      widthFactor: 0.8,
                      child: Row(
                        children: [
                          InformationTile(
                            header: 'Location',
                            title: 'Based in London\nUNITED KINGDOM',
                          ),
                          Spacer(),
                          InformationTile(
                            header: 'Contact',
                            title: 'Let\'s get in touch',
                            subtitle: ContactDetails.personalEmail,
                          ),
                          Spacer(flex: 2),
                        ],
                      ),
                    ),
                  ),
                  const HSpace(size: 80),
                  const StyledDivider(),
                  const HSpace(size: Insets.l),
                  Row(
                    children: [
                      Text(
                        "This portfolio is made from Flutter.  ",
                        style: TextStyles.body1,
                      ),
                      const Icon(FontAwesomeIcons.githubAlt),
                      const Spacer(),
                      Text(
                        '© ${ContactDetails.reservedYear}, FREEMAN. All rights reserved.',
                        style: TextStyles.body1,
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
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
        const Align(alignment: Alignment.centerLeft, child: Logo()),
        const HSpace(size: Insets.xl * 2),
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
        const StyledDivider(),
        const HSpace(size: Insets.l),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '© ${ContactDetails.reservedYear}, FREEMAN. All rights reserved.',
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
