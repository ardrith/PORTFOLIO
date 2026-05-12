import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../core/data.dart';
import '../core/theme.dart';
import 'animated_hover_card.dart';
import 'pixel_text.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PixelText('SAVE FILES (PROJECTS):', fontSize: 40),
        const SizedBox(height: 16),
        LayoutBuilder(
          builder: (context, constraints) {
            int crossAxisCount = constraints.maxWidth > 1200 ? 3 : (constraints.maxWidth > 900 ? 2 : 1);
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
                childAspectRatio: constraints.maxWidth > 1200 ? 0.9 : (constraints.maxWidth > 900 ? 1.1 : 0.8),
              ),
              itemCount: ProjectsData.list.length,
              itemBuilder: (context, index) {
                final project = ProjectsData.list[index];
                return AnimatedHoverCard(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.videogame_asset, color: AppTheme.ternaryNeon, size: 32),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              project.title.toUpperCase(),
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      if (project.description.isNotEmpty) ...[
                        const SizedBox(height: 8),
                        Text(
                          '// ${project.description.toUpperCase()}',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppTheme.textSecondary,
                          ),
                        ),
                      ],
                      const SizedBox(height: 16),
                      Expanded(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: project.points.length,
                          itemBuilder: (context, pIndex) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('+ ', style: TextStyle(color: AppTheme.primaryNeon, fontSize: 20)),
                                  Expanded(
                                    child: Text(
                                      project.points[pIndex],
                                      style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ).animate(delay: (index * 150).ms).fadeIn().slideY(begin: 0.1, end: 0);
              },
            );
          },
        ),
      ],
    );
  }
}
