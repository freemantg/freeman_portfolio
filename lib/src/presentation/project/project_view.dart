import 'package:flutter/material.dart';
import 'package:freeman_portfolio/src/presentation/shared/view_project_button.dart';
import 'package:freeman_portfolio/src/shared/extensions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/project.dart';
import '../../shared/providers.dart';
import '../../shared/styles.dart';

class ProjectView extends StatelessWidget {
  final Project project;

  const ProjectView(this.project, {super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobile;

    return Align(
      alignment: Alignment.centerRight,
      child: FractionallySizedBox(
        widthFactor: isMobile ? 1 : 0.80,
        child: Column(
          children: [
            ProjectDetails(project),
            HSpace(size: isMobile ? 80.0 : 40),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: project.assetLength,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return SingleChildScrollView(
                          child: Hero(
                            tag: '${project.title}_$index',
                            child: InteractiveViewer(
                              child: Image(
                                image: AssetImage(
                                  'assets/projects/${project.folderName}/${project.folderName}_$index.png',
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Hero(
                    tag: '${project.title}_$index',
                    child: Image(
                      image: AssetImage(
                        'projects/${project.folderName}/${project.folderName}_$index.png',
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class ProjectDetails extends StatelessWidget {
  final Project project;

  const ProjectDetails(
    this.project, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Flex(
        direction: constraints.isMobile ? Axis.vertical : Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: constraints.isMobile ? 0 : 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "assets/projects/${project.folderName}/${project.folderName}_1.png"),
                Text(project.title, style: TextStyles.h1),
                const HSpace(size: Insets.l),
                Text(
                  project.description,
                  style: TextStyles.body1,
                  softWrap: true,
                ),
              ],
            ),
          ),
          const SizedBox(width: 190),
          Expanded(
            flex: constraints.isMobile ? 0 : 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 12.0),
                      child: FractionallySizedBox(
                        widthFactor: 0.20,
                        child: Divider(thickness: 0.5),
                      ),
                    ),
                    Text(
                      'Tech Stack',
                      style: TextStyles.body1
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    const HSpace(size: Insets.m),
                    Text(project.technicalDescription, style: TextStyles.body1),
                  ],
                ),
                const VSpace(size: Insets.sm),
                const HSpace(size: Insets.xl),
                Consumer(builder: ((context, ref, child) {
                  return ViewProjectButton(
                    title: 'View on Github',
                    onPressed: () async => await ref
                        .read(urlLauncherServiceProvider)
                        .launchUrl(project.gitHubUrl),
                  );
                })),
                const HSpace(size: Insets.xl),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
