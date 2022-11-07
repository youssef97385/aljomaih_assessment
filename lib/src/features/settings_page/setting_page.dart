import 'package:aljomaih_assessment/src/core/common/domain/entites/language.dart';
import 'package:aljomaih_assessment/src/core/common/widgets/text_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../app/logic/app_settings.dart';
import '../../app/routes/router.gr.dart';
import '../../core/common/widgets/drop_down_button.dart';
import '../../core/common/widgets/drop_down_form_view.dart';
import '../../injection.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Languages languages = serviceLocator<AppSettings>().languages;
    final Language selectedLanguage =
        serviceLocator<AppSettings>().selectedLanguage;

    return Column(
      children: [
        TextView(
          text: 'Choose language',
          style: Theme.of(context).textTheme.headline2,
        ),
        const SizedBox(
          height: 20,
        ),


        ListTile(
          title: TextView(
            text: "Language".tr(),
            style: Theme.of(context).textTheme.headline2,
          ),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
               Icons.translate_outlined,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
          trailing: DropDownButton<Language>(
            textColor: Theme.of(context).colorScheme.primary,
            semanticLabelValue: selectedLanguage.shortDisplayLabel,
            getLabel: (Language? language) =>
            language?.fullDisplayLabel ?? "",
            options: languages.languagesData,
            value: selectedLanguage,
            onChanged: (Language? language) async {
              final isAlreadySelected =
                  selectedLanguage.id == (language?.id ?? 0);
              if (isAlreadySelected) return;

              final Locale locale = language?.local ?? const  Locale('en', 'US');
              context.setLocale(locale);
              context.router.replaceAll([const SplashAppRouter()]);

            },
          ),
        ),

      ],
    );
  }
}
