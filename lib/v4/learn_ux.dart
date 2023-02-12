import 'package:flutter/material.dart';
import 'package:surah_index/v4/surah.dart';

class LearnActivity extends StatelessWidget {
  final List<Surah> surahs;
  
  LearnActivity({super.key, this.surahs = Surah.values});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Surah Index"),
      ),
      body: ListView.builder(
        itemCount: surahs.length,
        itemBuilder: (context, i) {
          final surah = surahs[i];
          return ListTile(
            title: Text(
              "${surah.position}. ${surah.name}",
            ),
            subtitle: Row(
              children: [
                Text(
                  "${surah.period}",
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8/2),
                  child: Icon(Icons.circle_rounded, size: 8,),
                ),
                Text(
                  "${surah.verses} verses",
                ),
              ],
            ),
            onTap: () {
              
            },
          );
        },
      ),
    );
  }
}
