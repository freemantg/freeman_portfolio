import 'package:flutter/material.dart';
import 'package:freeman_portfolio/src/presentation/shared/view_project_button.dart';
import 'package:freeman_portfolio/src/shared/extensions.dart';

import '../../domain/project.dart';
import '../../shared/styles.dart';

class ProjectView extends StatelessWidget {
  final ProjectType projectType;

  const ProjectView(this.projectType, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProjectDetails(projectType),
        const HSpace(size: Insets.l),
        FutureBuilder(
          future: projectType.assetLength(),
          builder: (context, snapshot) => ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: snapshot.hasData ? snapshot.data as int : 0,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => showDialog(
                  context: context,
                  builder: (context) {
                    return SingleChildScrollView(
                      child: Hero(
                        tag: '${projectType.name}_$index',
                        child: InteractiveViewer(
                          child: Image(
                            image: AssetImage(
                              'assets/projects/${projectType.name}/${projectType.name}_$index.png',
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                child: Hero(
                  tag: '${projectType.name}_$index',
                  child: Image(
                    image: AssetImage(
                      'assets/projects/${projectType.name}/${projectType.name}_$index.png',
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

class ProjectDetails extends StatelessWidget {
  final ProjectType projectType;

  const ProjectDetails(
    this.projectType, {
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
                Text(projectType.title, style: TextStyles.h1),
                const HSpace(size: Insets.l),
                Text(
                  projectType.description,
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
                Text(
                  'Description',
                  style: TextStyles.body1.copyWith(fontWeight: FontWeight.w600),
                ),
                const HSpace(size: Insets.m),
                Text(
                  projectType.architectureDescription,
                  style: TextStyles.body1.copyWith(fontWeight: FontWeight.w600),
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
