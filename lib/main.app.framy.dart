// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// FramyGenerator
// **************************************************************************

// ignore_for_file: unused_import
// ignore_for_file: directives_ordering
// ignore_for_file: type_annotate_public_apis
// ignore_for_file: prefer_const_constructors
// ignore_for_file: invalid_assignment
// ignore_for_file: argument_type_not_assignable
// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: avoid_return_types_on_setters
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: sort_child_properties_last
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_generic_function_type_aliases
// ignore_for_file: prefer_conditional_assignment
// ignore_for_file: avoid_unused_constructor_parameters
// ignore_for_file: prefer_typing_uninitialized_variables
// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:provider/provider.dart' as provider;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ourESchool/UI/Utility/themes/newLightTheme.dart';
import 'package:framy_annotation/framy_annotation.dart';
import 'dart:core';
import 'package:ourESchool/UI/pages/Dashboard/payments/subscription/payment_page_one.dart';
import 'package:ourESchool/core/services/payments/subscription_View_Model.dart';
import 'package:ourESchool/UI/resources/customWidgets.dart';
import 'package:ourESchool/UI/Widgets/contra_text.dart';
import 'package:ourESchool/UI/pages/Dashboard/payments/subscription/payment_card_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:ourESchool/UI/Widgets/button_round_with_shadow.dart';
import 'package:ourESchool/UI/resources/colors.dart';
import 'package:ourESchool/UI/Widgets/customAppBar.dart';
import 'package:stacked/stacked.dart';
import 'package:ourESchool/UI/pages/Dashboard/payments/subscription/subscription_Form.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ourESchool/UI/pages/feed/feed_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ourESchool/core/enums/UserType.dart';
import 'package:ourESchool/imports.dart';
import 'package:ourESchool/UI/Utility/constants.dart';
import 'package:ourESchool/UI/pages/feed/announcement_owner.dart';
import 'package:ourESchool/UI/pages/feed/feed_viewModel.dart';
import 'package:ourESchool/UI/pages/feed/feed_Viewer.dart';
import 'package:ourESchool/UI/pages/feed/feed_page.dart';
import 'package:ourESchool/UI/Utility/Resources.dart';
import 'package:ourESchool/UI/pages/feed/tweetImage.dart';
import 'package:animations/animations.dart';
import 'package:ourESchool/UI/Widgets/PostIconsRow.dart';
import 'package:ourESchool/locator.dart';
import 'package:ourESchool/UI/Widgets/creation_aware_list_item.dart';
import 'package:ourESchool/UI/Widgets/TopBar.dart';
import 'package:ourESchool/UI/Widgets/customLoader.dart';
import 'package:flutter/gestures.dart';
import 'package:ourESchool/UI/Widgets/dialog_snack_bottomsheets/setup_bottom_sheet_ui.dart';
import 'package:ourESchool/core/enums/bottom_sheet_type.dart';
import 'package:ourESchool/UI/resources/utility.dart';
import 'package:ourESchool/core/Models/Announcement.dart';
import 'package:ourESchool/core/enums/announcementType.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ourESchool/core/Models/Assignment.dart';
import 'package:ourESchool/core/Models/data_entry/data_entry.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:ourESchool/core/Models/data_entry/data_entry_db.dart';
import 'package:ourESchool/core/Models/E-Book.dart';
import 'package:flutter/widgets.dart';
import 'package:ourESchool/core/Models/ExamTopic.dart';
import 'package:ourESchool/core/Models/feed/feed.dart';
import 'package:ourESchool/core/Models/fees/fees_model.dart';
import 'package:ourESchool/core/enums/fees.dart';
import 'package:ourESchool/core/Models/holiday_data.dart';
import 'dart:convert';
import 'package:ourESchool/core/Models/holiday_item.dart';
import 'package:ourESchool/core/Models/library/library_model.dart';
import 'package:ourESchool/core/Models/Message.dart';
import 'package:ourESchool/core/Models/payments/subResponse_model.dart';
import 'package:ourESchool/core/Models/payments/subscriptions_model.dart';
import 'package:ourESchool/core/Models/Question.dart';
import 'package:ourESchool/core/enums/questionType.dart';
import 'package:ourESchool/core/enums/questionLevel.dart';
import 'package:ourESchool/core/Models/school_wall/wall_model.dart';
import 'package:ourESchool/core/Models/studentData/studentData.dart';
import 'package:ourESchool/core/Models/student_data_entry/student_data_entry.dart';
import 'package:ourESchool/core/Models/student_data_entry/student_data_entry_db.dart';
import 'package:ourESchool/core/Models/User.dart';
import 'package:ourESchool/core/Models/UserDataLogin.dart';
import 'package:ourESchool/core/Models/contributions/contribution_model.dart';

void main() {
  runApp(FramyApp());
}

final framyAppStateKey = GlobalKey<_FramyAppState>();

class FramyApp extends StatefulWidget {
  FramyApp() : super(key: framyAppStateKey);

  @override
  _FramyAppState createState() => _FramyAppState();
}

class _FramyAppState extends State<FramyApp> {
  bool _wrapWithScaffold = true;
  bool _wrapWithCenter = false;
  bool _wrapWithSafeArea = false;
  bool _showNavigationMenu = true;
  bool _wrapWithDevicePreview = true;

  set wrapWithScaffold(bool value) => setState(() => _wrapWithScaffold = value);

  set wrapWithCenter(bool value) => setState(() => _wrapWithCenter = value);

  set wrapWithSafeArea(bool value) => setState(() => _wrapWithSafeArea = value);

  void toggleNavigationMenu() =>
      setState(() => _showNavigationMenu = !_showNavigationMenu);

  set wrapWithDevicePreview(bool value) =>
      setState(() => _wrapWithDevicePreview = value);

  @override
  Widget build(BuildContext context) {
    return FramyAppSettings(
      wrapWithScaffold: _wrapWithScaffold,
      wrapWithCenter: _wrapWithCenter,
      wrapWithSafeArea: _wrapWithSafeArea,
      showNavigationMenu: _showNavigationMenu,
      wrapWithDevicePreview: _wrapWithDevicePreview,
      child: MaterialApp(
        key: Key('FramyApp'),
        debugShowCheckedModeBanner: false,
        theme: newLightTheme,
        onGenerateRoute: onGenerateRoute,
      ),
    );
  }
}

class FramyAppSettings extends InheritedWidget {
  final bool wrapWithScaffold;
  final bool wrapWithCenter;
  final bool wrapWithSafeArea;
  final bool showNavigationMenu;
  final bool wrapWithDevicePreview;

  const FramyAppSettings({
    Key key,
    @required Widget child,
    @required this.wrapWithScaffold,
    @required this.wrapWithCenter,
    @required this.wrapWithSafeArea,
    @required this.showNavigationMenu,
    @required this.wrapWithDevicePreview,
  })  : assert(child != null),
        super(key: key, child: child);

  static FramyAppSettings of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<FramyAppSettings>();
  }

  @override
  bool updateShouldNotify(FramyAppSettings old) =>
      old.wrapWithScaffold != wrapWithScaffold ||
      old.wrapWithCenter != wrapWithCenter ||
      old.wrapWithSafeArea != wrapWithSafeArea ||
      old.showNavigationMenu != showNavigationMenu ||
      old.wrapWithDevicePreview != wrapWithDevicePreview;
}

Route onGenerateRoute(RouteSettings settings) {
  final routes = {
    '/typography': FramyFontsPage(),
    '/colors': FramyColorsPage(),
    '/appbar': FramyAppBarPage(),
    '/button': FramyButtonPage(),
    '/toggle': FramyTogglePage(),
    '/textfield': FramyTextFieldPage(),
    '/PaymentPage': FramyPaymentPageCustomPage(),
    '/SubscriptionDetails': FramySubscriptionDetailsCustomPage(),
    '/FeedCardWidget': FramyFeedCardWidgetCustomPage(),
    '/FeedPage': FramyFeedPageCustomPage(),
    '/ContraText': FramyContraTextCustomPage(),
    '/FloatingBoxBottomSheet': FramyFloatingBoxBottomSheetCustomPage(),
    '/TopBar': FramyTopBarCustomPage(),
    '/TopBarAlternative': FramyTopBarAlternativeCustomPage(),
    '/storyboard': FramyStoryboardPage(),
  };
  final page = routes[settings.name] ?? FramyFontsPage();
  return PageRouteBuilder<dynamic>(
    pageBuilder: (_, __, ___) => FramyLayoutTemplate(child: page),
    settings: settings,
  );
}

class FramyLayoutTemplate extends StatelessWidget {
  final Widget child;

  const FramyLayoutTemplate({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmallDevice = constraints.maxWidth < 1000;
        final leading = isSmallDevice
            ? null
            : IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () =>
                    framyAppStateKey.currentState.toggleNavigationMenu(),
                tooltip: FramyAppSettings.of(context).showNavigationMenu
                    ? 'Close navigation menu'
                    : 'Open navigation menu',
              );
        return Scaffold(
          appBar: FramyAppBar(leading: leading),
          body: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!isSmallDevice &&
                  FramyAppSettings.of(context).showNavigationMenu)
                FramyDrawer(),
              Expanded(
                child: child,
              ),
            ],
          ),
          drawer: isSmallDevice ? FramyDrawer(showHeader: true) : null,
        );
      },
    );
  }
}

class FramyAppBar extends StatelessWidget with PreferredSizeWidget {
  final Widget leading;

