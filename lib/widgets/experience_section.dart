import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../core/data.dart';
import '../core/theme.dart';
import 'animated_hover_card.dart';
import 'pixel_text.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PixelText('QUEST LOG (EXP):', fontSize: 40),
        const SizedBox(height: 16),
        ...ExperienceData.history.asMap().entries.map((entry) {
          int index = entry.key;
          Experience exp = entry.value;
          return Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: _buildExperienceItem(context, exp),
          ).animate(delay: (index * 200).ms).fadeIn().slideX(begin: 0.1, end: 0);
        }),
      ],
    );
  }

  Widget _buildExperienceItem(BuildContext context, Experience exp) {
    return AnimatedHoverCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '[ ${exp.role.toUpperCase()} ]',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppTheme.primaryNeon, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${exp.company.toUpperCase()} // ${exp.location.toUpperCase()}',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppTheme.textPrimary),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  border: Border.all(color: AppTheme.secondaryNeon, width: 2),
                  color: AppTheme.background,
                ),
                child: Text(
                  exp.duration.toUpperCase(),
                  style: const TextStyle(color: AppTheme.secondaryNeon, fontSize: 16),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(color: AppTheme.border, thickness: 2),
          const SizedBox(height: 16),
          ...exp.responsibilities.map((res) => Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('>> ', style: TextStyle(color: AppTheme.ternaryNeon, fontSize: 20)),
                Expanded(
                  child: Text(
                    res,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.2),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
