import 'package:flutter/material.dart';
import 'package:surah_index/v4/learn_ux.dart';
import 'package:surah_index/v4/index_exercise.dart';
import 'package:surah_index/v4/name_exercise.dart';
import 'package:surah_index/v4/period_exercise.dart';
import 'package:surah_index/v4/verse_count_exercise.dart';

class Application extends StatelessWidget {
  static const name = "Surah Quiz";

  Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: name,
      home: Homepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Homepage extends StatelessWidget {

  Homepage({super.key});

  Widget getExerciseTile(BuildContext context, String title, String about, Widget activity) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8/2,),
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
                    onPressed: () { Navigator.pop(context); },
                    child: Text("Ok"),
                  ),
                ],
              );
            },);
          },
          child: Icon(
            Icons.info,
            color: Colors.white,
          ),
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return activity;
          },));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Exercise"),
        actions: [
          IconButton(
            padding: EdgeInsets.symmetric(horizontal: 16),
            icon: Icon(Icons.menu_book),
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getExerciseTile(context, "Surah Index", "In this exercise, "
                  "you'll determine the index of a given surah.", IndexExercise()),
              getExerciseTile(context, "Surah Name", "In this exercise, "
                  "you'll determine the name of a given surah.", NameExercise()),
              getExerciseTile(context, "Surah Period", "In this exercise, "
                  "you'll determine the period of revelation [\"Makki\", or \"Madani\"] "
                  "of a given surah.", PeriodExercise()),
              getExerciseTile(context, "Verse Count", "In this exercise, "
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
            child: Text("<wakadrammeh@gmail.com>"),
          ),
        ],
      ),
    );
  }

}