  const FramyAppBar({Key key, @required this.leading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      key: Key('FramyAppBar'),
      title: Text('Framy App'),
      leading: leading,
      actions: [
        IconButton(
          key: ValueKey('FramyAppBarSettingsButton'),
          icon: Icon(Icons.settings),
          onPressed: () => showDialog(
            context: context,
            useRootNavigator: false,
            builder: (context) => FramySettingsDialog(),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class FramySettingsDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Preview settings'),
      actions: [
        FlatButton(
          child: Text('Close'),
          onPressed: () => Navigator.of(context).pop(),
        )
      ],
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Device Preview disabled'),
                      SelectableText(
                        'framy.dev/#/device_preview',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                ),
                Switch(
                  key: ValueKey('FramyAppDevicePreviewSwitch'),
                  onChanged: null,
                  value: false,
                ),
              ],
            ),
            Row(
              children: [
                Expanded(child: Text('Wrap with Scaffold')),
                Switch(
                  key: ValueKey('FramyAppScaffoldSwitch'),
                  onChanged: (b) =>
                      framyAppStateKey.currentState.wrapWithScaffold = b,
                  value: FramyAppSettings.of(context).wrapWithScaffold,
                ),
              ],
            ),
            Row(
              children: [
                Expanded(child: Text('Wrap with Center')),
                Switch(
                  key: ValueKey('FramyAppCenterSwitch'),
                  onChanged: (b) =>
                      framyAppStateKey.currentState.wrapWithCenter = b,
                  value: FramyAppSettings.of(context).wrapWithCenter,
                ),
              ],
            ),
            Row(
              children: [
                Expanded(child: Text('Wrap with SafeArea')),
                Switch(
                  key: ValueKey('FramyAppSafeAreaSwitch'),
                  onChanged: (b) =>
                      framyAppStateKey.currentState.wrapWithSafeArea = b,
                  value: FramyAppSettings.of(context).wrapWithSafeArea,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FramyDrawer extends StatelessWidget {
  final bool showHeader;

  const FramyDrawer({Key key, this.showHeader = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      key: Key('FramyDrawer'),
      child: SingleChildScrollView(
        child: SafeArea(
          top: false,
          child: Column(
            children: [
              if (showHeader)
                AppBar(
                  automaticallyImplyLeading: false,
                  title: Text('Framy App'),
                ),
              ListTile(
                leading: Icon(Icons.text_fields),
                title: Text('Typography'),
                onTap: () =>
                    Navigator.of(context).pushReplacementNamed('/typography'),
              ),
              ListTile(
                leading: Icon(Icons.color_lens),
                title: Text('Color scheme'),
                onTap: () =>
                    Navigator.of(context).pushReplacementNamed('/colors'),
              ),
              Theme(
                data: Theme.of(context).copyWith(accentColor: Colors.black54),
                child: ExpansionTile(
                  leading: Icon(Icons.category),
                  title: Text(
                    'Material components',
                    style: TextStyle(color: Colors.black),
                  ),
                  children: [
                    ListTile(
                      leading: SizedBox.shrink(),
                      title: Text('AppBar'),
                      onTap: () =>
                          Navigator.of(context).pushReplacementNamed('/appbar'),
                    ),
                    ListTile(
                      key: Key('MaterialComponentsButtonButton'),
                      leading: SizedBox.shrink(),
                      title: Text('Button'),
                      onTap: () =>
                          Navigator.of(context).pushReplacementNamed('/button'),
                    ),
                    ListTile(
                      leading: SizedBox.shrink(),
                      title: Text('Toggle'),
                      onTap: () =>
                          Navigator.of(context).pushReplacementNamed('/toggle'),
                    ),
                    ListTile(
                      leading: SizedBox.shrink(),
                      title: Text('TextField'),
                      onTap: () => Navigator.of(context)
                          .pushReplacementNamed('/textfield'),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: SizedBox.shrink(),
                title: Text('PaymentPage'),
                onTap: () =>
                    Navigator.of(context).pushReplacementNamed('/PaymentPage'),
              ),
              ListTile(
                leading: SizedBox.shrink(),
                title: Text('SubscriptionDetails'),
                onTap: () => Navigator.of(context)
                    .pushReplacementNamed('/SubscriptionDetails'),
              ),
              ListTile(
                leading: SizedBox.shrink(),
                title: Text('FeedCardWidget'),
                onTap: () => Navigator.of(context)
                    .pushReplacementNamed('/FeedCardWidget'),
              ),
              ListTile(
                leading: SizedBox.shrink(),
                title: Text('FeedPage'),
                onTap: () =>
                    Navigator.of(context).pushReplacementNamed('/FeedPage'),
              ),
              ListTile(
                leading: SizedBox.shrink(),
                title: Text('ContraText'),
                onTap: () =>
                    Navigator.of(context).pushReplacementNamed('/ContraText'),
              ),
              ListTile(
                leading: SizedBox.shrink(),
                title: Text('FloatingBoxBottomSheet'),
                onTap: () => Navigator.of(context)
                    .pushReplacementNamed('/FloatingBoxBottomSheet'),
              ),
              ListTile(
                leading: SizedBox.shrink(),
                title: Text('TopBar'),
                onTap: () =>
                    Navigator.of(context).pushReplacementNamed('/TopBar'),
              ),
              ListTile(
                leading: SizedBox.shrink(),
                title: Text('TopBarAlternative'),
                onTap: () => Navigator.of(context)
                    .pushReplacementNamed('/TopBarAlternative'),
              ),
              ListTile(
                leading: Icon(Icons.view_carousel),
                title: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    Text('Storyboard'),
                    Chip(
                      label: Text(
                        'Preview',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                  ],
                ),
                onTap: () =>
                    Navigator.of(context).pushReplacementNamed('/storyboard'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ======================== MATERIAL PAGES ===========================

class FramyFontsPage extends StatelessWidget {
  const FramyFontsPage() : super(key: const Key('FramyFontsPage'));

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FramySingleFontRow('Headline1', textTheme.headline1),
            FramySingleFontRow('Headline2', textTheme.headline2),
            FramySingleFontRow('Headline3', textTheme.headline3),
            FramySingleFontRow('Headline4', textTheme.headline4),
            FramySingleFontRow('Headline5', textTheme.headline5),
            FramySingleFontRow('Headline6', textTheme.headline6),
            FramySingleFontRow('Subtitle1', textTheme.subtitle1),
            FramySingleFontRow('Subtitle2', textTheme.subtitle2),
            FramySingleFontRow('BodyText1', textTheme.bodyText1),
            FramySingleFontRow('BodyText2', textTheme.bodyText2),
            FramySingleFontRow('Caption', textTheme.caption),
            FramySingleFontRow('Button', textTheme.button),
            FramySingleFontRow('Overline', textTheme.overline),
          ],
        ),
      ),
    );
  }
}

class FramySingleFontRow extends StatelessWidget {
  final String label;
  final TextStyle style;

  const FramySingleFontRow(this.label, [this.style]);

  @override
  Widget build(BuildContext context) {
    final family = style.fontFamily;
    final size = ' / size: ${style.fontSize.toStringAsFixed(1)}';
    final weight =
        ' / weight: ${style.fontWeight.toString().replaceAll('FontWeight.', '')}';
    final height = style.height == null ? '' : ' / height: ${style.height}';
    final letterSpacing = style.letterSpacing == null
        ? ''
        : ' / letter spacing: ${style.letterSpacing}';
    final wordSpacing = style.wordSpacing == null
        ? ''
        : ' / word spacing: ${style.wordSpacing}';
    final color =
        ' / color: #${_hex(style.color.alpha)}${_hex(style.color.red)}${_hex(style.color.green)}${_hex(style.color.blue)}';
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: style),
          Text(
            '$family$size$weight$color$height$letterSpacing$wordSpacing',
          ),
        ],
      ),
    );
  }

  String _hex(int val) => val.toRadixString(16).padLeft(2, '0').toUpperCase();
}

class FramyColorsPage extends StatelessWidget {
  const FramyColorsPage() : super(key: const Key('FramyColorsPage'));

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 150,
      children: [
        _FramyColorItem(
          name: 'Primary',
          color: Theme.of(context).primaryColor,
        ),
        _FramyColorItem(
          name: 'Primary light',
          color: Theme.of(context).primaryColorLight,
        ),
        _FramyColorItem(
          name: 'Primary dark',
          color: Theme.of(context).primaryColorDark,
        ),
        _FramyColorItem(name: 'Canvas', color: Theme.of(context).canvasColor),
        _FramyColorItem(name: 'Accent', color: Theme.of(context).accentColor),
        _FramyColorItem(
          name: 'Scaffold background',
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        _FramyColorItem(
          name: 'Bottom appbar',
          color: Theme.of(context).bottomAppBarColor,
        ),
        _FramyColorItem(name: 'Card', color: Theme.of(context).cardColor),
        _FramyColorItem(
          name: 'Divider',
          color: Theme.of(context).dividerColor,
        ),
        _FramyColorItem(name: 'Focus', color: Theme.of(context).focusColor),
        _FramyColorItem(name: 'Hover', color: Theme.of(context).hoverColor),
        _FramyColorItem(
          name: 'Highlight',
          color: Theme.of(context).highlightColor,
        ),
        _FramyColorItem(name: 'Splash', color: Theme.of(context).splashColor),
        _FramyColorItem(
          name: 'Disabled',
          color: Theme.of(context).disabledColor,
        ),
        _FramyColorItem(name: 'Button', color: Theme.of(context).buttonColor),
        _FramyColorItem(
          name: 'Text selection',
          // ignore: deprecated_member_use
          color: Theme.of(context).textSelectionColor,
        ),
        // ignore: deprecated_member_use
        _FramyColorItem(name: 'Cursor', color: Theme.of(context).cursorColor),
        _FramyColorItem(
          name: 'Text selection handle',
          // ignore: deprecated_member_use
          color: Theme.of(context).textSelectionHandleColor,
        ),
        _FramyColorItem(
          name: 'Background',
          color: Theme.of(context).backgroundColor,
        ),
        _FramyColorItem(
          name: 'Dialog background',
          color: Theme.of(context).dialogBackgroundColor,
        ),
        _FramyColorItem(
          name: 'Indicator',
          color: Theme.of(context).indicatorColor,
        ),
        _FramyColorItem(name: 'Hint', color: Theme.of(context).hintColor),
        _FramyColorItem(name: 'Error', color: Theme.of(context).errorColor),
        _FramyColorItem(
          name: 'Toggleable Active',
          color: Theme.of(context).toggleableActiveColor,
        ),
        _FramyColorItem(
          name: 'Primary',
          color: Theme.of(context).colorScheme.primary,
        ),
        _FramyColorItem(
          name: 'Primary variant',
          color: Theme.of(context).colorScheme.primaryVariant,
        ),
        _FramyColorItem(
          name: 'Secondary',
          color: Theme.of(context).colorScheme.secondary,
        ),
        _FramyColorItem(
          name: 'Secondary variant',
          color: Theme.of(context).colorScheme.secondaryVariant,
        ),
        _FramyColorItem(
          name: 'Background',
          color: Theme.of(context).colorScheme.background,
        ),
        _FramyColorItem(
          name: 'Surface',
          color: Theme.of(context).colorScheme.surface,
        ),
        _FramyColorItem(
          name: 'Error',
          color: Theme.of(context).colorScheme.error,
        ),
        _FramyColorItem(
          name: 'On primary',
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        _FramyColorItem(
          name: 'On secondary',
          color: Theme.of(context).colorScheme.onSecondary,
        ),
        _FramyColorItem(
          name: 'On background',
          color: Theme.of(context).colorScheme.onBackground,
        ),
        _FramyColorItem(
          name: 'On surface',
          color: Theme.of(context).colorScheme.onSurface,
        ),
        _FramyColorItem(
          name: 'On error',
          color: Theme.of(context).colorScheme.onError,
        ),
      ],
    );
  }
}

class _FramyColorItem extends StatelessWidget {
  final String name;
  final Color color;

  const _FramyColorItem({Key key, @required this.name, @required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(
          color: Colors.grey.withOpacity(0.5),
          width: 0.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              color: color,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  key: Key(name),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  '#${_hex(color.alpha)}${_hex(color.red)}${_hex(color.green)}${_hex(color.blue)}',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  String _hex(int val) => val.toRadixString(16).padLeft(2, '0').toUpperCase();
}

class FramyHeaderText extends StatelessWidget {
  final String text;

  const FramyHeaderText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline5,
    );
  }
}

bool isDependencyAPreset(
  Map<String, Map<String, dynamic>> presets,
  FramyDependencyModel dependency,
) =>
    isValueAPreset(presets, dependency.type, dependency.value);

bool isValueAPreset(
  Map<String, Map<String, dynamic>> presets,
  String type,
  dynamic value,
) =>
    presets.containsKey(type) && presets[type].containsValue(value);

class FramyAppBarPage extends StatelessWidget {
  const FramyAppBarPage() : super(key: const Key('FramyAppBarPage'));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FramyHeaderText('AppBar'),
          const SizedBox(height: 16),
          AppBar(
            title: Text('AppBar'),
            automaticallyImplyLeading: false,
          ),
          const SizedBox(height: 16),
          AppBar(
            title: Text('AppBar'),
            leading: BackButton(),
            actions: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 16),
          AppBar(
            title: Text('AppBar'),
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.check),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.delete_outline),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 16),
          AppBar(
            title: Text('AppBar'),
            leading: CloseButton(),
            actions: [
              PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(child: Text('Edit')),
                  PopupMenuItem(child: Text('Save')),
                  PopupMenuItem(child: Text('Delete')),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FramyButtonPage extends StatefulWidget {
  const FramyButtonPage() : super(key: const Key('FramyButtonPage'));

  @override
  _FramyButtonPageState createState() => _FramyButtonPageState();
}

class _FramyButtonPageState extends State<FramyButtonPage> {
  String selectedOptionInDropdown;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FramyHeaderText('Raised button'),
              Wrap(
                spacing: 16,
                runSpacing: 8,
                children: [
                  RaisedButton(child: Text('Button'), onPressed: () {}),
                  RaisedButton(child: Text('Button'), onPressed: null),
                ],
              ),
              const SizedBox(height: 16),
              const FramyHeaderText('Flat button'),
              Wrap(
                spacing: 16,
                runSpacing: 8,
                children: [
                  FlatButton(child: Text('Button'), onPressed: () {}),
                  FlatButton(child: Text('Button'), onPressed: null),
                ],
              ),
              const SizedBox(height: 16),
              const FramyHeaderText('Outline button'),
              Wrap(
                spacing: 16,
                runSpacing: 8,
                children: [
                  OutlineButton(child: Text('Button'), onPressed: () {}),
                  OutlineButton(child: Text('Button'), onPressed: null),
                ],
              ),
              const SizedBox(height: 16),
              const FramyHeaderText('Floating Action Button'),
              const SizedBox(height: 4),
              Wrap(
                spacing: 16,
                runSpacing: 8,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () {},
                    heroTag: 'FabTag1',
                  ),
                  FloatingActionButton(
                    child: Icon(Icons.delete),
                    onPressed: null,
                    heroTag: 'FabTag2',
                  ),
                  FloatingActionButton.extended(
                    icon: Icon(Icons.delete),
                    label: Text('Button'),
                    onPressed: () {},
                    heroTag: 'FabTag3',
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const FramyHeaderText('Icon button'),
              const SizedBox(height: 4),
              Wrap(
                spacing: 16,
                runSpacing: 8,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  IconButton(icon: Icon(Icons.favorite), onPressed: () {}),
                  IconButton(
                    icon: Icon(Icons.favorite_border),
                    onPressed: null,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const FramyHeaderText('Dropdown button'),
              const SizedBox(height: 4),
              DropdownButton(
                hint: Text('Select option'),
                value: selectedOptionInDropdown,
                onChanged: (option) =>
                    setState(() => selectedOptionInDropdown = option),
                items: [
                  DropdownMenuItem(
                    child: Text('Option A'),
                    value: 'Option A',
                  ),
                  DropdownMenuItem(
                    child: Text('Option B'),
                    value: 'Option B',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FramyTogglePage extends StatefulWidget {
  const FramyTogglePage() : super(key: const Key('FramyTogglePage'));

  @override
  _FramyTogglePageState createState() => _FramyTogglePageState();
}

class _FramyTogglePageState extends State<FramyTogglePage> {
  bool switchState = false;
  List<bool> toggleState = [false, true, false];
  bool checkboxState = false;
  String radioState = 'Option A';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FramyHeaderText('Switch'),
            Switch(
              value: switchState,
              onChanged: (bool value) => setState(() => switchState = value),
            ),
            const FramyHeaderText('Toggle buttons'),
            const SizedBox(height: 8),
            ToggleButtons(
              onPressed: (index) =>
                  setState(() => toggleState[index] = !toggleState[index]),
              isSelected: toggleState,
              children: [
                Icon(Icons.format_bold),
                Icon(Icons.format_italic),
                Icon(Icons.format_align_center),
              ],
            ),
            const SizedBox(height: 8),
            const FramyHeaderText('Checkbox'),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool value) => setState(() => checkboxState = value),
              value: checkboxState,
              title: Text('Option'),
            ),
            const FramyHeaderText('Radio'),
            RadioListTile(
              value: 'Option A',
              onChanged: (system) => setState(() => radioState = system),
              groupValue: radioState,
              title: Text('Option A'),
            ),
            RadioListTile(
              value: 'Option B',
              onChanged: (system) => setState(() => radioState = system),
              groupValue: radioState,
              title: Text('Option B'),
            ),
          ],
        ),
      ),
    );
  }
}

class FramyTextFieldPage extends StatelessWidget {
  const FramyTextFieldPage() : super(key: const Key('FramyTextFieldPage'));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FramyHeaderText('TextField'),
            const SizedBox(height: 16),
            TextField(),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'TextField with label',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                filled: true,
                labelText: 'Filled TextField with label',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Outline TextField',
                focusedBorder: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: 'TextField with prefixIcon',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.remove_red_eye),
                labelText: 'TextField with suffixIcon',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'TextField with error message',
                errorText: 'Invalid value',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              enabled: false,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                hintText: 'Disabled TextField',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ======================== CUSTOM PAGES ===========================

typedef dynamic DependencyValueGetter(String name);

class FramyCustomPage extends StatefulWidget {
  final List<FramyDependencyModel> dependencies;
  final Widget Function(DependencyValueGetter dependencyValueGetter) builder;

  const FramyCustomPage({Key key, this.dependencies, this.builder})
      : super(key: key);

  @override
  _FramyCustomPageState createState() => _FramyCustomPageState();
}

class _FramyCustomPageState extends State<FramyCustomPage> {
  final Map<String, Map<String, dynamic>> presets = createFramyPresets();
  List<FramyDependencyModel> dependencies;
  int currentTabIndex = 0;
  double dependenciesPanelWidth = 300;

  @override
  void initState() {
    super.initState();
    dependencies = widget.dependencies;
  }

  FramyDependencyModel dependency(String name) =>
      dependencies.singleWhere((d) => d.name == name);

  dynamic dependencyValue(String name) => dependency(name).value;

  void onChanged(FramyDependencyModel dependencyModel) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final settings = FramyAppSettings.of(context);
    return SafeArea(
      bottom: false,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isSmallDevice =
              constraints.maxWidth < 1000 - 304 || constraints.maxHeight < 500;
          final body = Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Builder(
                  builder: (context) {
                    var widgetToDisplay = widget.builder(dependencyValue);
                    if (settings.wrapWithCenter) {
                      widgetToDisplay = Center(
                        key: ValueKey('FramyGeneratedCenter'),
                        child: widgetToDisplay,
                      );
                    }
                    if (settings.wrapWithSafeArea) {
                      widgetToDisplay = SafeArea(
                        key: ValueKey('FramyGeneratedSafeArea'),
                        child: widgetToDisplay,
                      );
                    }
                    if (settings.wrapWithScaffold) {
                      widgetToDisplay = Scaffold(
                        key: ValueKey('FramyGeneratedScaffold'),
                        body: widgetToDisplay,
                      );
                    }
                    return widgetToDisplay;
                  },
                ),
              ),
              if (!isSmallDevice)
                SizedBox(
                  width: dependenciesPanelWidth,
                  height: double.infinity,
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Positioned.fill(
                        child: FramyWidgetDependenciesPanel(
                          dependencies: dependencies,
                          presets: presets,
                          onChanged: onChanged,
                          tabIndex: currentTabIndex,
                          onTabIndexChanged: (index) =>
                              setState(() => currentTabIndex = index),
                        ),
                      ),
                      _buildResizeDragHandle(constraints),
                    ],
                  ),
                ),
            ],
          );
          if (isSmallDevice) {
            return Scaffold(
              body: body,
              floatingActionButton: FramyWidgetDependenciesFAB(
                dependencies: dependencies,
                presets: presets,
                onChanged: onChanged,
                tabIndex: currentTabIndex,
                onTabIndexChanged: (index) =>
                    setState(() => currentTabIndex = index),
              ),
            );
          } else {
            return body;
          }
        },
      ),
    );
  }

  Widget _buildResizeDragHandle(BoxConstraints constraints) {
    return GestureDetector(
      key: Key('FramyDependenciesPanelDragHandle'),
      onHorizontalDragUpdate: (det) {
        setState(() {
          dependenciesPanelWidth -= det.delta.dx;
          dependenciesPanelWidth =
              dependenciesPanelWidth.clamp(200.0, constraints.maxWidth * 0.7);
        });
      },
      child: InkWell(
        child: Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(
              right: Radius.circular(4),
            ),
          ),
          color: Theme.of(context).accentColor.withOpacity(0.5),
          child: Container(
            width: 8,
            height: 50,
          ),
        ),
      ),
    );
  }
}

class FramyPaymentPageCustomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FramyCustomPage(
      key: Key('Framy_PaymentPage_Page'),
      dependencies: [
        FramyDependencyModel<SubscriptionViewModel>(
            'SubscriptionViewModel', 'SubscriptionViewModel', null),
      ],
      builder: (DependencyValueGetter valueGetter) {
        return provider.MultiProvider(
          providers: [
            provider.Provider<SubscriptionViewModel>.value(
                value: valueGetter('SubscriptionViewModel')),
          ],
          child: PaymentPage(),
        );
      },
    );
  }
}

class FramySubscriptionDetailsCustomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FramyCustomPage(
      key: Key('Framy_SubscriptionDetails_Page'),
      dependencies: [
        FramyDependencyModel<DialogRequest>(
            'dialogRequest', 'DialogRequest', null),
        FramyDependencyModel<dynamic Function(DialogResponse)>(
            'onDialogTap', 'dynamic Function(DialogResponse)', null),
      ],
      builder: (DependencyValueGetter valueGetter) {
        return SubscriptionDetails(
          dialogRequest: valueGetter('dialogRequest'),
          onDialogTap: valueGetter('onDialogTap'),
        );
      },
    );
  }
}

class FramyFeedCardWidgetCustomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FramyCustomPage(
      key: Key('Framy_FeedCardWidget_Page'),
      dependencies: [
        FramyDependencyModel<Announcement>('feed', 'Announcement', null),
        FramyDependencyModel<FeedViewModel>('feedModel', 'FeedViewModel', null),
      ],
      builder: (DependencyValueGetter valueGetter) {
        return FeedCardWidget(
          feed: valueGetter('feed'),
          feedModel: valueGetter('feedModel'),
        );
      },
    );
  }
}

class FramyFeedPageCustomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FramyCustomPage(
      key: Key('Framy_FeedPage_Page'),
      dependencies: [
        FramyDependencyModel<dynamic>('reactive', 'dynamic', false),
      ],
      builder: (DependencyValueGetter valueGetter) {
        return FeedPage(
          reactive: valueGetter('reactive'),
        );
      },
    );
  }
}

class FramyContraTextCustomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FramyCustomPage(
      key: Key('Framy_ContraText_Page'),
      dependencies: [
        FramyDependencyModel<Alignment>('alignment', 'Alignment', null),
        FramyDependencyModel<String>('text', 'String', null),
        FramyDependencyModel<double>('size', 'double', null),
        FramyDependencyModel<Color>('color', 'Color', null),
        FramyDependencyModel<FontWeight>('weight', 'FontWeight', null),
        FramyDependencyModel<TextAlign>('textAlign', 'TextAlign', null),
      ],
      builder: (DependencyValueGetter valueGetter) {
        return ContraText(
          alignment: valueGetter('alignment'),
          text: valueGetter('text'),
          size: valueGetter('size'),
          color: valueGetter('color'),
          weight: valueGetter('weight'),
          textAlign: valueGetter('textAlign'),
        );
      },
    );
  }
}

class FramyFloatingBoxBottomSheetCustomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FramyCustomPage(
      key: Key('Framy_FloatingBoxBottomSheet_Page'),
      dependencies: [
        FramyDependencyModel<SheetRequest>('request', 'SheetRequest', null),
        FramyDependencyModel<dynamic Function(SheetResponse)>(
            'completer', 'dynamic Function(SheetResponse)', null),
      ],
      builder: (DependencyValueGetter valueGetter) {
        return FloatingBoxBottomSheet(
          request: valueGetter('request'),
          completer: valueGetter('completer'),
        );
      },
    );
  }
}

class FramyTopBarCustomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FramyCustomPage(
      key: Key('Framy_TopBar_Page'),
      dependencies: [
        FramyDependencyModel<String>('title', 'String', null),
        FramyDependencyModel<Widget>('child', 'Widget', null),
        FramyDependencyModel<Function>('onPressed', 'Function', null),
        FramyDependencyModel<String>('buttonHeroTag', 'String', null),
        FramyDependencyModel<Function>('onTitleTapped', 'Function', null),
      ],
      builder: (DependencyValueGetter valueGetter) {
        return TopBar(
          title: valueGetter('title'),
          child: valueGetter('child'),
          onPressed: valueGetter('onPressed'),
          buttonHeroTag: valueGetter('buttonHeroTag'),
          onTitleTapped: valueGetter('onTitleTapped'),
        );
      },
    );
  }
}

class FramyTopBarAlternativeCustomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FramyCustomPage(
      key: Key('Framy_TopBarAlternative_Page'),
      dependencies: [
        FramyDependencyModel<String>('title', 'String', null),
        FramyDependencyModel<Function>('onPressed', 'Function', null),
        FramyDependencyModel<String>('buttonHeroTag', 'String', null),
        FramyDependencyModel<Function>('onTitleTapped', 'Function', null),
      ],
      builder: (DependencyValueGetter valueGetter) {
        return TopBarAlternative(
          title: valueGetter('title'),
          onPressed: valueGetter('onPressed'),
          buttonHeroTag: valueGetter('buttonHeroTag'),
          onTitleTapped: valueGetter('onTitleTapped'),
        );
      },
    );
  }
}

class FramyDependencyModel<T> {
  final String name;
  final String type;
  T value;
  T lastCustomValue;
  String constructor;
  List<FramyDependencyModel> subDependencies;
  final functionCalls = FramyDependencyFunctionCallsList();

  FramyDependencyModel(this.name, this.type, this.value,
      {this.subDependencies, this.constructor}) {
    if (constructor == null) {
      constructor = framyAvailableConstructorNames[type]?.first ?? '';
    }
    if (subDependencies == null) {
      subDependencies = createSubDependencies(type, constructor);
    }
    if (value == null) {
      updateValue();
    }
    lastCustomValue = value;
  }

  bool get isFunction => type.contains('Function(');

  String get listType => type.substring(
        type.indexOf('<') + 1,
        type.lastIndexOf('>'),
      );

  void updateValue() {
    if (type.startsWith('List<')) {
      value = initList(listType);
    } else if (isFunction) {
      value = getFunctionCallback(this);
    } else {
      value = framyModelConstructorMap[type]?.call(this);
    }
    lastCustomValue = value;
  }
}

class FramyDependencyFunctionCallsList with ChangeNotifier {
  final List<FramyDependencyFunctionCall> calls = [];

  void addCall(functionName, params) {
    calls.add(FramyDependencyFunctionCall(functionName, params));
    notifyListeners();
  }
}

class FramyDependencyFunctionCall {
  final DateTime time;
  final List<dynamic> params;
  final String functionName;

  FramyDependencyFunctionCall(this.functionName, this.params)
      : time = DateTime.now();
}

class FramyWidgetDependenciesPanel extends StatelessWidget {
  final List<FramyDependencyModel> dependencies;
  final ValueChanged<FramyDependencyModel> onChanged;
  final Map<String, Map<String, dynamic>> presets;
  final int tabIndex;
  final ValueChanged<int> onTabIndexChanged;

