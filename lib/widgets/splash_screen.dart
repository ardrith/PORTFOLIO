import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../core/theme.dart';
import '../main.dart'; // Provides PortfolioHomePage
import 'pixel_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // After cinematic duration, replace route
    Timer(const Duration(milliseconds: 3800), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 800),
          pageBuilder: (context, animation, secondaryAnimation) =>
              const PortfolioHomePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Retro Hardware Built Entirely With Flutter Containers
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.end,
              spacing: 32,
              runSpacing: 32,
              children: [
                _buildComputer().animate().slideX(
                    begin: -1,
                    end: 0,
                    duration: 800.ms,
                    curve: Curves.easeOutBack),
                _buildMobile().animate().slideX(
                    begin: 1,
                    end: 0,
                    duration: 800.ms,
                    curve: Curves.easeOutBack),
              ],
            ),
            const SizedBox(height: 80),
            // Console Loading Logic
            const PixelText('BOOTING PORTFOLIO...', fontSize: 32)
                .animate(onPlay: (c) => c.repeat())
                .shimmer(duration: 1.seconds, color: AppTheme.secondaryNeon)
                .animate(delay: 2200.ms)
                .swap(
                  builder: (_, __) =>
                      const PixelText('SYSTEM READY.', fontSize: 32)
                          .animate()
                          .tint(duration: 500.ms, color: AppTheme.primaryNeon),
                ),
          ],
        ),
      ),
    );
  }

  Widget _buildComputer() {
    return Column(
      children: [
        // Monitor Body
        Container(
          width: 240,
          height: 180,
          decoration: BoxDecoration(
            color: AppTheme.background,
            border: Border.all(color: AppTheme.border, width: 10),
            boxShadow: const [
              BoxShadow(color: AppTheme.primaryNeon, offset: Offset(8, 8))
            ],
          ),
          padding: const EdgeInsets.all(8),
          child: Container(
            color: const Color(0xFF001100), // Dark green dead screen
            child: const Center(
              child: Icon(Icons.code, color: AppTheme.primaryNeon, size: 80),
            )
                .animate(delay: 1000.ms)
                .shimmer(duration: 500.ms, color: Colors.white)
                .fadeIn(), // Boot up flicker effect
          ),
        ),
        // Stand neck
        Container(width: 40, height: 30, color: AppTheme.border),
        // Stand base
        Container(width: 140, height: 16, color: AppTheme.border),
      ],
    );
  }

  Widget _buildMobile() {
    return Container(
      width: 100,
      height: 200,
      decoration: BoxDecoration(
        color: AppTheme.background,
        border: Border.all(color: AppTheme.border, width: 8),
        boxShadow: const [
          BoxShadow(color: AppTheme.ternaryNeon, offset: Offset(6, 6))
        ],
      ),
      padding: const EdgeInsets.all(6),
      child: Column(
        children: [
          // Speaker slit
          Container(width: 30, height: 6, color: AppTheme.border),
          const SizedBox(height: 8),
          // Screen
          Expanded(
            child: Container(
              color: const Color(0xFF000011),
              child: const Center(
                child: Icon(Icons.phone_android,
                    color: AppTheme.primaryNeon, size: 40),
              )
                  .animate(delay: 1400.ms)
                  .shimmer(color: Colors.white)
                  .fadeIn(), // Screen comes alive shortly after PC
            ),
          ),
          const SizedBox(height: 8),
          // Hardware home button
          Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                  border: Border.all(color: AppTheme.border, width: 4))),
        ],
      ),
    );
  }
}
