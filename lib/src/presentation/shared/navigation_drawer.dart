import 'package:flutter/material.dart';

import '../../shared/styles.dart';
import 'social_media_bar.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Drawer(
          child: ListView(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Builder(
                  builder: (context) {
                    return IconButton(
                      onPressed: () => Scaffold.of(context).closeDrawer(),
                      icon: const Icon(Icons.close),
                    );
                  },
                ),
              ),
              NavigationDrawerItem(
                title: 'ABOUT',
                onTap: () {},
              ),
              NavigationDrawerItem(
                title: 'PROJECTS',
                onTap: () {},
              ),
              NavigationDrawerItem(
                title: 'CONTACT',
                onTap: () {},
              ),
            ],
          ),
        ),
        const SocialMediaBar(),
      ],
    );
  }
}

class NavigationDrawerItem extends StatelessWidget {
  const NavigationDrawerItem({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyles.title1,
      ),
      onTap: onTap,
    );
  }
}
