import 'package:flutter/material.dart';
import 'package:freeman_portfolio/src/presentation/shared/view_project_button.dart';

import '../../domain/project.dart';
import '../../shared/styles.dart';

class ProjectView extends StatelessWidget {
  final ProjectType projectType;

  const ProjectView(this.projectType, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 80.0),
          child: ProjectDetails(projectType),
        ),
        FutureBuilder(
          future: projectType.assetLength(),
          builder: (context, snapshot) => ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.hasData ? snapshot.data as int : 0,
            itemBuilder: (context, index) {
              return Image(
                image: AssetImage(
                  'projects/${projectType.name}/${projectType.name}_$index.png',
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
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
              ViewProjectButton(title: 'View on Github', onPressed: () {})
            ],
          ),
        ),
      ],
    );
  }
}
