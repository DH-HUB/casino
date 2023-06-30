import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(CasinoApp());

class CasinoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MaterialColor customSwatch = MaterialColor(0xFF000000, {
      50: Color(0xFF000000),
      100: Color(0xFF000000),
      200: Color(0xFF000000),
      300: Color(0xFF000000),
      400: Color(0xFF000000),
      500: Color(0xFF000000),
      600: Color(0xFF000000),
      700: Color(0xFF000000),
      800: Color(0xFF000000),
      900: Color(0xFF000000),
    });

    return MaterialApp(
      title: 'Casino',
      theme: ThemeData(
        primarySwatch: customSwatch,
      ),
      home: CasinoGame(),
    );
  }
}

class CasinoGame extends StatefulWidget {
  @override
  _CasinoGameState createState() => _CasinoGameState();
}

class _CasinoGameState extends State<CasinoGame> {
  List<String> icons = [
    'images/cherry.png',
    'images/seven.png',
    'images/seven.png',
    'images/horseshoe.png',
    'images/seven.png',
    'images/diamond.png',
    'images/horseshoe.png',
  ];

  String message = '';
  late String icon1 = '';
  late String icon2 = '';
  late String icon3 = '';

  String getRandomIcon() {
    Random random = Random();
    return icons[random.nextInt(icons.length)];
  }

  void playGame() {
    setState(() {
      icon1 = getRandomIcon();
      icon2 = getRandomIcon();
      icon3 = getRandomIcon();

      if (icon1 == icon2 && icon2 == icon3) {
        if (icon1 == 'images/seven.png') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => JackpotAnimationPage()),
          );
        } else {
          message = 'Jackpot !';
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => JackpotPage(icon1, icon2, icon3)),
          );
        }
      } else {
        message = 'You lost, try again!';

        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => LosePage(icon1, icon2, icon3)),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Casino'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Casino Game',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Visibility(
              visible: false,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(icon1, width: 100, height: 100),
                  Image.asset(icon2, width: 100, height: 100),
                  Image.asset(icon3, width: 100, height: 100),
                ],
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: playGame,
              child: Text('Play'),
            ),
            SizedBox(height: 16),
            Text(
              message,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

class JackpotAnimationPage extends StatefulWidget {
  @override
  _JackpotAnimationPageState createState() => _JackpotAnimationPageState();
}

class _JackpotAnimationPageState extends State<JackpotAnimationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jackpot'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.yellow[700],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ScaleTransition(
                scale: _animation,
                child: Text(
                  'BIG WIN',
                  style: TextStyle(
                    fontSize: 70,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Image.asset('images/money-bag.png', width: 200),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('images/seven.png', width: 100, height: 100),
                  Image.asset('images/seven.png', width: 100, height: 100),
                  Image.asset('images/seven.png', width: 100, height: 100),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class JackpotPage extends StatelessWidget {
  final String icon1;
  final String icon2;
  final String icon3;

  JackpotPage(this.icon1, this.icon2, this.icon3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jackpot'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.yellow[700],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('images/jackpot-texte.png', width: 200),
              Text(
                'Jackpot !',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(icon1, width: 100, height: 100),
                  Image.asset(icon2, width: 100, height: 100),
                  Image.asset(icon3, width: 100, height: 100),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LosePage extends StatelessWidget {
  final String icon1;
  final String icon2;
  final String icon3;

  LosePage(this.icon1, this.icon2, this.icon3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('You lost'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You lost, try again!',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(icon1, width: 100, height: 100),
                  Image.asset(icon2, width: 100, height: 100),
                  Image.asset(icon3, width: 100, height: 100),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
