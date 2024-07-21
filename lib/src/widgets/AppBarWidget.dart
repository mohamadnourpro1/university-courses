import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackButton;

  const MyAppBar({Key? key, this.showBackButton = true}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      backgroundColor: theme.appBarTheme.backgroundColor,
      leading: showBackButton
          ? IconButton(
              icon: Icon(Icons.arrow_back, color: theme.colorScheme.secondary),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          : null,
      actions: [
        IconButton(
          icon: Icon(Icons.menu, color: theme.colorScheme.secondary),
          onPressed: () => Scaffold.of(context).openEndDrawer(),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
