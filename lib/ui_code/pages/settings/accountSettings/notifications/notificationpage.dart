import 'package:flutter/material.dart';
import 'package:peersnest/model/user.dart';
import 'package:peersnest/state/authstate.dart';
import 'package:peersnest/ui_code/pages/settings/widgets/headerWidget.dart';
import 'package:peersnest/ui_code/pages/settings/widgets/settingsAppbar.dart';
import 'package:peersnest/ui_code/pages/settings/widgets/settingsRowWidget.dart';
import 'package:peersnest/ui_code/theme/theme.dart';
import 'package:provider/provider.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key key, GlobalKey<ScaffoldState> scaffoldKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<AuthState>(context).userModel ?? UserModel();
    return Scaffold(
      backgroundColor: TwitterColor.white,
      appBar: SettingsAppBar(
        title: 'Notifications',
        subtitle: user.userName,
      ),
      body: ListView(
        children: <Widget>[
          HeaderWidget('Filters'),
          SettingRowWidget(
            "Quality filter",
            showCheckBox: true,
            subtitle:
                'Filter lower-quality from your notifications. This won\'t filter out notifications from people you follow or account you\'ve inteacted with recently.',
            // navigateTo: 'AccountSettingsPage',
          ),
          Divider(height: 0),
          SettingRowWidget("Advanced filter"),
          SettingRowWidget("Muted word"),
          HeaderWidget(
            'Preferences',
            secondHeader: true,
          ),
          SettingRowWidget(
            "Unread notification count badge",
            showCheckBox: false,
            subtitle:
                'Display a badge with the number of notifications waiting for you inside the Fwitter app.',
          ),
          SettingRowWidget("Push notifications"),
          SettingRowWidget("SMS notifications"),
          SettingRowWidget(
            "Email notifications",
            subtitle: 'Control when how often Fwitter sends emails to you.',
          ),
        ],
      ),
    );
  }
}
