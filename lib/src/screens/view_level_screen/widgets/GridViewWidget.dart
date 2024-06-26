import 'package:flutter/material.dart';

class MyGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      padding: EdgeInsets.all(10),
      children: List.generate(7, (index) {
        int displayIndex = index + 1;
        return InkWell(
          onTap: () {
            // Navigator.of(context).push(
            //     MaterialPageRoute(builder: (context) => SelectSeasonScreen()));
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
                  ' العنصر $displayIndex ',
                  style: theme.textTheme.bodyLarge,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
