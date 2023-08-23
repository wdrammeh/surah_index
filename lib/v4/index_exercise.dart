import 'package:flutter/material.dart';
import 'package:surah_index/v4/result_activity.dart';
import 'dart:math';
import 'package:surah_index/v4/surah.dart';

/// Exercise: Determine the index of a given surah by: "name",
class IndexExercise extends StatefulWidget {
  static const name = "Surah Index Quiz";

  const IndexExercise({super.key});

  @override
  State<IndexExercise> createState() {
    return _IndexExerciseState();
  }
}

class _IndexExerciseState extends State<IndexExercise> {
  int _counter = 1;
  int _correct = 0;
  late List<Surah> _surahs;
  late List<int> _options;
  late int _surah;
  final List<int> _taken = [];

  _IndexExerciseState() {
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
    var option2 = Random().nextInt(_surahs.length) + 1;
    while (option2 == _surah) {
      option2 = Random().nextInt(_surahs.length) + 1;
    }

    // final option3 = _getSurah(except: <int>[option2], add: false);
    var option3 = Random().nextInt(_surahs.length) + 1;
    while (option3 == _surah || option3 == option2) {
      option3 = Random().nextInt(_surahs.length) + 1;
    }

    // final option4 = _getSurah(except: <int>[option2, option3], add: false);
    var option4 = Random().nextInt(_surahs.length) + 1;
    while (option4 == _surah || option4 == option2 || option4 == option3) {
      option4 = Random().nextInt(_surahs.length) + 1;
    }

    final options = [_surah, option2, option3, option4];
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

  void _eval(int surah) {
    final bool correct = surah == _surah;
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
      final activity = ResultActivity(
          exercise: IndexExercise.name,
          total: _taken.length,
          correct: _correct);

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
          label: 'Ok',
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

  Widget _optionTile(val) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 4,
      ),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(50)),
      child: ListTile(
        title: Center(
          child: Text(
            val.toString(),
          ),
        ),
        textColor: Colors.white,
        onTap: () {
          _eval(val);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(IndexExercise.name),
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
                    content: const Text(
                        'Are you sure you want to cancel the exercise?'),
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
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 32),
                    child: Text(
                      "$_counter. What's the index of Surah ${_surahs[_surah - 1].name}?",
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
          )),
    );
  }
}
