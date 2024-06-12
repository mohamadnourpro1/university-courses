import 'package:flutter/material.dart';
import 'package:university_courses/theme/theme.dart';

class LsitviewBodyWidget extends StatelessWidget {
  const LsitviewBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 14,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: appTheme.colorScheme.primary,
            child: InkWell(
              onTap: () {
                print("go to page to view all ${index + 1}");
              },
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: appTheme.colorScheme.secondary,
                  radius: 50,
                  child: Text(
                    "${index + 1}",
                    style: appTheme.textTheme.bodyMedium,
                  ),
                ),
                title: Text(
                  "${index + 1} المحاضرة رقم ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                subtitle: Text(
                  "عنوان المحاضرة ",
                  style: appTheme.textTheme.bodySmall,
                ),
                trailing: InkWell(
                  child: Icon(
                    Icons.download,
                    color: appTheme.colorScheme.secondary,
                  ),
                  onTap: () {
                    print(" download files ${index + 1}");
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
