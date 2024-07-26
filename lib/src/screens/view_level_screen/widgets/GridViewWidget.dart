import 'package:flutter/material.dart';
import 'package:university_courses/src/models/names_cours/name_courses.dart';

class MyGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
       
    final theme = Theme.of(context);
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      padding: EdgeInsets.all(10),
      
      children: nameCourses.Level1Season1.entries.map(
        (levelName) => InkWell(
          onTap: () {

            print( "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"+levelName.value+"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
            Navigator.of(context).pushNamed('Login/Level/ViewCourseS/', arguments: levelName.value);
          },
          child: Card(
            child: Container(
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text(
                  levelName.key,
                  style: theme.textTheme.bodyLarge,
                ),
              ),
            ),
          ),
        ),
      ).toList(),
    );
  }
}
