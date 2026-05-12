import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../core/theme.dart';

class TicTacToeBackground extends StatefulWidget {
  const TicTacToeBackground({super.key});

  @override
  State<TicTacToeBackground> createState() => _TicTacToeBackgroundState();
}

class _TicTacToeBackgroundState extends State<TicTacToeBackground> {
  List<String> board = List.filled(9, '');
  bool xTurn = true;
  String? winner;

  void handleTap(int index) {
    if (board[index].isNotEmpty || winner != null || !xTurn) return;
    setState(() {
      board[index] = 'X';
      xTurn = false;
    });
    checkWinner();
    if (winner == null && board.contains('')) {
      Timer(const Duration(milliseconds: 600), aiMove);
    }
  }

  void aiMove() {
    if (winner != null) return;

    int bestScore = -1000;
    int bestMove = -1;

    int emptyCount = board.where((cell) => cell == '').length;
    if (emptyCount >= 8) {
       List<int> optimalStarts = [0, 2, 4, 6, 8];
       optimalStarts.shuffle();
       for (int start in optimalStarts) {
         if (board[start] == '') {
           bestMove = start;
           break;
         }
       }
    }

    if (bestMove == -1) {
      for (int i = 0; i < 9; i++) {
        if (board[i] == '') {
          board[i] = 'O'; 
          int score = _minimax(board, 0, false);
          board[i] = ''; 
          
          if (score > bestScore) {
            bestScore = score;
            bestMove = i;
          }
        }
      }
    }

    if (bestMove != -1) {
      setState(() {
        board[bestMove] = 'O';
        xTurn = true;
      });
      checkWinner();
    }
  }

  int _minimax(List<String> currentBoard, int depth, bool isMaximizing) {
    String? result = _checkWinnerForBoard(currentBoard);
    
    if (result == 'O') return 10 - depth;
    if (result == 'X') return depth - 10;
    if (!currentBoard.contains('')) return 0;

    if (isMaximizing) {
      int bestScore = -1000;
      for (int i = 0; i < 9; i++) {
        if (currentBoard[i] == '') {
          currentBoard[i] = 'O';
          int score = _minimax(currentBoard, depth + 1, false);
          currentBoard[i] = '';
          bestScore = max(score, bestScore);
        }
      }
      return bestScore;
    } else {
      int bestScore = 1000;
      for (int i = 0; i < 9; i++) {
        if (currentBoard[i] == '') {
          currentBoard[i] = 'X';
          int score = _minimax(currentBoard, depth + 1, true);
          currentBoard[i] = '';
          bestScore = min(score, bestScore);
        }
      }
      return bestScore;
    }
  }

  String? _checkWinnerForBoard(List<String> b) {
    const lines = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], 
      [0, 3, 6], [1, 4, 7], [2, 5, 8], 
      [0, 4, 8], [2, 4, 6]             
    ];
    for (var l in lines) {
      if (b[l[0]] != '' && b[l[0]] == b[l[1]] && b[l[0]] == b[l[2]]) {
         return b[l[0]];
      }
    }
    return null;
  }

  void checkWinner() {
    String? w = _checkWinnerForBoard(board);
    if (w != null) {
       setState(() { winner = w; });
       Timer(const Duration(seconds: 3), reset);
       return;
    }
    if (!board.contains('')) {
      setState(() { winner = 'Draw'; });
      Timer(const Duration(seconds: 3), reset);
    }
  }

  void reset() {
    if (!mounted) return;
    setState(() {
       board = List.filled(9, '');
       winner = null;
       xTurn = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.background, 
      child: Stack(
        children: [
          Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                double size = min(constraints.maxWidth, constraints.maxHeight) * 0.9;
                return SizedBox(
                  width: size,
                  height: size,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemCount: 9,
                    itemBuilder: (context, index) {
                      return MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () => handleTap(index),
                          child: Container(
                            decoration: BoxDecoration(
                              border: _getBorder(index),
                            ),
                            child: Center(
                              child: AnimatedSwitcher(
                                duration: const Duration(milliseconds: 300),
                                transitionBuilder: (Widget child, Animation<double> animation) {
                                  return ScaleTransition(scale: animation, child: child);
                                },
                                child: board[index] == '' 
                                  ? const SizedBox.shrink()
                                  : Text(
                                      board[index],
                                      key: ValueKey(board[index]),
                                      style: TextStyle(
                                        fontSize: size * 0.15,
                                        fontFamily: 'VT323',
                                        color: board[index] == 'X' 
                                            ? AppTheme.primaryNeon 
                                            : AppTheme.secondaryNeon,
                                        fontWeight: FontWeight.bold,
                                        shadows: [
                                          Shadow(
                                            color: board[index] == 'X' ? AppTheme.primaryNeon.withOpacity(0.5) : AppTheme.secondaryNeon.withOpacity(0.5),
                                            offset: const Offset(4, 4),
                                          )
                                        ],
                                      ),
                                    ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            ),
          ),

          if (winner != null)
            Positioned.fill(
              child: Container(
                color: AppTheme.background.withOpacity(0.95), // Deeper blocky dim
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppTheme.surface,
                      border: Border.all(color: AppTheme.primaryNeon, width: 4),
                      boxShadow: const [BoxShadow(color: AppTheme.primaryNeon, offset: Offset(8, 8))],
                    ),
                    padding: const EdgeInsets.all(40),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          winner == 'Draw' ? "SERVER TIED" : (winner == 'X' ? "SYSTEM DEFEATED" : "SYSTEM WINS"),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            color: winner == 'X' ? AppTheme.secondaryNeon : AppTheme.primaryNeon,
                            fontWeight: FontWeight.bold,
                          ),
                        ).animate().scale(duration: 400.ms, curve: Curves.bounceOut).fadeIn(),
                        const SizedBox(height: 24),
                        Text(
                          "REBOOTING GRID...",
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: AppTheme.ternaryNeon,
                          ),
                        ).animate(onPlay: (c) => c.repeat(reverse: true)).fade(duration: 300.ms),
                      ],
                    ),
                  ),
                ),
              ),
            ).animate().fadeIn(duration: 200.ms),
        ],
      ),
    );
  }

  Border _getBorder(int index) {
    Color borderColor = AppTheme.border; 
    BorderSide bs = BorderSide(color: borderColor, width: 4);
    return Border(
      top: index > 2 ? bs : BorderSide.none,
      left: index % 3 != 0 ? bs : BorderSide.none,
    );
  }
}
