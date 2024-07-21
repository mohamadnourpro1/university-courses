import 'package:flutter/material.dart';
class CardSelectSeasonWidget extends StatelessWidget {
  const CardSelectSeasonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenHeight = MediaQuery.of(context).size.height-165;

    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              color: theme.colorScheme.primary,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('Login/Level/ViewLevel/');
                },
                child: Container(
                  height: screenHeight * 0.5, 
                  alignment: Alignment.center,
                  child: Text(
                    " الفصل الاول",
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
                  Navigator.of(context).pushNamed('Login/Level/ViewLevel/');
                },
                child: Container(
                  height: screenHeight * 0.5, 
                  alignment: Alignment.center,
                  child: Text(
                    " الفصل الثاني",
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
    );
  }
}
