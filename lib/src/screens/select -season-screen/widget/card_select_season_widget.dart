import 'package:flutter/material.dart';

class CardSelectSeasonWidget extends StatelessWidget {
  const CardSelectSeasonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenHeight = MediaQuery.of(context).size.height - 165;

    final dynamic selectedLevelShow = ModalRoute.of(context)!.settings.arguments;

    Map<String, String> season1 = {};
    Map<String, String> season2 = {};

    if (selectedLevelShow is Map<String, Map<String, String>>) {
      season1 = selectedLevelShow['Season1'] ?? {};
      season2 = selectedLevelShow['Season2'] ?? {};
    }

    return Scaffold(
     
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                color: theme.colorScheme.primary,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      'Login/Level/ViewLevel/',
                      arguments: season1,
                    );
                  },
                  child: Container(
                    height: screenHeight * 0.5,
                    alignment: Alignment.center,
                    child: Text(
                      "الفصل الأول",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                color: theme.colorScheme.primary,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      'Login/Level/ViewLevel/',
                      arguments: season2,
                    );
                  },
                  child: Container(
                    height: screenHeight * 0.5,
                    alignment: Alignment.center,
                    child: Text(
                      "الفصل الثاني",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
