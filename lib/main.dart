import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DISTORTED HIVE',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        fontFamily: 'Roboto',
      ),
      home: HiveBoard(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HiveBoard extends StatefulWidget {
  @override
  _HiveBoardState createState() => _HiveBoardState();
}

class _HiveBoardState extends State<HiveBoard> {
  final List<IconData> _icons = [
    Icons.bug_report,
    Icons.emoji_nature,
    Icons.favorite,
    Icons.star,
  ];

  List<bool> _flippedStates = List.generate(25, (_) => false);
  int _points = 7;
  bool _gameOver = false;
  String _message = '';
  late List<IconData> _assignedIcons;

  @override
  void initState() {
    super.initState();
    _assignIcons();
    WidgetsBinding.instance.addPostFrameCallback((_) => _showInstructionsModal());
  }

  void _assignIcons() {
    final random = Random();
    _assignedIcons = List.generate(25, (_) => _icons[random.nextInt(_icons.length)]);
  }

  void _flipCell(int index) {
    if (_flippedStates[index]) return;

    setState(() {
      _flippedStates[index] = true;
      final icon = _assignedIcons[index];
      _updatePoints(icon);

      if (_flippedStates.every((flipped) => flipped)) {
        if (_points > 0 && !_gameOver) {
          _gameOver = true;
          _message = '🐝 Silent Victory! You survived the hive... but at what cost?';
          _showGameOverModal();
        }
      }
    });
  }

  void _updatePoints(IconData icon) {
    if (_gameOver) return;

    if (icon == Icons.bug_report) {
      _points -= 2;
    } else if (icon == Icons.emoji_nature) {
      _points -= 1;
    } else if (icon == Icons.favorite) {
      _points += 2;
    } else if (icon == Icons.star) {
      _points += 1;
    }

    if (_points <= 0) {
      _points = 0;
      _gameOver = true;
      _message = '🐝 The hive consumed you.';
      _showGameOverModal();
    } else if (_points >= 15) {
      _points = 15;
      _gameOver = true;
      _message = '👑 You ruled the hive.';
      _showGameOverModal();
    }
  }

  void _restartGame() {
    setState(() {
      _flippedStates = List.generate(25, (_) => false);
      _points = 7;
      _gameOver = false;
      _message = '';
      _assignIcons();
    });
    _showInstructionsModal();
  }

  void _showInstructionsModal() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: Colors.grey[900],
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('🧠 How to play DISTORTED HIVE?', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.amber)),
                SizedBox(height: 16),
                Text(
                  '''• You start with 7 points.
• Each cell hides a symbol that can change your score:

   🐞 Bug: -2 pts  
   🌿 Nature: -1 pt  
   ❤️ Heart: +2 pts  
   ⭐ Star: +1 pt

• Reach 15 points to win.
• Drop to 0 points and lose.
• If you survive flipping all cells... the hive hasn’t defeated you — but it hasn’t crowned you either.''',
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.amber[700]),
                    child: Text('Got it', style: TextStyle(color: Colors.black)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showGameOverModal() {
    showDialog(
      context: context,
      barrierDismissible: false, 
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.black87,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                _message.contains('ruled') ? Icons.emoji_events : Icons.error_outline,
                size: 60,
                color: _message.contains('ruled') ? Colors.amber : Colors.redAccent,
              ),
              SizedBox(height: 15),
              Text(
                _message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: _message.contains('ruled') ? Colors.amber : Colors.redAccent,
                ),
              ),
              SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _restartGame();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber[700],
                  padding: EdgeInsets.symmetric(horizontal: 28, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Text('Play Again', style: TextStyle(fontSize: 18, color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('DISTORTED HIVE', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.amber)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline, color: Colors.amber),
            tooltip: 'Instructions',
            onPressed: _showInstructionsModal,
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text(
            'Points: $_points',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 10),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: 25,
              itemBuilder: (context, index) {
                final flipped = _flippedStates[index];
                final icon = _assignedIcons[index];
                final baseColor = flipped ? Colors.grey[850] : Colors.amber[700];
                final iconColor = icon == Icons.bug_report
                    ? Colors.redAccent
                    : icon == Icons.emoji_nature
                        ? Colors.greenAccent
                        : icon == Icons.favorite
                            ? Colors.pinkAccent
                            : Colors.cyanAccent;

                return GestureDetector(
                  onTap: _gameOver || flipped ? null : () => _flipCell(index),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      color: baseColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.amber, width: 1.5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.amber.withOpacity(0.3),
                          blurRadius: 6,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Center(
                      child: flipped
                          ? Icon(icon, size: 36, color: iconColor)
                          : Icon(Icons.hexagon, size: 28, color: Colors.black),
                    ),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: _restartGame,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              backgroundColor: Colors.amber[700],
            ),
            child: Text('Restart', style: TextStyle(fontSize: 18, color: Colors.black)),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
