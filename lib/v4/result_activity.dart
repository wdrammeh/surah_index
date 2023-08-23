import 'package:flutter/material.dart';
import 'package:surah_index/v4/v4.dart';

class ResultActivity extends StatelessWidget {
  final String exercise;
  final int total;
  final int correct;

  const ResultActivity({super.key, required this.exercise, required this.total, required this.correct});

  int getPercent() {
    return ((correct / total) * 100).toInt();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          exercise,
        ),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Quiz completed",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 8/4,
            ),
            Text(
              "Your score: ${correct}/${total}",
              style: const TextStyle(
                fontSize: 16,
                // fontWeight: FontWeight.bold,
              )
            ),
            Text(
                "${getPercent()}%",
                style: Theme.of(context).textTheme.headlineMedium,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 64,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      // Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const Homepage()),
                          (route) => false
                      );
                    },
                    child: const Text("Home"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Play again"),
                  ),
                ],
              )
            )
          ],
        ),
      ),
    );
  }

}
