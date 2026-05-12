import 'package:flutter/material.dart';
import '../core/data.dart';
import '../core/theme.dart';
import 'animated_hover_card.dart';
import 'pixel_text.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PixelText('ACHIEVEMENTS:', fontSize: 40),
        const SizedBox(height: 16),
        AnimatedHoverCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('EDUCATION:', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppTheme.secondaryNeon)),
              const SizedBox(height: 16),
              ...EducationData.history.map((edu) => Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('► ', style: TextStyle(color: AppTheme.primaryNeon, fontSize: 18)),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(edu.degree.toUpperCase(), style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 4),
                          Text('${edu.institution} | ${edu.location}'.toUpperCase(), style: Theme.of(context).textTheme.bodyMedium),
                          const SizedBox(height: 4),
                          Text(edu.duration.toUpperCase(), style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppTheme.textSecondary)),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
              const Divider(color: AppTheme.border, thickness: 2, height: 32),
              Text('CERTIFICATIONS:', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppTheme.ternaryNeon)),
              const SizedBox(height: 16),
              ...EducationData.certifications.map((cert) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.star, color: AppTheme.ternaryNeon, size: 18),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(cert.toUpperCase(), style: Theme.of(context).textTheme.bodyMedium),
                    ),
                  ],
                ),
              )),
            ],
          ),
        ),
      ],
    );
  }
}
