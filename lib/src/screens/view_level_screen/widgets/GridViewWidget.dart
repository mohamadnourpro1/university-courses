import 'package:flutter/material.dart';
import 'package:university_courses/src/models/names_cours/names_cours.dart';

class MyGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
       
    final theme = Theme.of(context);
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      padding: EdgeInsets.all(10),
      
      children: Materials.Level3Season1.map(
        (material) => InkWell(
          onTap: () {
            Navigator.of(context).pushNamed('Login/Level/ViewCourseS/');
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
                  material,
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
