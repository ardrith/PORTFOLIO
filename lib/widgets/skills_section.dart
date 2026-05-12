import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../core/data.dart';
import '../core/theme.dart';
import 'animated_hover_card.dart';
import 'pixel_text.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PixelText('INVENTORY (SKILLS):', fontSize: 40),
        const SizedBox(height: 16),
        LayoutBuilder(
          builder: (context, constraints) {
            int crossAxisCount = constraints.maxWidth > 1200 ? 4 : (constraints.maxWidth > 800 ? 3 : (constraints.maxWidth > 500 ? 2 : 1));
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                mainAxisExtent: 180,
              ),
              itemCount: SkillsData.categories.length,
              itemBuilder: (context, index) {
                final category = SkillsData.categories[index];
                return AnimatedHoverCard(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        category.title.toUpperCase(),
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 20, 
                          color: AppTheme.primaryNeon,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 12),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: category.skills.map((skill) => Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                border: Border.all(color: AppTheme.border, width: 2),
                                color: AppTheme.background,
                              ),
                              child: Text(skill.toUpperCase(), style: const TextStyle(fontSize: 14)),
                            )).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ).animate(delay: (index * 100).ms).fadeIn().scale(begin: const Offset(0.95, 0.95));
              },
            );
          },
        ),
      ],
    );
  }
}
