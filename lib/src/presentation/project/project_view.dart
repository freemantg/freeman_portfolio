import 'package:flutter/material.dart';
import 'package:freeman_portfolio/src/presentation/shared/view_project_button.dart';
import 'package:freeman_portfolio/src/shared/extensions.dart';

import '../../domain/project.dart';
import '../../shared/styles.dart';

class ProjectView extends StatelessWidget {
  final Project project;

  const ProjectView(this.project, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProjectDetails(project),
        const HSpace(size: Insets.l),
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
                              'projects/${project.folderName}/${project.folderName}_$index.png',
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
                Text('Flutter', style: TextStyles.body1),
                const HSpace(size: Insets.m),
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
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 12.0),
                            child: FractionallySizedBox(
                              widthFactor: 0.5,
                              child: Divider(thickness: 0.5),
                            ),
                          ),
                          Text(
                            'Tech Stack',
                            style: TextStyles.body1
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          const HSpace(size: Insets.m),
                          Text(
                            project.architectureDescription,
                            style: TextStyles.body1
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    const VSpace(size: Insets.sm),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 12.0),
                            child: FractionallySizedBox(
                              widthFactor: 0.5,
                              child: Divider(thickness: 0.5),
                            ),
                          ),
                          Text(
                            'Tech Stack',
                            style: TextStyles.body1
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          const HSpace(size: Insets.m),
                          Text(
                            project.architectureDescription,
                            style: TextStyles.body1
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const HSpace(size: Insets.xl),
                ViewProjectButton(title: 'View on Github', onPressed: () {}),
                const HSpace(size: Insets.xl),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
