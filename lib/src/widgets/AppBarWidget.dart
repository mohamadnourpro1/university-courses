import 'package:flutter/material.dart';
import 'package:university_courses/theme/theme.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackButton;
  const MyAppBar({Key? key, this.showBackButton = true}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: appTheme.colorScheme.primary,
      leading: showBackButton
          ? IconButton(
              icon:
                  Icon(Icons.arrow_back, color: appTheme.colorScheme.secondary),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          : null,
      actions: [
        IconButton(
          icon: Icon(Icons.menu, color: appTheme.colorScheme.secondary),
          onPressed: () => Scaffold.of(context).openEndDrawer(),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
