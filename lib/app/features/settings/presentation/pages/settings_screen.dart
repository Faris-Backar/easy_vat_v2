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
          context.translate(AppStrings.settings),
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
          itemCount: SettingsData().settingsData(context).length,
          separatorBuilder: (context, index) => SizedBox(
            height: 12,
          ),
          itemBuilder: (context, index) {
            return SettingsListWidget(
              name: SettingsData().settingsData(context)[index].name,
              onTap: context.translate(AppStrings.language) ==
                      SettingsData().settingsData(context)[index].name
                  ? () => _showLanguageBottomSheet(context)
                  : SettingsData().settingsData(context)[index].onTap,
            );
          },
        ),
      ),
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

  void _showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Consumer(
          builder: (context, ref, child) {
            final selectedLanguage = ref.watch(localeProvider);
            return ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5.0),
                topRight: Radius.circular(5.0),
              ),
              child: Container(
                color: context.colorScheme.surface,
                padding: const EdgeInsets.all(20.0),
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Text(context.translate(AppStrings.selectLanguage),
                          style: context.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: ListTile(
                        leading: Icon(
                          Icons.language,
                          color: selectedLanguage.languageCode == 'en'
                              ? context.colorScheme.primary
                              : Colors.grey,
                        ),
                        title: Text(
                          'English',
                          style: context.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: selectedLanguage.languageCode == 'en'
                                  ? context.colorScheme.primary
                                  : context.defaultTextColor),
                        ),
                        onTap: () {
                          ref.read(localeProvider.notifier).setLocale('en');
                          Navigator.pop(context);
                        },
                        selected: selectedLanguage.languageCode == 'en',
                      ),
                    ),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: ListTile(
                        leading: Icon(Icons.language,
                            color: selectedLanguage.languageCode == 'ar'
                                ? context.colorScheme.primary
                                : Colors.grey),
                        title: Text(
                          'العربية',
                          style: context.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: selectedLanguage.languageCode == 'ar'
                                  ? context.colorScheme.primary
                                  : context.defaultTextColor),
                        ),
                        onTap: () {
                          ref.read(localeProvider.notifier).setLocale('ar');
                          context.router.popForced();
                        },
                        selected: selectedLanguage.languageCode == 'ar',
                      ),
                    ),
                    const Divider(),
                  ],
                ),
              ),
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
    bool isRtl = Directionality.of(context) == TextDirection.rtl;
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
                icon:
                    isRtl ? Assets.icons.arrowBack : Assets.icons.arrowForward,
                color: context.defaultTextColor)
          ],
        ),
      ),
    );
  }
}
