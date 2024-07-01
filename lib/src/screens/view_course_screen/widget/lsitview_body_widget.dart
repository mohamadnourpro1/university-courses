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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: theme.colorScheme.secondary,
                      radius: 25,
                      child: Text(
                        "${index + 1}",
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "${index + 1} المحاضرة رقم",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    InkWell(
                      child: Icon(
                        Icons.download,
                        color: theme.colorScheme.secondary,
                        size: 25,
                      ),
                      onTap: () {
                        print("download files ${index + 1}");
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