  const FramyWidgetDependenciesPanel(
      {Key key,
      this.dependencies,
      this.onChanged,
      this.presets,
      this.tabIndex = 0,
      this.onTabIndexChanged})
      : super(key: const Key('FramyWidgetDependenciesPanel'));

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Material(
        color: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
            Expanded(
              child: tabIndex == 0
                  ? FramyDependenciesTab(
                      dependencies: dependencies,
                      onChanged: onChanged,
                      presets: presets,
                    )
                  : FramyCallbacksTab(dependencies: dependencies),
            ),
            if (dependencies.any((model) => model.type.contains('Function(')))
              BottomNavigationBar(
                backgroundColor: Colors.white,
                currentIndex: tabIndex,
                onTap: onTabIndexChanged,
                items: [
                  BottomNavigationBarItem(
                    label: 'Dependencies',
                    icon: Icon(Icons.settings_applications),
                  ),
                  BottomNavigationBarItem(
                    label: 'Callbacks',
                    icon: Icon(Icons.list),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class FramyCallbacksTab extends StatefulWidget {
  final List<FramyDependencyModel> dependencies;

  const FramyCallbacksTab({Key key, this.dependencies}) : super(key: key);

  @override
  _FramyCallbacksTabState createState() => _FramyCallbacksTabState();
}

class _FramyCallbacksTabState extends State<FramyCallbacksTab> {
  @override
  void initState() {
    super.initState();
    widget.dependencies.forEach((element) {
      element.functionCalls.addListener(_onCallsChanged);
    });
  }

  @override
  void dispose() {
    widget.dependencies.forEach((element) {
      element.functionCalls.removeListener(_onCallsChanged);
    });
    super.dispose();
  }

  void _onCallsChanged() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final callbacks = widget.dependencies
        .fold<List<FramyDependencyFunctionCall>>(
            <FramyDependencyFunctionCall>[],
            (prev, dep) => prev..addAll(dep.functionCalls.calls))
          ..sort((a, b) => b.time.compareTo(a.time));
    return ListView.builder(
      itemCount: callbacks.length,
      itemBuilder: (context, index) {
        final callback = callbacks[index];
        return ListTile(
          dense: true,
          title: Row(
            children: [
              Text(callback.functionName),
              Spacer(),
              Text(
                  '${callback.time.hour.toString().padLeft(2, '0')}:${callback.time.minute.toString().padLeft(2, '0')}:${callback.time.millisecond.toString().padLeft(3, '0')}')
            ],
          ),
          subtitle: Column(
            children: callback.params.map((param) => Text('• $param')).toList(),
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        );
      },
    );
  }
}

class FramyDependenciesTab extends StatelessWidget {
  final List<FramyDependencyModel> dependencies;
  final ValueChanged<FramyDependencyModel> onChanged;
  final Map<String, Map<String, dynamic>> presets;

  const FramyDependenciesTab(
      {Key key, this.dependencies, this.onChanged, this.presets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: dependencies
              .map((dep) => FramyWidgetDependencyInput(
                    dependency: dep,
                    onChanged: onChanged,
                    presets: presets,
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class FramyWidgetDependenciesFAB extends StatelessWidget {
  final List<FramyDependencyModel> dependencies;
  final ValueChanged<FramyDependencyModel> onChanged;
  final Map<String, Map<String, dynamic>> presets;
  final int tabIndex;
  final ValueChanged<int> onTabIndexChanged;

  const FramyWidgetDependenciesFAB(
      {Key key,
      this.onChanged,
      this.dependencies,
      this.presets,
      this.tabIndex = 0,
      this.onTabIndexChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'FramyWidgetDependenciesButton',
      child: Icon(Icons.tune),
      key: const Key('FramyWidgetDependenciesButton'),
      onPressed: () => showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        context: context,
        builder: (context) {
          int _tabIndex;
          return StatefulBuilder(
            builder: (context, setState) {
              return Column(
                children: [
                  SizedBox(
                    height: 2,
                    key: Key('framySheetDragHandle'),
                  ),
                  Expanded(
                    child: FramyWidgetDependenciesPanel(
                      dependencies: dependencies,
                      presets: presets,
                      onChanged: (dep) {
                        setState(() {});
                        onChanged(dep);
                      },
                      tabIndex: _tabIndex ?? tabIndex,
                      onTabIndexChanged: (index) {
                        setState(() => _tabIndex = index);
                        onTabIndexChanged(index);
                      },
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
      mini: true,
    );
  }
}

class FramyStoryboardPage extends StatelessWidget {
  const FramyStoryboardPage() : super(key: const Key('FramyStoryboardPage'));

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      padding: const EdgeInsets.all(16),
      maxCrossAxisExtent: 300,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1 / 2,
      children: [],
    );
  }
}

class FramyStoryboardCustomPageWithDependencies extends StatelessWidget {
  final List<FramyDependencyModel> dependencies;
  final Widget Function(DependencyValueGetter dependencyValueGetter) builder;
  final String name;

  const FramyStoryboardCustomPageWithDependencies(
      {Key key, this.dependencies, this.builder, this.name})
      : super(key: key);

  FramyDependencyModel dependency(String name) =>
      dependencies.singleWhere((d) => d.name == name);

  dynamic dependencyValue(String name) => dependency(name).value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black54),
              borderRadius: BorderRadius.circular(16),
            ),
            child: builder(dependencyValue),
          ),
        ),
        const SizedBox(height: 8),
        Text(name, style: Theme.of(context).textTheme.caption),
      ],
    );
  }
}

// ======================== DEPENDENCY INPUTS ===========================

InputDecoration get _framyInputDecoration => InputDecoration(
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
    );

class FramyWidgetDependencyInput extends StatelessWidget {
  final FramyDependencyModel dependency;
  final ValueChanged<FramyDependencyModel> onChanged;
  final Map<String, Map<String, dynamic>> presets;
  final Widget trailing;

  const FramyWidgetDependencyInput(
      {Key key, this.dependency, this.onChanged, this.presets, this.trailing})
      : super(key: key);

  void _onValueChanged(dynamic value) {
    if (value != null && !isValueAPreset(presets, dependency.type, value)) {
      dependency.lastCustomValue = value;
    }
    dependency.value = value;
    onChanged(dependency);
  }

  @override
  Widget build(BuildContext context) {
    final inputKey = Key('framy_dependency_${dependency.name}_input');
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    dependency.name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  if (trailing != null) trailing,
                ],
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: FramyPresetDropdown(
                  dependency: dependency,
                  onChanged: _onValueChanged,
                  presets: presets,
                ),
              ),
            ],
          ),
        ),
        if (!isDependencyAPreset(presets, dependency) &&
            framyAvailableConstructorNames.containsKey(dependency.type) &&
            framyAvailableConstructorNames[dependency.type].length > 1)
          FramyConstructorDropdown(
            dependency: dependency,
            onChanged: onChanged,
          ),
        if (!isDependencyAPreset(presets, dependency))
          if (dependency.type == 'bool')
            InputDecorator(
              decoration: _framyInputDecoration,
              child: DropdownButtonHideUnderline(
                child: DropdownButton<bool>(
                  isDense: true,
                  key: inputKey,
                  value: dependency.value,
                  onChanged: _onValueChanged,
                  items: [
                    DropdownMenuItem(
                      value: true,
                      child: Text('True'),
                    ),
                    DropdownMenuItem(
                      value: false,
                      child: Text('False'),
                    )
                  ],
                ),
              ),
            )
          else if (dependency.type == 'String' ||
              dependency.type == 'int' ||
              dependency.type == 'double')
            TextFormField(
              key: inputKey,
              decoration: _framyInputDecoration,
              initialValue: dependency.value?.toString(),
              autovalidateMode: AutovalidateMode.always,
              validator: (value) {
                String error;
                if (dependency.type == 'int') {
                  if (int.tryParse(value) == null) {
                    error = 'Invalid integer value';
                  }
                } else if (dependency.type == 'double') {
                  if (double.tryParse(value) == null) {
                    error = 'Invalid double value';
                  }
                }
                return error;
              },
              onChanged: (s) {
                var valueToReturn;
                if (dependency.type == 'int') {
                  valueToReturn = int.tryParse(s);
                } else if (dependency.type == 'double') {
                  valueToReturn = double.tryParse(s);
                } else {
                  valueToReturn = s;
                }
                if (valueToReturn != null) {
                  _onValueChanged(valueToReturn);
                }
              },
            )
          else if (dependency.type == 'DateTime')
            FramyDateTimeDependencyInput(
              key: inputKey,
              dependency: dependency,
              presets: presets,
              onChanged: _onValueChanged,
            )
          else if (dependency.type == 'Announcement' ||
              dependency.type == 'Assignment' ||
              dependency.type == 'UserEntryData' ||
              dependency.type == 'UserEntryDataDb' ||
              dependency.type == 'EBook' ||
              dependency.type == 'ExamTopic' ||
              dependency.type == 'Feed' ||
              dependency.type == 'Fees' ||
              dependency.type == 'HolidayData' ||
              dependency.type == 'Meta' ||
              dependency.type == 'Response' ||
              dependency.type == 'Holiday' ||
              dependency.type == 'Date' ||
              dependency.type == 'Datetime' ||
              dependency.type == 'Timezone' ||
              dependency.type == 'HolidayItem' ||
              dependency.type == 'Classlibrary' ||
              dependency.type == 'Message' ||
              dependency.type == 'SubscriptionResponse' ||
              dependency.type == 'Subscription' ||
              dependency.type == 'Question' ||
              dependency.type == 'Wall' ||
              dependency.type == 'StudentData' ||
              dependency.type == 'StudentEntryData' ||
              dependency.type == 'StudentEntryDataDb' ||
              dependency.type == 'User' ||
              dependency.type == 'UserDataLogin' ||
              dependency.type == 'Contribution')
            FramyModelInput(
              key: inputKey,
              dependencies: dependency.subDependencies,
              presets: presets,
              onChanged: (_) => _onValueChanged(
                framyModelConstructorMap[dependency.type]?.call(dependency),
              ),
            )
          else if (dependency.type.startsWith('List<'))
            FramyWidgetListDependencyInput(
              dependency: dependency,
              onChanged: (_) => _onValueChanged(dependency.value),
              presets: presets,
            )
          else if (framyEnumMap.containsKey(dependency.type))
            InputDecorator(
              decoration: _framyInputDecoration,
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  isDense: true,
                  key: inputKey,
                  value: dependency.value,
                  onChanged: _onValueChanged,
                  items: framyEnumMap[dependency.type]
                      .map((enumValue) => DropdownMenuItem(
                            value: enumValue,
                            child: Text(enumValue.toString().substring(
                                enumValue.toString().indexOf('.') + 1)),
                          ))
                      .toList(),
                ),
              ),
            )
          else if (dependency.isFunction)
            Text('See call history in Callbacks tab')
          else
            Text('Not supported type'),
      ],
    );
  }
}

class FramyModelInput extends StatelessWidget {
  final List<FramyDependencyModel> dependencies;
  final ValueChanged<List<FramyDependencyModel>> onChanged;
  final Map<String, Map<String, dynamic>> presets;

  FramyModelInput({Key key, this.onChanged, this.dependencies, this.presets})
      : super(key: key);

  FramyDependencyModel dependency(String name) =>
      dependencies.singleWhere((d) => d.name == name);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8),
      child: Column(
        children: dependencies
            .map((dep) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, right: 2),
                      child: Text('•'),
                    ),
                    Expanded(
                      child: FramyWidgetDependencyInput(
                        dependency: dep,
                        presets: presets,
                        onChanged: (changedDep) {
                          onChanged(dependencies);
                        },
                      ),
                    ),
                  ],
                ))
            .toList(),
      ),
    );
  }
}

class FramyDateTimeDependencyInput extends StatelessWidget {
  final FramyDependencyModel dependency;
  final ValueChanged<dynamic> onChanged;
  final Map<String, Map<String, dynamic>> presets;

  const FramyDateTimeDependencyInput(
      {Key key, this.dependency, this.onChanged, this.presets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = dependency.value == null
        ? '-'
        : (dependency.value as DateTime)
            .toIso8601String()
            .replaceFirst('T', ' ')
            .replaceFirst(RegExp('\\..*'), '');
    return InkWell(
      onTap: () {
        showDatePicker(
          context: context,
          initialDate: dependency.value ?? DateTime.now(),
          firstDate: DateTime(1000),
          lastDate: DateTime(3000),
        ).then((value) {
          if (value != null) {
            onChanged(value);
          }
        });
      },
      child: InputDecorator(
        decoration: _framyInputDecoration.copyWith(
          suffixIcon: Icon(Icons.calendar_today),
        ),
        child: Text(text),
      ),
    );
  }
}

class FramyWidgetListDependencyInput extends StatelessWidget {
  final FramyDependencyModel dependency;
  final ValueChanged<FramyDependencyModel> onChanged;
  final Map<String, Map<String, dynamic>> presets;

