import 'package:flutter/material.dart';
import 'package:surah_index/v4/result_activity.dart';
import 'dart:math';
import 'package:surah_index/v4/surah.dart';

/// Exercise: Determine the number of verses of a given surah by: "name",
class VerseCountExercise extends StatefulWidget {
  static const name = "Verse Count";

  VerseCountExercise({super.key});

  @override
  State<VerseCountExercise> createState() {
    return _VerseCountExerciseState();
  }
}

class _VerseCountExerciseState extends State<VerseCountExercise> {
  int _counter = 1;
  int _correct = 0;
  late List<Surah> _surahs;
  late List<int> _options;
  late int _surah;
  final List<int> _taken = [];

  _VerseCountExerciseState() {
    _surahs = Surah.values;
    _surah = _getSurah();
    _options = _getOptions();
  }
  
  int _getSurah() {
    assert(_taken.length <= _surahs.length);

    var i = Random().nextInt(_surahs.length) + 1;
    if (_taken.contains(i)) {
      return _getSurah();
    } else {
      _taken.add(i);
      return i;
    }
  }

  List<int> _getOptions() {
    // final List<int> options;
    // if (_surah == 1 || _surah >= _surahs.length - 2) {
    //   options = [7, 4, 5, 6];
    // } else if (_surah == 2) {
    //   options = [286, 200, 176, 120];
    // } else {
    //   options = [_surahs[_surah - 2].verses, _surahs[_surah - 1].verses,
    //     _surahs[_surah].verses, _surahs[_surah + 1].verses];
    // }
    
    final verses = _surahs[_surah - 1].verses;

    var option2 = Random().nextInt(284) + 3;
    while (option2 == verses) {
      option2 = Random().nextInt(284) + 3;
    }

    var option3 = Random().nextInt(284) + 3;
    while (option3 == verses || option3 == option2) {
      option2 = Random().nextInt(284) + 3;
    }

    var option4 = Random().nextInt(284) + 3;
    while (option4 == verses || option4 == option2 || option4 == option3) {
      option4 = Random().nextInt(284) + 3;
    }

    final options = [verses, option2, option3, option4];
    options.shuffle();

    return options;
  }

  void _resetFields() {
    _counter = 1;
    _correct = 0;
    _taken.clear();
    _surah = _getSurah();
    _options = _getOptions();
  }

  void _eval(int verses) {
    final bool correct = verses == _surahs[_surah - 1].verses;
    final String answer;
    if (correct) {
      answer = "True";
      _correct++;
    } else {
      answer = "False";
    }

    ScaffoldMessenger.of(context).clearSnackBars();

    if (_counter == _surahs.length) {
      // Get a copy of the result somehow... because Navigator.push is a Future
      final activity = ResultActivity(exercise: VerseCountExercise.name, total: _taken.length, correct: _correct);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return activity;
        }),
      );

      setState(() {
        _resetFields();
      });
    } else {
      final snackBar = SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: correct ? Theme.of(context).primaryColor : Colors.red,
        content: Row(
          children: [
            Container(
              padding: EdgeInsets.only(right: 8),
              child: Icon(
                correct ? Icons.check : Icons.cancel_outlined,
                color: Colors.white,
              ),
            ),
            Text(
              answer,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        action: SnackBarAction(
          textColor: Theme.of(context).colorScheme.surface,
          label: 'Close',
          onPressed: () {},
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      setState(() {
        _counter++;
        _surah = _getSurah();
        _options = _getOptions();
      });
    }
  }

  Widget _optionTile(int verses) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4, ),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(50)
      ),
      child: ListTile(
        title: Center(child: Text(verses.toString(),),),
        textColor: Colors.white,
        onTap: () {
          _eval(verses);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(VerseCountExercise.name),
      ),
      body: WillPopScope(
        onWillPop: () {
          // Started?
          if (_counter > 1) {
            showDialog<String>(
              context: context,
              builder: (context) {
                return AlertDialog(
                  // title: const Text('Cancel Exercise'),
                  content: const Text('Are you sure you want to cancel the exercise?'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('No'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _resetFields();
                        ScaffoldMessenger.of(context).clearSnackBars();
                        Navigator.pop(context);
                      },
                      child: const Text('Yes'),
                    ),
                  ],
                );
              },
            );
          }
          return Future.value(true);
        },
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 32),
                  child: Text(
                    "$_counter. How many verses has Surah ${_surahs[_surah - 1].name}?",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                Column(
                  children: [
                    _optionTile(_options[0]),
                    _optionTile(_options[1]),
                    _optionTile(_options[2]),
                    _optionTile(_options[3]),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}