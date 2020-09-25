import 'package:flutter/material.dart';
import 'package:ourESchool/UI/Utility/themes/app_themes.dart';
import 'package:ourESchool/UI/Utility/themes/theme_manager.dart';
import 'package:ourESchool/imports.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  static const String name = 'Settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        title: 'Settings',
        child: kBackBtn(context),
        onPressed: () {
          kbackBtn(context);
        },
        buttonHeroTag: 'ThemeSetting',
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: AppTheme.values.length,
          itemBuilder: (BuildContext context, int index) {
            // Get theme enum for the current item index
            final theme = AppTheme.values[index];
            return Card(
              // Style the item with corresponding theme color
              color: appThemeData[theme].primaryColor,
              child: ListTile(
                onTap: () {
                  // This will trigger notifyListeners and rebuild UI
                  // because of ChangeNotifierProvider in ThemeApp

                  Provider.of<ThemeManager>(context, listen: false)
                      .setTheme(theme);
                },
                title: Text(
                  enumName(theme),
                  style: appThemeData[theme].primaryTextTheme.bodyText2,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
