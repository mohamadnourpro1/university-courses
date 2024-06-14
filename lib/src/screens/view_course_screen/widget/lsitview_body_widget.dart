import 'package:flutter/material.dart';

class LsitviewBodyWidget extends StatelessWidget {
  const LsitviewBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 14,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: theme.colorScheme.primary,
            child: InkWell(
              onTap: () {
                print("go to page to view all ${index + 1}");
              },
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: theme.colorScheme.secondary,
                  radius: 50,
                  child: Text(
                    "${index + 1}",
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                title: Text(
                  "${index + 1} المحاضرة رقم ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                subtitle: Text(
                  "عنوان المحاضرة ",
                  style: theme.textTheme.bodySmall,
                ),
                trailing: InkWell(
                  child: Icon(
                    Icons.download,
                    color: theme.colorScheme.secondary,
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
