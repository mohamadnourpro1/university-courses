import 'package:flutter/material.dart';

class MyGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, String> courseDataSelected =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final theme = Theme.of(context);
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      padding: EdgeInsets.all(10),
      children: courseDataSelected.entries.map(
        (levelName) => InkWell(
          onTap: () {
            print("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++" + levelName.value +"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
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
