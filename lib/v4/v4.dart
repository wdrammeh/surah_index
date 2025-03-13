import 'package:flutter/material.dart';
import 'package:surah_index/v4/learn_ux.dart';
import 'package:surah_index/v4/index_exercise.dart';
import 'package:surah_index/v4/name_exercise.dart';
import 'package:surah_index/v4/period_exercise.dart';
import 'package:surah_index/v4/verse_count_exercise.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  static const name = "Surah Quiz";

  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: name,
      home: Homepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Homepage extends StatelessWidget {

  const Homepage({super.key});

  Widget newExerciseTile(BuildContext context, String title, String about, Widget activity) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8/2),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(50),
      ),
      child: ListTile(
        textColor: Colors.white,
        title: Text(
          title,
          // style: TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: GestureDetector(
          onTap: () {
            showDialog(context: context, builder: (context) {
              return AlertDialog(
                title: Text(title),
                content: Text(about),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Ok"),
                  ),
                ],
              );
            });
          },
          child: const Icon(
            Icons.info_outline,
            color: Colors.white,
          ),
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return activity;
          }));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Exercise"),
        actions: [
          IconButton(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            icon: const Icon(Icons.library_books),
            tooltip: 'Learn',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return LearnActivity();
                }),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              newExerciseTile(context, "Surah Index", "In this exercise, "
                  "you'll determine the index of a given surah.", IndexExercise()),
              newExerciseTile(context, "Surah Name", "In this exercise, "
                  "you'll determine the name of a given surah.", NameExercise()),
              newExerciseTile(context, "Surah Period", "In this exercise, "
                  "you'll determine the period of revelation [\"Makki\", or \"Madani\"] "
                  "of a given surah.", PeriodExercise()),
              newExerciseTile(context, "Verse Count", "In this exercise, "
                  "you'll determine the number of verses of a given surah.", VerseCountExercise()),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           TextButton(
            onPressed: () {},
            child: const Text("Muhammed W. Drammeh"),
          ),
        ],
      ),
    );
  }

}
