import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../core/theme.dart';

class SnakeGameBackground extends StatefulWidget {
  final ValueNotifier<Offset?> mouseNotifier;
  const SnakeGameBackground({super.key, required this.mouseNotifier});

  @override
  State<SnakeGameBackground> createState() => _SnakeGameBackgroundState();
}

class _SnakeGameBackgroundState extends State<SnakeGameBackground> {
  static const int cellSize = 20;
  List<Point<int>> snake = [];
  Point<int> direction = const Point(1, 0);
  Point<int> apple = const Point(15, 15);
  int score = 0;

  Timer? gameLoop;
  int columns = 20;
  int rows = 20;
  final Random _random = Random();
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    gameLoop = Timer.periodic(const Duration(milliseconds: 130), (timer) {
      if (!mounted) return;
      _updateGame();
    });
  }

  @override
  void dispose() {
    gameLoop?.cancel();
    super.dispose();
  }

  void _initGame() {
    int cx = columns ~/ 2;
    int cy = rows ~/ 2;
    snake = [Point(cx, cy), Point(cx - 1, cy), Point(cx - 2, cy)];
    direction = const Point(1, 0);
    score = 0;
    _spawnApple();
    _initialized = true;
  }

  void _spawnApple() {
    Point<int> candidate;
    int attempts = 0;
    do {
      candidate = Point(_random.nextInt(columns), _random.nextInt(rows));
      attempts++;
    } while (snake.contains(candidate) && attempts < 200);
    apple = candidate;
  }

  Point<int>? _getMouseGridPos() {
    final raw = widget.mouseNotifier.value;
    if (raw == null) return null;
    return Point(
      (raw.dx / cellSize).clamp(0, columns - 1).floor(),
      (raw.dy / cellSize).clamp(0, rows - 1).floor(),
    );
  }

  void _updateGame() {
    if (columns <= 2 || rows <= 2) return;
    if (!_initialized) return;

    // Direction logic: chase mouse if available, else chase apple
    Point<int>? mouseGrid = _getMouseGridPos();
    Point<int> target = mouseGrid ?? apple;

    int dx = target.x - snake.first.x;
    int dy = target.y - snake.first.y;

    // Handle wrapping distance (pick shorter path around screen edges)
    if (dx.abs() > columns ~/ 2) {
      dx = dx > 0 ? dx - columns : dx + columns;
    }
    if (dy.abs() > rows ~/ 2) {
      dy = dy > 0 ? dy - rows : dy + rows;
    }

    Point<int> newDir = direction;

    if (dx.abs() >= dy.abs() && dx != 0) {
      newDir = Point(dx > 0 ? 1 : -1, 0);
    } else if (dy != 0) {
      newDir = Point(0, dy > 0 ? 1 : -1);
    }

    // Prevent immediate suicide by reversing into "neck"
    if (snake.length > 1) {
      Point<int> neck = snake[1];
      int ex = (snake.first.x + newDir.x) % columns;
      int ey = (snake.first.y + newDir.y) % rows;
      if (ex < 0) ex += columns;
      if (ey < 0) ey += rows;
      if (Point(ex, ey) == neck) {
        newDir = direction;
      }
    }

    direction = newDir;

    // Calculate new head with wrapping
    int headX = (snake.first.x + direction.x) % columns;
    int headY = (snake.first.y + direction.y) % rows;
    if (headX < 0) headX += columns;
    if (headY < 0) headY += rows;
    Point<int> newHead = Point(headX, headY);

    snake.insert(0, newHead);

    // Check collision with apple
    if (newHead == apple) {
      score++;
      _spawnApple();
    } else {
      snake.removeLast();
    }

    // Self collision check
    for (int i = 1; i < snake.length; i++) {
      if (snake[i] == newHead) {
        _initGame();
        break;
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.background,
      child: LayoutBuilder(
        builder: (context, constraints) {
          columns = max(5, (constraints.maxWidth / cellSize).floor());
          rows = max(5, (constraints.maxHeight / cellSize).floor());

          if (!_initialized) {
            _initGame();
          }

          return CustomPaint(
            size: Size(constraints.maxWidth, constraints.maxHeight),
            painter: _SnakePainter(
              cellSize: cellSize.toDouble(),
              columns: columns,
              rows: rows,
              snake: List.from(snake),
              apple: apple,
              score: score,
            ),
          );
        },
      ),
    );
  }
}

class _SnakePainter extends CustomPainter {
  final double cellSize;
  final int columns;
  final int rows;
  final List<Point<int>> snake;
  final Point<int> apple;
  final int score;

  _SnakePainter({
    required this.cellSize,
    required this.columns,
    required this.rows,
    required this.snake,
    required this.apple,
    required this.score,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // 1. Draw subtle grid
    final gridPaint = Paint()
      ..color = AppTheme.border.withOpacity(0.12)
      ..strokeWidth = 1;

    for (int i = 0; i <= columns; i++) {
      canvas.drawLine(Offset(i * cellSize, 0), Offset(i * cellSize, size.height), gridPaint);
    }
    for (int j = 0; j <= rows; j++) {
      canvas.drawLine(Offset(0, j * cellSize), Offset(size.width, j * cellSize), gridPaint);
    }

    // 2. Draw Apple with glow
    final applePaint = Paint()..color = AppTheme.primaryNeon;
    final appleGlowPaint = Paint()
      ..color = AppTheme.primaryNeon.withOpacity(0.3)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);

    Rect appleRect = Rect.fromLTWH(apple.x * cellSize + 2, apple.y * cellSize + 2, cellSize - 4, cellSize - 4);
    canvas.drawRect(appleRect.inflate(4), appleGlowPaint);
    canvas.drawRect(appleRect, applePaint);

    // 3. Draw Snake with gradient body
    for (int i = 0; i < snake.length; i++) {
      final seg = snake[i];
      bool isHead = i == 0;
      double bodyOpacity = 1.0 - (i / (snake.length + 5)).clamp(0.0, 0.6);

      final segPaint = Paint()
        ..color = isHead ? AppTheme.textPrimary : AppTheme.secondaryNeon.withOpacity(bodyOpacity);

      Rect segRect = Rect.fromLTWH(seg.x * cellSize + 1, seg.y * cellSize + 1, cellSize - 2, cellSize - 2);

      if (isHead) {
        final headGlowPaint = Paint()
          ..color = AppTheme.secondaryNeon.withOpacity(0.4)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);
        canvas.drawRect(segRect.inflate(3), headGlowPaint);
      }

      canvas.drawRect(segRect, segPaint);
    }

    // 4. Draw Score
    final textPainter = TextPainter(
      text: TextSpan(
        text: 'SCORE: $score',
        style: const TextStyle(fontFamily: 'VT323', fontSize: 20, color: AppTheme.ternaryNeon),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(size.width - textPainter.width - 20, 16));
  }

  @override
  bool shouldRepaint(covariant _SnakePainter oldDelegate) => true;
}
