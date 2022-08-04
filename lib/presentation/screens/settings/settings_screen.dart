import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pajacyk/presentation/application/theme.dart';
import 'package:pajacyk/presentation/common/laucher_url.dart';
import 'package:pajacyk/presentation/screens/settings/bloc/settings_bloc.dart';
import '../../application/insets.dart';
import '../../application/pdf_files_https.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  static const String routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) => Scaffold(
        backgroundColor: context.palette.primaryColor,
        body: Column(
          children: [
            Card(
              color: context.palette.primaryColor,
              child: Tooltip(
                message:
                    'Po 24 godzinach od kliknięcia w brzuszek pajacyka, otrzymasz powiadomienie o możliwości kolejnego kliknięcia.',
                verticalOffset: 48,
                preferBelow: true,
                child: SwitchListTile.adaptive(
                  activeColor: context.palette.badgeColor1,
                  secondary: state.isNotifOn
                      ? Icon(
                          Icons.notifications_on_outlined,
                          color: context.palette.cardColor,
                        )
                      : Icon(
                          Icons.notifications_off_outlined,
                          color: context.palette.cardColor,
                        ),
                  title: state.isNotifOn
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
                  value: state.isNotifOn,
                  onChanged: (value) {
                    context.read<SettingsBloc>().add(ChangeStatusNotification(statusNotification: value));
                  },
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  launchURL(PdfLauncher.politykaPrywatnosci);
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
                launchURL(PdfLauncher.regulamin);
              },
              child: Text(
                'Regulamin',
                style: TextStyle(
                  fontSize: Insets.large,
                  color: context.palette.cardColor,
                ),
              ),
            ),
            Expanded(child: SizedBox()),
            Text('App ver. 1.0'),
            SizedBox(
              height: Insets.large,
            )
          ],
        ),
      ),
    );
  }
}
