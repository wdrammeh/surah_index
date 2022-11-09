import 'package:flutter/material.dart';
import 'package:surah_index/v4/learn.dart';
import 'package:surah_index/v4/surah_index.dart';
import 'package:surah_index/v4/surah_name.dart';

// index exercise -> name to number, number to name
// verse exercise -> 'how many verses has surah yaseen?'
// period exercise -> 'whats the period of surah baqarah?'

void main() {
  runApp(Application());
}


class Application extends StatelessWidget {
  static const name = "Surah Index Exercise";
  
  Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: name,
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}


class Homepage extends StatelessWidget {
  Homepage({super.key});

  Widget getExerciseTile(BuildContext context, String title, String about, Widget activity) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8/2, horizontal: 16),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(50),
      ),
      child: ListTile(
        textColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              // style: TextStyle(fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {
                showDialog(context: context, builder: (context) {
                  return AlertDialog(
                    title: Text(title),
                    content: Text(about),
                    actions: [
                      TextButton(onPressed: () {
                        Navigator.pop(context);
                      }, child: Text("Ok"))
                    ],
                  );
                },);
              },
              child: Icon(Icons.info_outlined, color: Colors.white,),
            ),
          ],
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getExerciseTile(context, "Surah Index", "In this exercise, "
                "you'll determine the index of a given surah.", SurahIndex()),
            getExerciseTile(context, "Surah Name", "In this exercise, "
                "you'll determine the name of a given surah.", SurahName()),
            getExerciseTile(context, "Surah Period", "In this exercise, "
                "you'll determine the period of revelation [\"Makki\", or \"Madani\"] of a given surah.", SurahIndex()),
            getExerciseTile(context, "Verse Count", "In this exercise, "
                "you'll determine the number of verses of a given surah.", SurahIndex()),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                child: Text("Muhammed W Drammeh"),
              ),
            ],
          )),
    );
  }
}