  const FramyWidgetListDependencyInput(
      {Key key, this.dependency, this.onChanged, this.presets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      key: Key(dependency.value?.length?.toString()),
      children: [
        if (dependency.value != null)
          for (int i = 0; i < dependency.value.length; i++)
            FramyWidgetDependencyInput(
              dependency: FramyDependencyModel(
                'List element ${i + 1}',
                dependency.listType,
                dependency.value[i],
                subDependencies: dependency.subDependencies[i].subDependencies,
                constructor: dependency.subDependencies[i].constructor,
              ),
              onChanged: (changedDep) {
                dependency.value[i] = changedDep.value;
                dependency.subDependencies[i].constructor =
                    changedDep.constructor;
                dependency.subDependencies[i].subDependencies =
                    changedDep.subDependencies;
                onChanged(dependency);
              },
              presets: presets,
              trailing: Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: IconButton(
                  key: Key(
                      'framy_dependency_List element ${i + 1}_delete_button'),
                  icon: Icon(Icons.close),
                  iconSize: 16,
                  onPressed: () {
                    dependency.value.removeAt(i);
                    dependency.subDependencies.removeAt(i);
                    onChanged(dependency);
                  },
                  // splashRadius: 16, //--not in Stable channel yet
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints.tightFor(
                    height: 20,
                    width: 20,
                  ),
                ),
              ),
            ),
        FlatButton(
          child: Text('+ Add ${dependency.name} element'),
          onPressed: () {
            if (dependency.value == null) {
              dependency.value = initList(dependency.listType);
            }
            final newModel = FramyDependencyModel<dynamic>(
              '_',
              dependency.listType,
              null,
            );
            dependency.subDependencies.add(newModel);
            dependency.value.add(newModel.value);
            onChanged(dependency);
          },
        ),
      ],
    );
  }
}

dynamic initList(String listType) {
  if (listType == 'String') return <String>[];
  if (listType == 'int') return <int>[];
  if (listType == 'double') return <double>[];
  if (listType == 'bool') return <bool>[];
  if (listType == 'Announcement') return <Announcement>[];
  if (listType == 'Assignment') return <Assignment>[];
  if (listType == 'UserEntryData') return <UserEntryData>[];
  if (listType == 'UserEntryDataDb') return <UserEntryDataDb>[];
  if (listType == 'EBook') return <EBook>[];
  if (listType == 'ExamTopic') return <ExamTopic>[];
  if (listType == 'Feed') return <Feed>[];
  if (listType == 'Fees') return <Fees>[];
  if (listType == 'Locations') return <Locations>[];
  if (listType == 'Type') return <Type>[];
  if (listType == 'HolidayData') return <HolidayData>[];
  if (listType == 'Meta') return <Meta>[];
  if (listType == 'Response') return <Response>[];
  if (listType == 'Holiday') return <Holiday>[];
  if (listType == 'Date') return <Date>[];
  if (listType == 'Datetime') return <Datetime>[];
  if (listType == 'Timezone') return <Timezone>[];
  if (listType == 'HolidayItem') return <HolidayItem>[];
  if (listType == 'Classlibrary') return <Classlibrary>[];
  if (listType == 'Message') return <Message>[];
  if (listType == 'SubscriptionResponse') return <SubscriptionResponse>[];
  if (listType == 'Subscription') return <Subscription>[];
  if (listType == 'Question') return <Question>[];
  if (listType == 'Wall') return <Wall>[];
  if (listType == 'StudentData') return <StudentData>[];
  if (listType == 'StudentEntryData') return <StudentEntryData>[];
  if (listType == 'StudentEntryDataDb') return <StudentEntryDataDb>[];
  if (listType == 'User') return <User>[];
  if (listType == 'UserDataLogin') return <UserDataLogin>[];
  if (listType == 'Contribution')
    return <Contribution>[];
  else
    return [];
}

class FramyPresetDropdown extends StatelessWidget {
  final FramyDependencyModel dependency;
  final ValueChanged onChanged;
  final Map<String, Map<String, dynamic>> presets;

  const FramyPresetDropdown(
      {Key key, this.dependency, this.onChanged, this.presets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var customValue = dependency.value;
    if (customValue == null || isDependencyAPreset(presets, dependency)) {
      if (dependency.isFunction) {
        customValue = getFunctionCallback(dependency);
      } else {
        customValue =
            framyModelConstructorMap[dependency.type]?.call(dependency);
      }
    }
    return DropdownButton(
      key: Key('framy_${dependency.name}_preset_dropdown'),
      value: dependency.value,
      underline: Container(
        color: Colors.grey.withOpacity(0.2),
        height: 1,
        width: double.infinity,
      ),
      onChanged: (val) {
        if (val == customValue) {
          onChanged(dependency.lastCustomValue ?? customValue);
        } else {
          onChanged(val);
        }
      },
      items: [
        DropdownMenuItem(
          value: null,
          child: Text('Null'),
        ),
        DropdownMenuItem(
          value: customValue,
          child: Text(dependency.isFunction ? 'Logger' : 'Custom'),
        ),
        if (presets.containsKey(dependency.type))
          ...presets[dependency.type].entries.map(
                (entry) => DropdownMenuItem(
                  child: Text(entry.key),
                  value: entry.value,
                ),
              ),
      ],
    );
  }
}

class FramyConstructorDropdown extends StatelessWidget {
  final FramyDependencyModel dependency;
  final ValueChanged<FramyDependencyModel> onChanged;

