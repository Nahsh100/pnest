import 'package:flutter/material.dart';
import 'package:peersnest/ui_code/pages/settings/widgets/settingsRowWidget.dart';
import 'package:peersnest/ui_code/theme/theme.dart';
import 'package:peersnest/widgets/customAppBar.dart';
import 'package:peersnest/widgets/customWidgets.dart';

class ProxyPage extends StatelessWidget {
  const ProxyPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TwitterColor.white,
      appBar: CustomAppBar(
        isBackButton: true,
        title: customTitleText(
          'Proxy',
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          SettingRowWidget(
            "Enable HTTP Proxy",
            showCheckBox: false,
            vPadding: 15,
            showDivider: true,
            subtitle:
                'Configure HTTP proxy for network request (note: this does not apply to browser).',
          ),
          SettingRowWidget(
            "Proxy Host",
            subtitle: 'Configure your proxy\'s hostname.',
            showDivider: true,
          ),
          SettingRowWidget(
            "Proxy Port",
            subtitle: 'Configure your proxy\'s port number.',
          ),
        ],
      ),
    );
  }
}
