import 'package:flutter/material.dart';
import 'package:peersnest/model/user.dart';
import 'package:peersnest/state/authstate.dart';
import 'package:peersnest/ui_code/pages/settings/widgets/headerWidget.dart';
import 'package:peersnest/ui_code/pages/settings/widgets/settingsRowWidget.dart';
import 'package:peersnest/ui_code/theme/theme.dart';
import 'package:peersnest/widgets/customAppBar.dart';
import 'package:peersnest/widgets/customWidgets.dart';
import 'package:provider/provider.dart';

class SettingsAndPrivacyPage extends StatelessWidget {
  const SettingsAndPrivacyPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<AuthState>(context).userModel ?? UserModel();
    return Scaffold(
      backgroundColor: TwitterColor.white,
      appBar: CustomAppBar(
        isBackButton: true,
        title: customTitleText(
          'Settings and privacy',
        ),
      ),
      body: ListView(
        children: <Widget>[
          HeaderWidget(user.userName),
          SettingRowWidget(
            "Account",
            navigateTo: 'AccountSettingsPage',
          ),
          Divider(height: 0),
          SettingRowWidget("Privacy and Policy",
              navigateTo: 'PrivacyAndSaftyPage'),
          SettingRowWidget("Notification", navigateTo: 'NotificationPage'),
          SettingRowWidget("Content prefrences",
              navigateTo: 'ContentPrefrencePage'),
          HeaderWidget(
            'General',
            secondHeader: true,
          ),
          SettingRowWidget("Display and Sound",
              navigateTo: 'DisplayAndSoundPage'),
          SettingRowWidget("Data usage", navigateTo: 'DataUsagePage'),
          SettingRowWidget("Accessibility", navigateTo: 'AccessibilityPage'),
          SettingRowWidget("Proxy", navigateTo: "ProxyPage"),
          SettingRowWidget(
            "About Fwitter",
            navigateTo: "AboutPage",
          ),
          SettingRowWidget(
            null,
            showDivider: false,
            vPadding: 10,
            subtitle:
                'These settings affect all of your Fwitter accounts on this devce.',
          )
        ],
      ),
    );
  }
}
