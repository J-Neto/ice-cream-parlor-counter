import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void decrement() {
    setState(() {
      count--;
    });
  }

  void increment() {
    setState(() {
      count++;
    });
  }

  bool get isEmpty => count == 0;

  bool get isFull => count == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                // Blue Stroke
                Text(
                  isFull ? 'Lotado!' : 'Pode entrar!',
                  style: TextStyle(
                    fontSize: 35,
                    letterSpacing: 5,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 6
                      ..color = Colors.pink,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                // Solid Text
                Text(
                  isFull ? 'Lotado!' : 'Pode entrar!',
                  style: const TextStyle(
                    fontSize: 35,
                    letterSpacing: 5,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            Padding(
                padding: const EdgeInsets.all(40),
                child: Text(
                  '$count',
                  style: TextStyle(
                    // fontFamily: 'Didatic Gothic',
                    fontSize: 150,
                    color: isFull ? Colors.red : Colors.blueAccent,
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: isEmpty ? null : decrement,
                  style: TextButton.styleFrom(
                    backgroundColor:
                        isEmpty ? Colors.white.withOpacity(0.4) : Colors.white,
                    fixedSize: const Size(100, 100),
                    foregroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: isEmpty
                            ? Colors.pinkAccent.withOpacity(0.4)
                            : Colors.pinkAccent,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Saiu',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 32,
                ),
                TextButton(
                  onPressed: isFull ? null : increment,
                  style: TextButton.styleFrom(
                    backgroundColor:
                        isFull ? Colors.white.withOpacity(0.4) : Colors.white,
                    fixedSize: const Size(100, 100),
                    foregroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: isFull
                            ? Colors.pinkAccent.withOpacity(0.4)
                            : Colors.pinkAccent,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Entrou',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
