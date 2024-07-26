import 'package:flutter/material.dart';

class CardLevelWidget extends StatelessWidget {
  final String levelText;
  final Map<String, Map<String, String>> selectedLevelShow;

  const CardLevelWidget({
    Key? key,
    required this.levelText,
    required this.selectedLevelShow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height - 180;
    final theme = Theme.of(context);

    return Card(
      color: theme.colorScheme.primary,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            'Login/Level/SelectSeason/',
            arguments: selectedLevelShow,
          );
        },
        child: Container(
          height: screenHeight * 0.250,
          alignment: Alignment.center,
          child: Text(
            levelText,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
