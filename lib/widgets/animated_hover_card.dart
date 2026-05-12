import 'package:flutter/material.dart';
import '../core/theme.dart';

class AnimatedHoverCard extends StatefulWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;

  const AnimatedHoverCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(24.0),
  });

  @override
  State<AnimatedHoverCard> createState() => _AnimatedHoverCardState();
}

class _AnimatedHoverCardState extends State<AnimatedHoverCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100), // Fast retro tick
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.zero, // Pure sharp 8-bit corners
          border: Border.all(
            color: _isHovered ? AppTheme.primaryNeon : AppTheme.border,
            width: _isHovered ? 4 : 2, // Chunky retro borders
          ),
          boxShadow: _isHovered 
            ? [ BoxShadow(color: AppTheme.ternaryNeon, offset: const Offset(8, 8)) ] // Hard offset neo-brutalist shadow
            : [ BoxShadow(color: AppTheme.border, offset: const Offset(4, 4)) ],
        ),
        padding: widget.padding,
        child: widget.child,
      ),
    );
  }
}
