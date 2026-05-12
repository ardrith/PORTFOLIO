import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../core/data.dart';
import '../core/theme.dart';
import 'animated_hover_card.dart';
import 'pixel_text.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedHoverCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(width: 20, height: 20, color: AppTheme.primaryNeon),
              const SizedBox(width: 8),
              Container(width: 20, height: 20, color: AppTheme.ternaryNeon),
              const SizedBox(width: 8),
              Container(width: 20, height: 20, color: AppTheme.secondaryNeon),
              const SizedBox(width: 16),
              Text('PLAYER 1 READY',
                  style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
          const SizedBox(height: 24),
          const PixelText('A R D R I T H - S - P R A M O D', fontSize: 64)
              .animate()
              .fadeIn(duration: 500.ms, delay: 200.ms)
              .slideX(begin: -0.1, end: 0),
          const SizedBox(height: 8),
          Text(
            'CLASS: ${PersonalInfo.role.toUpperCase()}',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: AppTheme.textSecondary),
          ).animate().fadeIn(duration: 500.ms, delay: 600.ms),
          const SizedBox(height: 24),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              _buildContactItem(Icons.email, PersonalInfo.email),
              _buildContactItem(Icons.phone, PersonalInfo.phone),
              _buildContactItem(Icons.map, PersonalInfo.location),
              _buildContactItem(Icons.link, PersonalInfo.linkedin),
            ]
                .animate(interval: 100.ms, delay: 800.ms)
                .fadeIn()
                .slideY(begin: 0.2, end: 0),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            color: AppTheme.secondaryNeon,
            child: Text(
              'HP: 100/100',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppTheme.background, fontWeight: FontWeight.bold),
            ),
          )
              .animate(onPlay: (controller) => controller.repeat(reverse: true))
              .fade(duration: 800.ms),
        ],
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.border, width: 2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 20, color: AppTheme.textSecondary),
          const SizedBox(width: 12),
          Text(text,
              style: const TextStyle(
                  color: AppTheme.textSecondary,
                  fontFamily: 'VT323',
                  fontSize: 18)),
        ],
      ),
    );
  }
}
