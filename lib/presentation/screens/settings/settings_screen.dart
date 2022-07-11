import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/preference_assistant/preference_assistant.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.green[500],
      body: Column(
        children: [
          Card(
            child:
                Consumer<NotificationNotifier>(builder: (context, notifier, _) {
              return Tooltip(
                message:
                    'Po 24 godzinach od kliknięcia w brzuszek pajacyka, otrzymasz powiadomienie o możliwości kolejnego kliknięcia.',
                verticalOffset: 48,
                preferBelow: true,
                child: SwitchListTile.adaptive(
                  secondary: notifier.isNotifi
                      ? Icon(
                          Icons.notifications_on_outlined,
                          color: Colors.green[500],
                        )
                      : Icon(
                          Icons.notifications_off_outlined,
                          color: Colors.green[500],
                        ),
                  title: notifier.isNotifi
                      ? const Text(
                          'Wyłącz powiadomienia',
                          style: TextStyle(fontSize: 18),
                        )
                      : Text(
                          'Włącz powiadomienia',
                          style: TextStyle(fontSize: 18),
                        ),
                  value: notifier.isNotifi,
                  onChanged: (value) {
                    notifier.toogleNotifi(value);
                  },
                ),
              );
            }),
          ),
          Text('App ver. 1.0')
        ],
      ),
    );
  }
}
