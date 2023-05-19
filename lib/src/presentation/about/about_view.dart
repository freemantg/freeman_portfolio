import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freeman_portfolio/src/presentation/contact/contact_view.dart';
import 'package:freeman_portfolio/src/presentation/shared/animated_color_icon_button.dart';
import 'package:freeman_portfolio/src/shared/app_router.gr.dart';
import 'package:freeman_portfolio/src/shared/extensions.dart';
import 'package:freeman_portfolio/src/shared/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/styles.dart';

const String apolloShopify = 'https://apolloipsum.co.uk/';
const String apolloInstagram = 'https://www.instagram.com/apolloipsum/?hl=en';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return LayoutBuilder(
      builder: (context, constraints) => Flex(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: !constraints.isDesktop
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        direction: !constraints.isDesktop ? Axis.vertical : Axis.horizontal,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 490,
              maxHeight: MediaQuery.of(context).size.height / 2,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello! ...',
                  style: TextStyles.h1.copyWith(color: theme.secondary),
                ),
                const HSpace(size: Insets.xl),
                Text(
                  'About me',
                  style: TextStyles.h3.copyWith(color: theme.primary),
                ),
                const HSpace(size: Insets.l),
                Text(
                  "I'm Freeman and I've been working with Flutter & Dart for 2 years.\n\nI have a joints Bachelor's Degree in Economics and Japanese (SOAS University, London | Hitotsubashi University, Tokyo).\n\nToday my focus is entirely on the development of applications that tell stories and stand out for their originality.",
                  style: TextStyles.body1,
                ),
                const HSpace(size: Insets.l),
                const ContactButton()
              ],
            ),
          ),
          // const Spacer(),
          const VSpace(size: Insets.l),
          !constraints.isDesktop
              ? const HSpace(size: Insets.l)
              : const Spacer(),
          const DismissibleContainer(),
          const VSpace(size: Insets.xl),
        ],
      ),
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
              mainAxisSize: MainAxisSize.min,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 290.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'When I\'m not writing code, I spend my time running an alchemy themed vegan soy candle studio in London.',
                        style: TextStyles.body1,
                      ),
                      const HSpace(size: Insets.m),
                      Text(
                        '- Apollo Ipsum🕯️',
                        style: TextStyles.body1
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      const HSpace(size: Insets.m),
                      const Row(
                        children: [
                          AnimatedUrlIconButton(
                            iconData: FontAwesomeIcons.link,
                            url: apolloShopify,
                          ),
                          AnimatedUrlIconButton(
                            iconData: FontAwesomeIcons.instagram,
                            url: apolloInstagram,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const VSpace(size: Insets.l),
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
            PortfolioLayoutPageRoute(
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
