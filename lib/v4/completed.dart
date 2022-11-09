import 'package:flutter/material.dart';

class CompletedActivity extends StatelessWidget {
  final String exercise;
  final int total;
  final int correct;

  CompletedActivity({super.key, required this.exercise, required this.total, required this.correct});

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
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(
              height: 8/4,
            ),
            Text(
              "Your score: ${correct}/${total}",
              style: TextStyle(
                fontSize: 16,
                // fontWeight: FontWeight.bold,
              )
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Play again"),
              ),
            )
          ],
        ),
      ),
    );
  }
}