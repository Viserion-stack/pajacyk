import 'package:flutter/material.dart';
import 'package:pajacyk/presentation/application/theme.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../domain/preference_assistant/preference_assistant.dart';
import '../../application/insets.dart';
import '../../application/pdf_files_https.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  void _launchURL(String url) async {
    // ignore: no_leading_underscores_for_local_identifiers
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.palette.primaryColor,
      body: Column(
        children: [
          Card(
            color: context.palette.primaryColor,
            child:
                Consumer<NotificationNotifier>(builder: (context, notifier, _) {
              return Tooltip(
                message:
                    'Po 24 godzinach od kliknięcia w brzuszek pajacyka, otrzymasz powiadomienie o możliwości kolejnego kliknięcia.',
                verticalOffset: 48,
                preferBelow: true,
                child: SwitchListTile.adaptive(
                  activeColor: context.palette.badgeColor1,
                  secondary: notifier.isNotifi
                      ? Icon(
                          Icons.notifications_on_outlined,
                          color: context.palette.cardColor,
                        )
                      : Icon(
                          Icons.notifications_off_outlined,
                          color: context.palette.cardColor,
                        ),
                  title: notifier.isNotifi
                      ? Text(
                          'Wyłącz powiadomienia',
                          style: TextStyle(
                            fontSize: 18,
                            color: context.palette.cardColor,
                          ),
                        )
                      : Text(
                          'Włącz powiadomienia',
                          style: TextStyle(
                            fontSize: 18,
                            color: context.palette.cardColor,
                          ),
                        ),
                  value: notifier.isNotifi,
                  onChanged: (value) {
                    notifier.toogleNotifi(value);
                  },
                ),
              );
            }),
          ),
          TextButton(
              onPressed: () {
                _launchURL(
                  PdfLauncher.politykaPrywatnosci,
                );
              },
              child: Text(
                'Polityka prywatności',
                style: TextStyle(
                  fontSize: Insets.large,
                  color: context.palette.cardColor,
                ),
              )),
          TextButton(
            onPressed: () {
              _launchURL(PdfLauncher.regulamin);
            },
            child: Text(
              'Regulamin',
              style: TextStyle(
                fontSize: Insets.large,
                color: context.palette.cardColor,
              ),
            ),
          ),
          const Expanded(child: SizedBox()),
          const Text('App ver. 1.0'),
          const SizedBox(
            height: Insets.large,
          )
        ],
      ),
    );
  }
}
