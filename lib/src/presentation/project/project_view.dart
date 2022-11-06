import 'package:flutter/material.dart';
import 'package:freeman_portfolio/src/presentation/shared/view_project_button.dart';
import 'package:freeman_portfolio/src/shared/extensions.dart';

import '../../shared/styles.dart';

class ProjectView extends StatelessWidget {
  const ProjectView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        ProjectDetails(projectType),
        const HSpace(size: Insets.l),
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
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 80.0),
          child: ProjectDetails(),
        ),
        Column(
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                decoration: const BoxDecoration(color: Colors.red),
              ),
            )
          ],
        ),
      ],
    );
  }
}

class ProjectDetails extends StatelessWidget {
  const ProjectDetails({
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Flutter', style: TextStyles.body1),
              const HSpace(size: Insets.m),
              Text('Project Name', style: TextStyles.h1),
              const HSpace(size: Insets.l),
              Text(
                'Águias Cookie é uma marca de cookies brasileira, de São Paulo. A empresa pretende investir na extroversão e na criatividade para atrair clientes das mais diversas...',
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
                'Subtitle',
                style: TextStyles.body1.copyWith(fontWeight: FontWeight.w600),
              ),
              const HSpace(size: Insets.m),
              Text(
                'Essa identidade visual foi desenvolvido em parceria com outros designers dentro de um projeto chamado Design, por favor. Criado por nós mesmos, visando ajudar pequenos empreendedores MEI, em meio a pandemia de 2020.',
                style: TextStyles.body1.copyWith(fontWeight: FontWeight.w600),
              ),
              const HSpace(size: Insets.xl),
              ViewProjectButton(title: 'View on Github', onPressed: () {})
            ],
          ),
        ],
      ),
    );
  }
}
