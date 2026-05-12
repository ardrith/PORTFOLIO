import 'package:flutter/material.dart';
import '../core/data.dart';
import '../core/theme.dart';
import 'animated_hover_card.dart';
import 'pixel_text.dart';

class SummarySection extends StatelessWidget {
  const SummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PixelText('LORE:', fontSize: 40),
        const SizedBox(height: 16),
        AnimatedHoverCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                PersonalInfo.summary,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  height: 1.4,
                  color: AppTheme.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
