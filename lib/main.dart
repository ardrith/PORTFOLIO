import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'core/theme.dart';
import 'widgets/hero_section.dart';
import 'widgets/summary_section.dart';
import 'widgets/skills_section.dart';
import 'widgets/experience_section.dart';
import 'widgets/projects_section.dart';
import 'widgets/education_section.dart';
import 'widgets/snake_bg.dart';
import 'widgets/splash_screen.dart';
import 'widgets/pixel_text.dart';

void main() {
  runApp(const MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'A R D R I T H',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const SplashScreen(),
    );
  }
}

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  bool isGameMode = false;
  final ValueNotifier<Offset?> _mouseNotifier = ValueNotifier(null);

  @override
  void dispose() {
    _mouseNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            PixelText(isGameMode ? 'SNAKE GAME' : 'PORTFOLIO', fontSize: 18),
        actions: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isGameMode = !isGameMode;
                });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color:
                      isGameMode ? AppTheme.primaryNeon : AppTheme.background,
                  border: Border.all(color: AppTheme.primaryNeon, width: 2),
                ),
                child: Center(
                  child: Text(
                    isGameMode ? 'PLAYING' : 'INSERT COIN',
                    style: TextStyle(
                      fontFamily: 'VT323',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isGameMode
                          ? AppTheme.background
                          : AppTheme.primaryNeon,
                    ),
                  ),
                ),
              ),
            ),
          ).animate().fadeIn().scale(delay: 500.ms),
          const SizedBox(width: 24),
        ],
      ),
      body: Listener(
        behavior: HitTestBehavior.translucent,
        onPointerHover: (event) {
          // Subtract AppBar height to get position relative to body
          _mouseNotifier.value = event.localPosition;
        },
        child: Stack(
          children: [
            Positioned.fill(child: SnakeGameBackground(mouseNotifier: _mouseNotifier)),
            IgnorePointer(
              ignoring: isGameMode,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: isGameMode ? 0.05 : 1.0,
                child: LayoutBuilder(builder: (context, constraints) {
                  double horizontalPadding = constraints.maxWidth > 1400
                      ? constraints.maxWidth * 0.15
                      : constraints.maxWidth > 800
                          ? constraints.maxWidth * 0.1
                          : 24.0;
                  return ListView(
                    padding: EdgeInsets.symmetric(
                        horizontal: horizontalPadding, vertical: 40.0),
                    children: [
                      const HeroSection()
                          .animate()
                          .fadeIn(duration: 600.ms)
                          .slideY(begin: 0.05, end: 0),
                      const SizedBox(height: 60),
                      const SummarySection()
                          .animate()
                          .fadeIn(delay: 200.ms)
                          .slideY(begin: 0.05, end: 0),
                      const SizedBox(height: 60),
                      const SkillsSection()
                          .animate()
                          .fadeIn(delay: 300.ms)
                          .slideY(begin: 0.05, end: 0),
                      const SizedBox(height: 60),
                      const ExperienceSection()
                          .animate()
                          .fadeIn(delay: 400.ms)
                          .slideY(begin: 0.05, end: 0),
                      const SizedBox(height: 60),
                      const ProjectsSection()
                          .animate()
                          .fadeIn(delay: 500.ms)
                          .slideY(begin: 0.05, end: 0),
                      const SizedBox(height: 60),
                      const EducationSection()
                          .animate()
                          .fadeIn(delay: 600.ms)
                          .slideY(begin: 0.05, end: 0),
                      const SizedBox(height: 100),
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
