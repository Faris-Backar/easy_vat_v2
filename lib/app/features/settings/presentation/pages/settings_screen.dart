import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/features/settings/data/settings_data.dart';
import 'package:easy_vat_v2/app/features/settings/presentation/notifiers/locale_notifiers.dart';
import 'package:easy_vat_v2/app/features/settings/presentation/notifiers/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:easy_vat_v2/app/core/localization/app_strings.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.settings,
        ),
        titleTextStyle: TextStyle(
            color: context.colorScheme.primaryContainer.withValues(alpha: .5),
            fontSize: 20.0,
            fontWeight: FontWeight.w700),
        actions: [
          Consumer(builder: (context, ref, child) {
            final themeProvider = ref.watch(themeNotifierProvider.notifier);
            final state = ref.watch(themeNotifierProvider);
            return IconButton(
                onPressed: () {
                  themeProvider.toggleTheme();
                },
                icon: setThemeMode(context, state));
          })
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: ListView.separated(
            itemCount: SettingsData().settingsData.length +
                1, // Added 1 for language option
            separatorBuilder: (context, index) => SizedBox(
              height: 12,
            ),
            itemBuilder: (context, index) {
              if (index == SettingsData().settingsData.length) {
                return SettingsListWidget(
                  name: 'Language', // Language option
                  onTap: () {
                    // Open Bottom Sheet for language selection
                    _showLanguageBottomSheet(context);
                  },
                );
              } else {
                return SettingsListWidget(
                  name: SettingsData().settingsData[index].name,
                  onTap: SettingsData().settingsData[index].onTap,
                );
              }
            },
          )),
    );
  }

  Widget setThemeMode(BuildContext context, ThemeMode themeMode) {
    if (themeMode == ThemeMode.system) {
      final brightness = MediaQuery.of(context).platformBrightness;
      return brightness == Brightness.dark
          ? Icon(Icons.dark_mode_rounded)
          : Icon(Icons.light_mode_rounded);
    } else if (themeMode == ThemeMode.light) {
      return Icon(Icons.light_mode_rounded);
    } else {
      return Icon(Icons.dark_mode_rounded);
    }
  }

  // Show Bottom Modal Sheet for Language Selection
  void _showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Consumer(
          builder: (context, ref, child) {
            final selectedLanguage = ref.watch(localeProvider);
            return ListView(
              children: [
                ListTile(
                  title: Text('English'),
                  onTap: () {
                    ref.read(localeProvider.notifier).setLocale('en');
                    Navigator.pop(context);
                  },
                  selected: selectedLanguage.languageCode == 'en',
                ),
                ListTile(
                  title: Text('Arabic'),
                  onTap: () {
                    ref.read(localeProvider.notifier).setLocale('ar');
                    context.router.popForced();
                  },
                  selected: selectedLanguage.languageCode == 'ar',
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class SettingsListWidget extends StatelessWidget {
  final String name;
  final VoidCallback onTap;
  const SettingsListWidget({
    super.key,
    required this.name,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15),
        decoration: BoxDecoration(
          color: context.colorScheme.surfaceBright,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
                blurRadius: 1.0, color: Colors.grey.withValues(alpha: .2)),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name),
            SvgIcon(
                icon: Assets.icons.arrowForward,
                color: context.colorScheme.onPrimary)
          ],
        ),
      ),
    );
  }
}
