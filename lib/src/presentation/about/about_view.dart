import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freeman_portfolio/src/presentation/contact/contact_view.dart';
import 'package:freeman_portfolio/src/presentation/shared/animated_color_icon_button.dart';
import 'package:freeman_portfolio/src/shared/app_router.gr.dart';
import 'package:freeman_portfolio/src/shared/constants.dart';
import 'package:freeman_portfolio/src/shared/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/styles.dart';

class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final isSmallScreen = MediaQuery.of(context).size.width < 1200;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (isSmallScreen) {
          return FractionallySizedBox(
            widthFactor: 0.9,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: _buildContent(theme),
                ),
                const HSpace(size: Insets.xl),
                const DismissibleContainer()
              ],
            ),
          );
        } else {
          return Align(
            alignment: Alignment.centerRight,
            child: FractionallySizedBox(
              widthFactor: 0.8,
              child: Row(
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 490),
                    child: _buildContent(theme),
                  ),
                  const Spacer(),
                  const Expanded(flex: 2, child: DismissibleContainer()),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  Widget _buildContent(ColorScheme theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                  text: 'Hello! ...',
                  style: TextStyles.h1.copyWith(color: theme.secondary)),
              TextSpan(
                  text: '\n\n\nAbout me',
                  style: TextStyles.h3.copyWith(color: theme.primary)),
              TextSpan(
                text:
                    "\n\nI'm Freeman and I've been working with Flutter & Dart for 3 years.\n\nAfter a successful stint in People Operations within a start-up environment in London, I decided to take an adventurous leap into the world of software dev. Today my focus is entirely on the development of applications that tell stories and stand out for their originality.\n\n I have a joints Bachelor's Degree in Economics and Japanese (SOAS University, London | Hitotsubashi University, Tokyo).",
                style: TextStyles.body1,
              ),
            ],
          ),
        ),
        const HSpace(size: Insets.l),
        const ContactButton()
      ],
    );
  }
}

class DismissibleContainer extends HookWidget {
  const DismissibleContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    var isVisible = useState(true);

    return isVisible.value
        ? Container(
            padding: const EdgeInsets.all(Insets.l),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Insets.m),
              color: theme.secondary,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: <TextSpan>[
                            TextSpan(
                              text:
                                  'When I\'m not writing code, I spend my time running an alchemy themed vegan soy candle studio in London.',
                              style: TextStyles.body1,
                            ),
                            TextSpan(
                                text: '\n\n- Apollo Ipsum🕯️',
                                style: TextStyles.body1
                                    .copyWith(fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                      const HSpace(size: Insets.m),
                      Row(
                        children: [
                          AnimatedUrlIconButton(
                            iconData: FontAwesomeIcons.link,
                            url: ContactDetails.apolloShopify,
                          ),
                          AnimatedUrlIconButton(
                            iconData: FontAwesomeIcons.instagram,
                            url: ContactDetails.apolloInstagram,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const VSpace(size: Insets.m),
                IconButton(
                  onPressed: () => isVisible.value = false,
                  icon: const Icon(
                    FontAwesomeIcons.xmark,
                    size: 18.0,
                  ),
                )
              ],
            ),
          )
        : const SizedBox.shrink();
  }
}

class ContactButton extends ConsumerWidget {
  const ContactButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: colorScheme.onPrimary,
        backgroundColor: colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
      ),
      onPressed: () => ref.read(appRouterProvider).push(
            PortfolioLayoutRoute(
              centerView: const ContactView(),
            ),
          ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Insets.m,
          horizontal: Insets.sm,
        ),
        child: Text(
          "Let's talk!",
          style: TextStyles.body1.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