  FramyConstructorDropdown({this.dependency, this.onChanged})
      : super(
          key: Key('framy_dependency_${dependency.name}_constructor_dropdown'),
        );

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: 'Constructor',
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isDense: true,
          value: dependency.constructor,
          onChanged: (conName) {
            dependency.constructor = conName;
            dependency.subDependencies =
                createSubDependencies(dependency.type, dependency.constructor);
            dependency.updateValue();
            onChanged(dependency);
          },
          items: framyAvailableConstructorNames[dependency.type]
              .map((constructorName) => DropdownMenuItem<String>(
                    value: constructorName,
                    child: Text(constructorName.isEmpty
                        ? 'Default'
                        : constructorName.replaceAll('.', '')),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

// ======================== MAPS etc ===========================

final framyModelConstructorMap =
    <String, dynamic Function(FramyDependencyModel)>{
  ...framyEnumMap.map((type, values) =>
      MapEntry(type, (FramyDependencyModel dep) => values.first)),
  'Announcement': (dep) {
    if (dep.constructor == '') {
      return Announcement(
        caption:
            dep.subDependencies.singleWhere((d) => d.name == 'caption').value,
        by: dep.subDependencies.singleWhere((d) => d.name == 'by').value,
        forDiv:
            dep.subDependencies.singleWhere((d) => d.name == 'forDiv').value,
        timestamp:
            dep.subDependencies.singleWhere((d) => d.name == 'timestamp').value,
        forClass:
            dep.subDependencies.singleWhere((d) => d.name == 'forClass').value,
        photoUrl:
            dep.subDependencies.singleWhere((d) => d.name == 'photoUrl').value,
        userId:
            dep.subDependencies.singleWhere((d) => d.name == 'userId').value,
        photoPath:
            dep.subDependencies.singleWhere((d) => d.name == 'photoPath').value,
        type: dep.subDependencies.singleWhere((d) => d.name == 'type').value,
        id: dep.subDependencies.singleWhere((d) => d.name == 'id').value,
        likeCount:
            dep.subDependencies.singleWhere((d) => d.name == 'likeCount').value,
        likeList:
            dep.subDependencies.singleWhere((d) => d.name == 'likeList').value,
      );
    }
    if (dep.constructor == '.fromJson') {
      return Announcement.fromJson(
        dep.subDependencies.singleWhere((d) => d.name == 'json').value,
      );
    }
    if (dep.constructor == '.fromSnapshot') {
      return Announcement.fromSnapshot(
        dep.subDependencies.singleWhere((d) => d.name == 'snapshot').value,
      );
    } else
      return null;
  },
  'Assignment': (dep) {
    if (dep.constructor == '') {
      return Assignment(
        by: dep.subDependencies.singleWhere((d) => d.name == 'by').value,
        title: dep.subDependencies.singleWhere((d) => d.name == 'title').value,
        path: dep.subDependencies.singleWhere((d) => d.name == 'path').value,
        div: dep.subDependencies.singleWhere((d) => d.name == 'div').value,
        subject:
            dep.subDependencies.singleWhere((d) => d.name == 'subject').value,
        standard:
            dep.subDependencies.singleWhere((d) => d.name == 'standard').value,
        timeStamp:
            dep.subDependencies.singleWhere((d) => d.name == 'timeStamp').value,
        url: dep.subDependencies.singleWhere((d) => d.name == 'url').value,
        details:
            dep.subDependencies.singleWhere((d) => d.name == 'details').value,
        id: dep.subDependencies.singleWhere((d) => d.name == 'id').value,
      );
    }
    if (dep.constructor == '.fromJson') {
      return Assignment.fromJson(
        dep.subDependencies.singleWhere((d) => d.name == 'json').value,
      );
    }
    if (dep.constructor == '.fromSnapshot') {
      return Assignment.fromSnapshot(
        dep.subDependencies
            .singleWhere((d) => d.name == 'documentSnapshot')
            .value,
      );
    } else
      return null;
  },
  'UserEntryData': (dep) {
    if (dep.constructor == '') {
      return UserEntryData(
        email: dep.subDependencies.singleWhere((d) => d.name == 'email').value,
        id: dep.subDependencies.singleWhere((d) => d.name == 'id').value,
        isATeacher: dep.subDependencies
            .singleWhere((d) => d.name == 'isATeacher')
            .value,
        childIds:
            dep.subDependencies.singleWhere((d) => d.name == 'childIds').value,
      );
    }
    if (dep.constructor == '.fromJson') {
      return UserEntryData.fromJson(
        dep.subDependencies.singleWhere((d) => d.name == 'json').value,
      );
    } else
      return null;
  },
  'UserEntryDataDb': (dep) {
    if (dep.constructor == '') {
      return UserEntryDataDb(
        email: dep.subDependencies.singleWhere((d) => d.name == 'email').value,
        id: dep.subDependencies.singleWhere((d) => d.name == 'id').value,
        isATeacher: dep.subDependencies
            .singleWhere((d) => d.name == 'isATeacher')
            .value,
        childId:
            dep.subDependencies.singleWhere((d) => d.name == 'childId').value,
      );
    }
    if (dep.constructor == '.fromJson') {
      return UserEntryDataDb.fromJson(
        dep.subDependencies.singleWhere((d) => d.name == 'json').value,
      );
    } else
      return null;
  },
  'EBook': (dep) {
    if (dep.constructor == '') {
      return EBook(
        bookId:
            dep.subDependencies.singleWhere((d) => d.name == 'bookId').value,
        bookAuthor: dep.subDependencies
            .singleWhere((d) => d.name == 'bookAuthor')
            .value,
        bookIsForStandard: dep.subDependencies
            .singleWhere((d) => d.name == 'bookIsForStandard')
            .value,
        subject:
            dep.subDependencies.singleWhere((d) => d.name == 'subject').value,
        description: dep.subDependencies
            .singleWhere((d) => d.name == 'description')
            .value,
        bookName:
            dep.subDependencies.singleWhere((d) => d.name == 'bookName').value,
        imageUrl:
            dep.subDependencies.singleWhere((d) => d.name == 'imageUrl').value,
        pdfUrl:
            dep.subDependencies.singleWhere((d) => d.name == 'pdfUrl').value,
      );
    } else
      return null;
  },
  'ExamTopic': (dep) {
    if (dep.constructor == '') {
      return ExamTopic(
        description: dep.subDependencies
            .singleWhere((d) => d.name == 'description')
            .value,
        subject:
            dep.subDependencies.singleWhere((d) => d.name == 'subject').value,
        topicCreatedBySchoolName: dep.subDependencies
            .singleWhere((d) => d.name == 'topicCreatedBySchoolName')
            .value,
        topicCreatedByTeacherName: dep.subDependencies
            .singleWhere((d) => d.name == 'topicCreatedByTeacherName')
            .value,
        topicCreatedByTeacherId: dep.subDependencies
            .singleWhere((d) => d.name == 'topicCreatedByTeacherId')
            .value,
        topicId:
            dep.subDependencies.singleWhere((d) => d.name == 'topicId').value,
        topicimageUrl: dep.subDependencies
            .singleWhere((d) => d.name == 'topicimageUrl')
            .value,
        topicIsForStandard: dep.subDependencies
            .singleWhere((d) => d.name == 'topicIsForStandard')
            .value,
        topicName:
            dep.subDependencies.singleWhere((d) => d.name == 'topicName').value,
      );
    } else
      return null;
  },
  'Feed': (dep) {
    if (dep.constructor == '') {
      return Feed(
        caption:
            dep.subDependencies.singleWhere((d) => d.name == 'caption').value,
        by: dep.subDependencies.singleWhere((d) => d.name == 'by').value,
        forDiv:
            dep.subDependencies.singleWhere((d) => d.name == 'forDiv').value,
        forClass:
            dep.subDependencies.singleWhere((d) => d.name == 'forClass').value,
        photoUrl:
            dep.subDependencies.singleWhere((d) => d.name == 'photoUrl').value,
        photoPath:
            dep.subDependencies.singleWhere((d) => d.name == 'photoPath').value,
        type: dep.subDependencies.singleWhere((d) => d.name == 'type').value,
        id: dep.subDependencies.singleWhere((d) => d.name == 'id').value,
      );
    }
    if (dep.constructor == '.fromJson') {
      return Feed.fromJson(
        dep.subDependencies.singleWhere((d) => d.name == 'json').value,
      );
    } else
      return null;
  },
  'Fees': (dep) {
    if (dep.constructor == '') {
      return Fees(
        description: dep.subDependencies
            .singleWhere((d) => d.name == 'description')
            .value,
        due: dep.subDependencies.singleWhere((d) => d.name == 'due').value,
        paid: dep.subDependencies.singleWhere((d) => d.name == 'paid').value,
        timestamp:
            dep.subDependencies.singleWhere((d) => d.name == 'timestamp').value,
        to: dep.subDependencies.singleWhere((d) => d.name == 'to').value,
        totalFees:
            dep.subDependencies.singleWhere((d) => d.name == 'totalFees').value,
        photoPath:
            dep.subDependencies.singleWhere((d) => d.name == 'photoPath').value,
        id: dep.subDependencies.singleWhere((d) => d.name == 'id').value,
        type: dep.subDependencies.singleWhere((d) => d.name == 'type').value,
      );
    }
    if (dep.constructor == '.fromJson') {
      return Fees.fromJson(
        dep.subDependencies.singleWhere((d) => d.name == 'json').value,
      );
    }
    if (dep.constructor == '.fromSnapshot') {
      return Fees.fromSnapshot(
        dep.subDependencies.singleWhere((d) => d.name == 'snapshot').value,
      );
    } else
      return null;
  },
  'HolidayData': (dep) {
    if (dep.constructor == '') {
      return HolidayData(
        meta: dep.subDependencies.singleWhere((d) => d.name == 'meta').value,
        response:
            dep.subDependencies.singleWhere((d) => d.name == 'response').value,
      );
    }
    if (dep.constructor == '.fromJson') {
      return HolidayData.fromJson(
        dep.subDependencies.singleWhere((d) => d.name == 'json').value,
      );
    } else
      return null;
  },
  'Meta': (dep) {
    if (dep.constructor == '') {
      return Meta(
        code: dep.subDependencies.singleWhere((d) => d.name == 'code').value,
      );
    }
    if (dep.constructor == '.fromJson') {
      return Meta.fromJson(
        dep.subDependencies.singleWhere((d) => d.name == 'json').value,
      );
    } else
      return null;
  },
  'Response': (dep) {
    if (dep.constructor == '') {
      return Response(
        holidays:
            dep.subDependencies.singleWhere((d) => d.name == 'holidays').value,
      );
    }
    if (dep.constructor == '.fromJson') {
      return Response.fromJson(
        dep.subDependencies.singleWhere((d) => d.name == 'json').value,
      );
    } else
      return null;
  },
  'Holiday': (dep) {
    if (dep.constructor == '') {
      return Holiday(
        name: dep.subDependencies.singleWhere((d) => d.name == 'name').value,
        description: dep.subDependencies
            .singleWhere((d) => d.name == 'description')
            .value,
        date: dep.subDependencies.singleWhere((d) => d.name == 'date').value,
        type: dep.subDependencies.singleWhere((d) => d.name == 'type').value,
        locations:
            dep.subDependencies.singleWhere((d) => d.name == 'locations').value,
        isExpanded: dep.subDependencies
            .singleWhere((d) => d.name == 'isExpanded')
            .value,
      );
    }
    if (dep.constructor == '.fromJson') {
      return Holiday.fromJson(
        dep.subDependencies.singleWhere((d) => d.name == 'json').value,
      );
    } else
      return null;
  },
  'Date': (dep) {
    if (dep.constructor == '') {
      return Date(
        iso: dep.subDependencies.singleWhere((d) => d.name == 'iso').value,
        datetime:
            dep.subDependencies.singleWhere((d) => d.name == 'datetime').value,
        timezone:
            dep.subDependencies.singleWhere((d) => d.name == 'timezone').value,
      );
    }
    if (dep.constructor == '.fromJson') {
      return Date.fromJson(
        dep.subDependencies.singleWhere((d) => d.name == 'json').value,
      );
    } else
      return null;
  },
  'Datetime': (dep) {
    if (dep.constructor == '') {
      return Datetime(
        year: dep.subDependencies.singleWhere((d) => d.name == 'year').value,
        month: dep.subDependencies.singleWhere((d) => d.name == 'month').value,
        day: dep.subDependencies.singleWhere((d) => d.name == 'day').value,
        hour: dep.subDependencies.singleWhere((d) => d.name == 'hour').value,
        minute:
            dep.subDependencies.singleWhere((d) => d.name == 'minute').value,
        second:
            dep.subDependencies.singleWhere((d) => d.name == 'second').value,
      );
    }
    if (dep.constructor == '.fromJson') {
      return Datetime.fromJson(
        dep.subDependencies.singleWhere((d) => d.name == 'json').value,
      );
    } else
      return null;
  },
  'Timezone': (dep) {
    if (dep.constructor == '') {
      return Timezone(
        offset:
            dep.subDependencies.singleWhere((d) => d.name == 'offset').value,
        zoneabb:
            dep.subDependencies.singleWhere((d) => d.name == 'zoneabb').value,
        zoneoffset: dep.subDependencies
            .singleWhere((d) => d.name == 'zoneoffset')
            .value,
        zonedst:
            dep.subDependencies.singleWhere((d) => d.name == 'zonedst').value,
        zonetotaloffset: dep.subDependencies
            .singleWhere((d) => d.name == 'zonetotaloffset')
            .value,
      );
    }
    if (dep.constructor == '.fromJson') {
      return Timezone.fromJson(
        dep.subDependencies.singleWhere((d) => d.name == 'json').value,
      );
    } else
      return null;
  },
  'HolidayItem': (dep) {
    if (dep.constructor == '') {
      return HolidayItem();
    } else
      return null;
  },
  'Classlibrary': (dep) {
    if (dep.constructor == '') {
      return Classlibrary(
        standard:
            dep.subDependencies.singleWhere((d) => d.name == 'standard').value,
        division:
            dep.subDependencies.singleWhere((d) => d.name == 'division').value,
        description: dep.subDependencies
            .singleWhere((d) => d.name == 'description')
            .value,
        day: dep.subDependencies.singleWhere((d) => d.name == 'day').value,
        createdAt:
            dep.subDependencies.singleWhere((d) => d.name == 'createdAt').value,
        by: dep.subDependencies.singleWhere((d) => d.name == 'by').value,
        subjects:
            dep.subDependencies.singleWhere((d) => d.name == 'subjects').value,
      );
    }
    if (dep.constructor == '.fromJson') {
      return Classlibrary.fromJson(
        dep.subDependencies.singleWhere((d) => d.name == 'json').value,
      );
    } else
      return null;
  },
  'Message': (dep) {
    if (dep.constructor == '') {
      return Message(
        to: dep.subDependencies.singleWhere((d) => d.name == 'to').value,
        from: dep.subDependencies.singleWhere((d) => d.name == 'from').value,
        message:
            dep.subDependencies.singleWhere((d) => d.name == 'message').value,
        timeStamp:
            dep.subDependencies.singleWhere((d) => d.name == 'timeStamp').value,
        for_: dep.subDependencies.singleWhere((d) => d.name == 'for_').value,
        readReceipt: dep.subDependencies
            .singleWhere((d) => d.name == 'readReceipt')
            .value,
      );
    }
    if (dep.constructor == '.fromSnapShot') {
      return Message.fromSnapShot(
        dep.subDependencies.singleWhere((d) => d.name == 'snapshot').value,
      );
    }
    if (dep.constructor == '.fromJson') {
      return Message.fromJson(
        dep.subDependencies.singleWhere((d) => d.name == 'json').value,
      );
    } else
      return null;
  },
  'SubscriptionResponse': (dep) {
    if (dep.constructor == '') {
      return SubscriptionResponse(
        responseCode: dep.subDependencies
            .singleWhere((d) => d.name == 'responseCode')
            .value,
        output_ResponseDesc: dep.subDependencies
            .singleWhere((d) => d.name == 'output_ResponseDesc')
            .value,
      );
    }
    if (dep.constructor == '.fromJson') {
      return SubscriptionResponse.fromJson(
        dep.subDependencies.singleWhere((d) => d.name == 'json').value,
      );
    } else
      return null;
  },
  'Subscription': (dep) {
    if (dep.constructor == '') {
      return Subscription(
        amount:
            dep.subDependencies.singleWhere((d) => d.name == 'amount').value,
        itemDesc:
            dep.subDependencies.singleWhere((d) => d.name == 'itemDesc').value,
        msisdn:
            dep.subDependencies.singleWhere((d) => d.name == 'msisdn').value,
        school:
            dep.subDependencies.singleWhere((d) => d.name == 'school').value,
        userId:
            dep.subDependencies.singleWhere((d) => d.name == 'userId').value,
        typeOfSubscription: dep.subDependencies
            .singleWhere((d) => d.name == 'typeOfSubscription')
            .value,
        userName:
            dep.subDependencies.singleWhere((d) => d.name == 'userName').value,
      );
    }
    if (dep.constructor == '.fromJson') {
      return Subscription.fromJson(
        dep.subDependencies.singleWhere((d) => d.name == 'json').value,
      );
    } else
      return null;
  },
  'Question': (dep) {
    if (dep.constructor == '') {
      return Question(
        question:
            dep.subDependencies.singleWhere((d) => d.name == 'question').value,
        answer:
            dep.subDependencies.singleWhere((d) => d.name == 'answer').value,
        type: dep.subDependencies.singleWhere((d) => d.name == 'type').value,
        options:
            dep.subDependencies.singleWhere((d) => d.name == 'options').value,
        id: dep.subDependencies.singleWhere((d) => d.name == 'id').value,
        description: dep.subDependencies
            .singleWhere((d) => d.name == 'description')
            .value,
        questionLevel: dep.subDependencies
            .singleWhere((d) => d.name == 'questionLevel')
            .value,
        standard:
            dep.subDependencies.singleWhere((d) => d.name == 'standard').value,
        subject:
            dep.subDependencies.singleWhere((d) => d.name == 'subject').value,
        by: dep.subDependencies.singleWhere((d) => d.name == 'by').value,
        bySchool:
            dep.subDependencies.singleWhere((d) => d.name == 'bySchool').value,
      );
    } else
      return null;
  },
  'Wall': (dep) {
    if (dep.constructor == '') {
      return Wall(
        schoolName: dep.subDependencies
            .singleWhere((d) => d.name == 'schoolName')
            .value,
        by: dep.subDependencies.singleWhere((d) => d.name == 'by').value,
        forDiv:
            dep.subDependencies.singleWhere((d) => d.name == 'forDiv').value,
        timestamp:
            dep.subDependencies.singleWhere((d) => d.name == 'timestamp').value,
        forClass:
            dep.subDependencies.singleWhere((d) => d.name == 'forClass').value,
        photoUrl:
            dep.subDependencies.singleWhere((d) => d.name == 'photoUrl').value,
        photoPath:
            dep.subDependencies.singleWhere((d) => d.name == 'photoPath').value,
        id: dep.subDependencies.singleWhere((d) => d.name == 'id').value,
        mission:
            dep.subDependencies.singleWhere((d) => d.name == 'mission').value,
        beliefs:
            dep.subDependencies.singleWhere((d) => d.name == 'beliefs').value,
        history:
            dep.subDependencies.singleWhere((d) => d.name == 'history').value,
        regNo: dep.subDependencies.singleWhere((d) => d.name == 'regNo').value,
        location:
            dep.subDependencies.singleWhere((d) => d.name == 'location').value,
        contacts:
            dep.subDependencies.singleWhere((d) => d.name == 'contacts').value,
        dirSms:
            dep.subDependencies.singleWhere((d) => d.name == 'dirSms').value,
        file1: dep.subDependencies.singleWhere((d) => d.name == 'file1').value,
        file2: dep.subDependencies.singleWhere((d) => d.name == 'file2').value,
        file3: dep.subDependencies.singleWhere((d) => d.name == 'file3').value,
        file4: dep.subDependencies.singleWhere((d) => d.name == 'file4').value,
        file5: dep.subDependencies.singleWhere((d) => d.name == 'file5').value,
        file6: dep.subDependencies.singleWhere((d) => d.name == 'file6').value,
        file7: dep.subDependencies.singleWhere((d) => d.name == 'file7').value,
        file8: dep.subDependencies.singleWhere((d) => d.name == 'file8').value,
        file9: dep.subDependencies.singleWhere((d) => d.name == 'file9').value,
        file10:
            dep.subDependencies.singleWhere((d) => d.name == 'file10').value,
      );
    }
    if (dep.constructor == '.fromJson') {
      return Wall.fromJson(
        dep.subDependencies.singleWhere((d) => d.name == 'json').value,
      );
    }
    if (dep.constructor == '.fromSnapshot') {
      return Wall.fromSnapshot(
        dep.subDependencies.singleWhere((d) => d.name == 'snapshot').value,
      );
    } else
      return null;
  },
  'StudentData': (dep) {
    if (dep.constructor == '') {
      return StudentData(
        id: dep.subDependencies.singleWhere((d) => d.name == 'id').value,
        email: dep.subDependencies.singleWhere((d) => d.name == 'email').value,
        parentIds:
            dep.subDependencies.singleWhere((d) => d.name == 'parentIds').value,
      );
    } else
      return null;
  },
  'StudentEntryData': (dep) {
    if (dep.constructor == '') {
      return StudentEntryData(
        email: dep.subDependencies.singleWhere((d) => d.name == 'email').value,
        id: dep.subDependencies.singleWhere((d) => d.name == 'id').value,
        parentId:
            dep.subDependencies.singleWhere((d) => d.name == 'parentId').value,
      );
    }
    if (dep.constructor == '.fromJson') {
      return StudentEntryData.fromJson(
        dep.subDependencies.singleWhere((d) => d.name == 'json').value,
      );
    } else
      return null;
  },
  'StudentEntryDataDb': (dep) {
    if (dep.constructor == '') {
      return StudentEntryDataDb(
        email: dep.subDependencies.singleWhere((d) => d.name == 'email').value,
        id: dep.subDependencies.singleWhere((d) => d.name == 'id').value,
        parentId:
            dep.subDependencies.singleWhere((d) => d.name == 'parentId').value,
      );
    }
    if (dep.constructor == '.fromJson') {
      return StudentEntryDataDb.fromJson(
        dep.subDependencies.singleWhere((d) => d.name == 'json').value,
      );
    } else
      return null;
  },
  'User': (dep) {
    if (dep.constructor == '') {
      return User(
        photoUrl:
            dep.subDependencies.singleWhere((d) => d.name == 'photoUrl').value,
        email: dep.subDependencies.singleWhere((d) => d.name == 'email').value,
        division:
            dep.subDependencies.singleWhere((d) => d.name == 'division').value,
        id: dep.subDependencies.singleWhere((d) => d.name == 'id').value,
        enrollNo:
            dep.subDependencies.singleWhere((d) => d.name == 'enrollNo').value,
        firebaseUuid: dep.subDependencies
            .singleWhere((d) => d.name == 'firebaseUuid')
            .value,
        connection: dep.subDependencies
            .singleWhere((d) => d.name == 'connection')
            .value,
        displayName: dep.subDependencies
            .singleWhere((d) => d.name == 'displayName')
            .value,
        standard:
            dep.subDependencies.singleWhere((d) => d.name == 'standard').value,
        dob: dep.subDependencies.singleWhere((d) => d.name == 'dob').value,
        guardianName: dep.subDependencies
            .singleWhere((d) => d.name == 'guardianName')
            .value,
        bloodGroup: dep.subDependencies
            .singleWhere((d) => d.name == 'bloodGroup')
            .value,
        mobileNo:
            dep.subDependencies.singleWhere((d) => d.name == 'mobileNo').value,
        isTeacher:
            dep.subDependencies.singleWhere((d) => d.name == 'isTeacher').value,
        isVerified: dep.subDependencies
            .singleWhere((d) => d.name == 'isVerified')
            .value,
      );
    }
    if (dep.constructor == '.fromSnapshot') {
      return User.fromSnapshot(
        dep.subDependencies
            .singleWhere((d) => d.name == 'documentSnapshot')
            .value,
      );
    }
    if (dep.constructor == '.fromJson') {
      return User.fromJson(
        dep.subDependencies.singleWhere((d) => d.name == 'json').value,
      );
    } else
      return null;
  },
  'UserDataLogin': (dep) {
    if (dep.constructor == '') {
      return UserDataLogin(
        id: dep.subDependencies.singleWhere((d) => d.name == 'id').value,
        email: dep.subDependencies.singleWhere((d) => d.name == 'email').value,
        isATeacher: dep.subDependencies
            .singleWhere((d) => d.name == 'isATeacher')
            .value,
        childIds:
            dep.subDependencies.singleWhere((d) => d.name == 'childIds').value,
        parentIds:
            dep.subDependencies.singleWhere((d) => d.name == 'parentIds').value,
      );
    } else
      return null;
  },
  'Contribution': (dep) {
    if (dep.constructor == '') {
      return Contribution(
        amount:
            dep.subDependencies.singleWhere((d) => d.name == 'amount').value,
        contributionId: dep.subDependencies
            .singleWhere((d) => d.name == 'contributionId')
            .value,
        studentName: dep.subDependencies
            .singleWhere((d) => d.name == 'studentName')
            .value,
        parentName: dep.subDependencies
            .singleWhere((d) => d.name == 'parentName')
            .value,
        payed: dep.subDependencies.singleWhere((d) => d.name == 'payed').value,
        description: dep.subDependencies
            .singleWhere((d) => d.name == 'description')
            .value,
        startDate:
            dep.subDependencies.singleWhere((d) => d.name == 'startDate').value,
        expireDate: dep.subDependencies
            .singleWhere((d) => d.name == 'expireDate')
            .value,
        targetClass: dep.subDependencies
            .singleWhere((d) => d.name == 'targetClass')
            .value,
      );
    }
    if (dep.constructor == '.fromJson') {
      return Contribution.fromJson(
        dep.subDependencies.singleWhere((d) => d.name == 'json').value,
      );
    } else
      return null;
  },
  'String': (dep) => '',
  'double': (dep) => 0.0,
  'int': (dep) => 0,
  'bool': (dep) => false,
};

final framyEnumMap = <String, List<dynamic>>{
  'MaterialTapTargetSize': MaterialTapTargetSize.values,
  'Locations': Locations.values,
  'Type': Type.values,
};

List<FramyDependencyModel> createSubDependencies(String type,
    [String constructor = '']) {
  switch (type + constructor) {
    case 'Announcement':
      return [
        FramyDependencyModel<String>('caption', 'String', ''),
        FramyDependencyModel<String>('by', 'String', null),
        FramyDependencyModel<String>('forDiv', 'String', null),
        FramyDependencyModel<Timestamp>('timestamp', 'Timestamp', null),
        FramyDependencyModel<String>('forClass', 'String', null),
        FramyDependencyModel<String>('photoUrl', 'String', ''),
        FramyDependencyModel<String>('userId', 'String', ''),
        FramyDependencyModel<String>('photoPath', 'String', ''),
        FramyDependencyModel<AnnouncementType>(
            'type', 'AnnouncementType', null),
        FramyDependencyModel<String>('id', 'String', null),
        FramyDependencyModel<int>('likeCount', 'int', null),
        FramyDependencyModel<List<String>>('likeList', 'List<String>', null),
      ];
    case 'Announcement.fromJson':
      return [
        FramyDependencyModel<Map<String, dynamic>>(
            'json', 'Map<String, dynamic>', null),
      ];
    case 'Announcement.fromSnapshot':
      return [
        FramyDependencyModel<DocumentSnapshot>(
            'snapshot', 'DocumentSnapshot', null),
      ];

    case 'Assignment':
      return [
        FramyDependencyModel<String>('by', 'String', null),
        FramyDependencyModel<String>('title', 'String', null),
        FramyDependencyModel<String>('path', 'String', null),
        FramyDependencyModel<String>('div', 'String', null),
        FramyDependencyModel<String>('subject', 'String', null),
        FramyDependencyModel<String>('standard', 'String', null),
        FramyDependencyModel<Timestamp>('timeStamp', 'Timestamp', null),
        FramyDependencyModel<String>('url', 'String', null),
        FramyDependencyModel<String>('details', 'String', null),
        FramyDependencyModel<String>('id', 'String', null),
      ];
    case 'Assignment.fromJson':
      return [
        FramyDependencyModel<Map<String, dynamic>>(
            'json', 'Map<String, dynamic>', null),
      ];
    case 'Assignment.fromSnapshot':
      return [
        FramyDependencyModel<DocumentSnapshot>(
            'documentSnapshot', 'DocumentSnapshot', null),
      ];

    case 'UserEntryData':
      return [
        FramyDependencyModel<String>('email', 'String', null),
        FramyDependencyModel<String>('id', 'String', null),
        FramyDependencyModel<String>('isATeacher', 'String', null),
        FramyDependencyModel<String>('childIds', 'String', null),
      ];
    case 'UserEntryData.fromJson':
      return [
        FramyDependencyModel<Map<String, dynamic>>(
            'json', 'Map<String, dynamic>', null),
      ];

    case 'UserEntryDataDb':
      return [
        FramyDependencyModel<String>('email', 'String', null),
        FramyDependencyModel<String>('id', 'String', null),
        FramyDependencyModel<bool>('isATeacher', 'bool', null),
        FramyDependencyModel<Map<int, String>>(
            'childId', 'Map<int, String>', null),
      ];
    case 'UserEntryDataDb.fromJson':
      return [
        FramyDependencyModel<Map<String, dynamic>>(
            'json', 'Map<String, dynamic>', null),
      ];

    case 'EBook':
      return [
        FramyDependencyModel<String>('bookId', 'String', null),
        FramyDependencyModel<String>('bookAuthor', 'String', null),
        FramyDependencyModel<String>('bookIsForStandard', 'String', 'N.A'),
        FramyDependencyModel<String>('subject', 'String', 'N.A'),
        FramyDependencyModel<String>('description', 'String', 'N.A'),
        FramyDependencyModel<String>('bookName', 'String', null),
        FramyDependencyModel<String>('imageUrl', 'String', null),
        FramyDependencyModel<String>('pdfUrl', 'String', null),
      ];

    case 'ExamTopic':
      return [
        FramyDependencyModel<String>('description', 'String', null),
        FramyDependencyModel<String>('subject', 'String', null),
        FramyDependencyModel<String>(
            'topicCreatedBySchoolName', 'String', null),
        FramyDependencyModel<String>(
            'topicCreatedByTeacherName', 'String', null),
        FramyDependencyModel<String>('topicCreatedByTeacherId', 'String', null),
        FramyDependencyModel<String>('topicId', 'String', null),
        FramyDependencyModel<String>('topicimageUrl', 'String', null),
        FramyDependencyModel<String>('topicIsForStandard', 'String', null),
        FramyDependencyModel<String>('topicName', 'String', null),
      ];

    case 'Feed':
      return [
        FramyDependencyModel<String>('caption', 'String', null),
        FramyDependencyModel<String>('by', 'String', null),
        FramyDependencyModel<String>('forDiv', 'String', null),
        FramyDependencyModel<String>('forClass', 'String', null),
        FramyDependencyModel<String>('photoUrl', 'String', null),
        FramyDependencyModel<String>('photoPath', 'String', null),
        FramyDependencyModel<AnnouncementType>(
            'type', 'AnnouncementType', null),
        FramyDependencyModel<String>('id', 'String', null),
      ];
    case 'Feed.fromJson':
      return [
        FramyDependencyModel<Map<String, dynamic>>(
            'json', 'Map<String, dynamic>', null),
      ];

    case 'Fees':
      return [
        FramyDependencyModel<String>('description', 'String', ''),
        FramyDependencyModel<String>('due', 'String', null),
        FramyDependencyModel<String>('paid', 'String', null),
        FramyDependencyModel<Timestamp>('timestamp', 'Timestamp', null),
        FramyDependencyModel<String>('to', 'String', null),
        FramyDependencyModel<String>('totalFees', 'String', ''),
        FramyDependencyModel<String>('photoPath', 'String', ''),
        FramyDependencyModel<String>('id', 'String', null),
        FramyDependencyModel<FeesType>('type', 'FeesType', null),
      ];
    case 'Fees.fromJson':
      return [
        FramyDependencyModel<Map<String, dynamic>>(
            'json', 'Map<String, dynamic>', null),
      ];
    case 'Fees.fromSnapshot':
      return [
        FramyDependencyModel<DocumentSnapshot>(
            'snapshot', 'DocumentSnapshot', null),
      ];

    case 'HolidayData':
      return [
        FramyDependencyModel<Meta>('meta', 'Meta', null),
        FramyDependencyModel<Response>('response', 'Response', null),
      ];
    case 'HolidayData.fromJson':
      return [
        FramyDependencyModel<Map<String, dynamic>>(
            'json', 'Map<String, dynamic>', null),
      ];

    case 'Meta':
      return [
        FramyDependencyModel<int>('code', 'int', null),
      ];
    case 'Meta.fromJson':
      return [
        FramyDependencyModel<Map<String, dynamic>>(
            'json', 'Map<String, dynamic>', null),
      ];

    case 'Response':
      return [
        FramyDependencyModel<List<Holiday>>('holidays', 'List<Holiday>', null),
      ];
    case 'Response.fromJson':
      return [
        FramyDependencyModel<Map<String, dynamic>>(
            'json', 'Map<String, dynamic>', null),
      ];

    case 'Holiday':
      return [
        FramyDependencyModel<String>('name', 'String', null),
        FramyDependencyModel<String>('description', 'String', null),
        FramyDependencyModel<Date>('date', 'Date', null),
        FramyDependencyModel<List<Type>>('type', 'List<Type>', null),
        FramyDependencyModel<Locations>('locations', 'Locations', null),
        FramyDependencyModel<bool>('isExpanded', 'bool', false),
      ];
    case 'Holiday.fromJson':
      return [
        FramyDependencyModel<Map<String, dynamic>>(
            'json', 'Map<String, dynamic>', null),
      ];

    case 'Date':
      return [
        FramyDependencyModel<String>('iso', 'String', null),
        FramyDependencyModel<Datetime>('datetime', 'Datetime', null),
        FramyDependencyModel<Timezone>('timezone', 'Timezone', null),
      ];
    case 'Date.fromJson':
      return [
        FramyDependencyModel<Map<String, dynamic>>(
            'json', 'Map<String, dynamic>', null),
      ];

    case 'Datetime':
      return [
        FramyDependencyModel<int>('year', 'int', null),
        FramyDependencyModel<int>('month', 'int', null),
        FramyDependencyModel<int>('day', 'int', null),
        FramyDependencyModel<int>('hour', 'int', null),
        FramyDependencyModel<int>('minute', 'int', null),
        FramyDependencyModel<int>('second', 'int', null),
      ];
    case 'Datetime.fromJson':
      return [
        FramyDependencyModel<Map<String, dynamic>>(
            'json', 'Map<String, dynamic>', null),
      ];

    case 'Timezone':
      return [
        FramyDependencyModel<String>('offset', 'String', null),
        FramyDependencyModel<String>('zoneabb', 'String', null),
        FramyDependencyModel<int>('zoneoffset', 'int', null),
        FramyDependencyModel<int>('zonedst', 'int', null),
        FramyDependencyModel<int>('zonetotaloffset', 'int', null),
      ];
    case 'Timezone.fromJson':
      return [
        FramyDependencyModel<Map<String, dynamic>>(
            'json', 'Map<String, dynamic>', null),
      ];

    case 'HolidayItem':
      return [];

    case 'Classlibrary':
      return [
        FramyDependencyModel<String>('standard', 'String', null),
        FramyDependencyModel<String>('division', 'String', null),
        FramyDependencyModel<String>('description', 'String', null),
        FramyDependencyModel<String>('day', 'String', null),
        FramyDependencyModel<DateTime>('createdAt', 'DateTime', null),
        FramyDependencyModel<String>('by', 'String', null),
        FramyDependencyModel<List<dynamic>>('subjects', 'List<dynamic>', null),
      ];
    case 'Classlibrary.fromJson':
      return [
        FramyDependencyModel<Map<String, dynamic>>(
            'json', 'Map<String, dynamic>', null),
      ];

    case 'Message':
      return [
        FramyDependencyModel<String>('to', 'String', null),
        FramyDependencyModel<String>('from', 'String', null),
        FramyDependencyModel<String>('message', 'String', null),
        FramyDependencyModel<Timestamp>('timeStamp', 'Timestamp', null),
        FramyDependencyModel<String>('for_', 'String', null),
        FramyDependencyModel<bool>('readReceipt', 'bool', null),
      ];
    case 'Message.fromSnapShot':
      return [
        FramyDependencyModel<DocumentSnapshot>(
            'snapshot', 'DocumentSnapshot', null),
      ];
    case 'Message.fromJson':
      return [
        FramyDependencyModel<Map<String, dynamic>>(
            'json', 'Map<String, dynamic>', null),
      ];

    case 'SubscriptionResponse':
      return [
        FramyDependencyModel<String>('responseCode', 'String', null),
        FramyDependencyModel<String>('output_ResponseDesc', 'String', null),
      ];
    case 'SubscriptionResponse.fromJson':
      return [
        FramyDependencyModel<Map<String, dynamic>>(
            'json', 'Map<String, dynamic>', null),
      ];

    case 'Subscription':
      return [
        FramyDependencyModel<String>('amount', 'String', null),
        FramyDependencyModel<String>('itemDesc', 'String', null),
        FramyDependencyModel<String>('msisdn', 'String', null),
        FramyDependencyModel<String>('school', 'String', null),
        FramyDependencyModel<String>('userId', 'String', null),
        FramyDependencyModel<String>('typeOfSubscription', 'String', null),
        FramyDependencyModel<String>('userName', 'String', null),
      ];
    case 'Subscription.fromJson':
      return [
        FramyDependencyModel<Map<String, dynamic>>(
            'json', 'Map<String, dynamic>', null),
      ];

    case 'Question':
      return [
        FramyDependencyModel<String>('question', 'String', null),
        FramyDependencyModel<List<dynamic>>('answer', 'List<dynamic>', null),
        FramyDependencyModel<QuestionType>('type', 'QuestionType', null),
        FramyDependencyModel<List<dynamic>>('options', 'List<dynamic>', null),
        FramyDependencyModel<String>('id', 'String', null),
        FramyDependencyModel<String>('description', 'String', null),
        FramyDependencyModel<QuestionLevel>(
            'questionLevel', 'QuestionLevel', null),
        FramyDependencyModel<String>('standard', 'String', null),
        FramyDependencyModel<String>('subject', 'String', null),
        FramyDependencyModel<String>('by', 'String', null),
        FramyDependencyModel<String>('bySchool', 'String', null),
      ];

    case 'Wall':
      return [
        FramyDependencyModel<String>('schoolName', 'String', ''),
        FramyDependencyModel<String>('by', 'String', null),
        FramyDependencyModel<String>('forDiv', 'String', null),
        FramyDependencyModel<Timestamp>('timestamp', 'Timestamp', null),
        FramyDependencyModel<String>('forClass', 'String', null),
        FramyDependencyModel<String>('photoUrl', 'String', ''),
        FramyDependencyModel<String>('photoPath', 'String', ''),
        FramyDependencyModel<String>('id', 'String', null),
        FramyDependencyModel<String>('mission', 'String', null),
        FramyDependencyModel<String>('beliefs', 'String', null),
        FramyDependencyModel<String>('history', 'String', null),
        FramyDependencyModel<String>('regNo', 'String', null),
        FramyDependencyModel<String>('location', 'String', null),
        FramyDependencyModel<String>('contacts', 'String', null),
        FramyDependencyModel<String>('dirSms', 'String', null),
        FramyDependencyModel<String>('file1', 'String', null),
        FramyDependencyModel<String>('file2', 'String', null),
        FramyDependencyModel<String>('file3', 'String', null),
        FramyDependencyModel<String>('file4', 'String', null),
        FramyDependencyModel<String>('file5', 'String', null),
        FramyDependencyModel<String>('file6', 'String', null),
        FramyDependencyModel<String>('file7', 'String', null),
        FramyDependencyModel<String>('file8', 'String', null),
        FramyDependencyModel<String>('file9', 'String', null),
        FramyDependencyModel<String>('file10', 'String', null),
      ];
    case 'Wall.fromJson':
      return [
        FramyDependencyModel<Map<String, dynamic>>(
            'json', 'Map<String, dynamic>', null),
      ];
    case 'Wall.fromSnapshot':
      return [
        FramyDependencyModel<DocumentSnapshot>(
            'snapshot', 'DocumentSnapshot', null),
      ];

    case 'StudentData':
      return [
        FramyDependencyModel<String>('id', 'String', null),
        FramyDependencyModel<String>('email', 'String', null),
        FramyDependencyModel<Map<dynamic, dynamic>>(
            'parentIds', 'Map<dynamic, dynamic>', null),
      ];

    case 'StudentEntryData':
      return [
        FramyDependencyModel<String>('email', 'String', null),
        FramyDependencyModel<String>('id', 'String', null),
        FramyDependencyModel<String>('parentId', 'String', null),
      ];
    case 'StudentEntryData.fromJson':
      return [
        FramyDependencyModel<Map<String, dynamic>>(
            'json', 'Map<String, dynamic>', null),
      ];

    case 'StudentEntryDataDb':
      return [
        FramyDependencyModel<String>('email', 'String', null),
        FramyDependencyModel<String>('id', 'String', null),
        FramyDependencyModel<Map<int, String>>(
            'parentId', 'Map<int, String>', null),
      ];
    case 'StudentEntryDataDb.fromJson':
      return [
        FramyDependencyModel<Map<String, dynamic>>(
            'json', 'Map<String, dynamic>', null),
      ];

    case 'User':
      return [
        FramyDependencyModel<String>('photoUrl', 'String', 'default'),
        FramyDependencyModel<String>('email', 'String', ''),
        FramyDependencyModel<String>('division', 'String', ''),
        FramyDependencyModel<String>('id', 'String', ''),
        FramyDependencyModel<String>('enrollNo', 'String', ''),
        FramyDependencyModel<String>('firebaseUuid', 'String', ''),
        FramyDependencyModel<dynamic>('connection', 'dynamic', null),
        FramyDependencyModel<String>('displayName', 'String', ''),
        FramyDependencyModel<String>('standard', 'String', ''),
        FramyDependencyModel<String>('dob', 'String', ''),
        FramyDependencyModel<String>('guardianName', 'String', ''),
        FramyDependencyModel<String>('bloodGroup', 'String', ''),
        FramyDependencyModel<String>('mobileNo', 'String', ''),
        FramyDependencyModel<bool>('isTeacher', 'bool', false),
        FramyDependencyModel<bool>('isVerified', 'bool', false),
      ];
    case 'User.fromSnapshot':
      return [
        FramyDependencyModel<DocumentSnapshot>(
            'documentSnapshot', 'DocumentSnapshot', null),
      ];
    case 'User.fromJson':
      return [
        FramyDependencyModel<Map<String, dynamic>>(
            'json', 'Map<String, dynamic>', null),
      ];

    case 'UserDataLogin':
      return [
        FramyDependencyModel<String>('id', 'String', null),
        FramyDependencyModel<String>('email', 'String', null),
        FramyDependencyModel<bool>('isATeacher', 'bool', false),
        FramyDependencyModel<Map<dynamic, dynamic>>(
            'childIds', 'Map<dynamic, dynamic>', null),
        FramyDependencyModel<Map<dynamic, dynamic>>(
            'parentIds', 'Map<dynamic, dynamic>', null),
      ];

    case 'Contribution':
      return [
        FramyDependencyModel<String>('amount', 'String', null),
        FramyDependencyModel<String>('contributionId', 'String', null),
        FramyDependencyModel<String>('studentName', 'String', null),
        FramyDependencyModel<String>('parentName', 'String', null),
        FramyDependencyModel<bool>('payed', 'bool', null),
        FramyDependencyModel<String>('description', 'String', null),
        FramyDependencyModel<String>('startDate', 'String', null),
        FramyDependencyModel<String>('expireDate', 'String', null),
        FramyDependencyModel<String>('targetClass', 'String', null),
      ];
    case 'Contribution.fromJson':
      return [
        FramyDependencyModel<Map<String, dynamic>>(
            'json', 'Map<String, dynamic>', null),
      ];

    default:
      return [];
  }
}

Map<String, List<String>> framyAvailableConstructorNames = {
  'Announcement': ['', '.fromJson', '.fromSnapshot'],
  'Assignment': ['', '.fromJson', '.fromSnapshot'],
  'UserEntryData': ['', '.fromJson'],
  'UserEntryDataDb': ['', '.fromJson'],
  'EBook': [''],
  'ExamTopic': [''],
  'Feed': ['', '.fromJson'],
  'Fees': ['', '.fromJson', '.fromSnapshot'],
  'HolidayData': ['', '.fromJson'],
  'Meta': ['', '.fromJson'],
  'Response': ['', '.fromJson'],
  'Holiday': ['', '.fromJson'],
  'Date': ['', '.fromJson'],
  'Datetime': ['', '.fromJson'],
  'Timezone': ['', '.fromJson'],
  'HolidayItem': [''],
  'Classlibrary': ['', '.fromJson'],
  'Message': ['', '.fromSnapShot', '.fromJson'],
  'SubscriptionResponse': ['', '.fromJson'],
  'Subscription': ['', '.fromJson'],
  'Question': [''],
  'Wall': ['', '.fromJson', '.fromSnapshot'],
  'StudentData': [''],
  'StudentEntryData': ['', '.fromJson'],
  'StudentEntryDataDb': ['', '.fromJson'],
  'User': ['', '.fromSnapshot', '.fromJson'],
  'UserDataLogin': [''],
  'Contribution': ['', '.fromJson'],
};

dynamic getFunctionCallback(FramyDependencyModel dependency) {
  final callbacks = [
    () => dependency.functionCalls.addCall(dependency.name, []),
    (a) => dependency.functionCalls.addCall(dependency.name, [a]),
    (a, b) => dependency.functionCalls.addCall(dependency.name, [a, b]),
    (a, b, c) => dependency.functionCalls.addCall(dependency.name, [a, b, c]),
    (a, b, c, d) =>
        dependency.functionCalls.addCall(dependency.name, [a, b, c, d]),
    (a, b, c, d, e) =>
        dependency.functionCalls.addCall(dependency.name, [a, b, c, d, e]),
    (a, b, c, d, e, f) =>
        dependency.functionCalls.addCall(dependency.name, [a, b, c, d, e, f]),
  ];
  if (dependency.type.contains('()')) {
    return callbacks[0];
  } else {
    return callbacks[','.allMatches(dependency.type).length + 1];
  }
}

Map<String, Map<String, dynamic>> createFramyPresets() => {};
