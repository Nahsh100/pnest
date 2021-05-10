import 'package:flutter/material.dart';
import 'package:peersnest/helper/utility.dart';
import 'package:peersnest/state/authstate.dart';
import 'package:peersnest/ui_code/pages/profile/profilePage.dart';
import 'package:peersnest/ui_code/theme/theme.dart';
import 'package:peersnest/widgets/customWidgets.dart';
import 'package:provider/provider.dart';

class ProfileImageView extends StatelessWidget {
  const ProfileImageView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<Choice> choices = const <Choice>[
      const Choice(title: 'Share image link', icon: Icons.share),
      const Choice(title: 'Open in browser', icon: Icons.open_in_browser),
      const Choice(title: 'Save', icon: Icons.save),
    ];
    var authstate = Provider.of<AuthState>(context, listen: false);
    return Scaffold(
      backgroundColor: TwitterColor.white,
      appBar: AppBar(
        actions: <Widget>[
          PopupMenuButton<Choice>(
            onSelected: (d) {
              switch (d.title) {
                case "Share image link":
                  Utility.share(authstate.profileUserModel.profilePic);
                  break;
                case "Open in browser":
                  Utility.launchURL(authstate.profileUserModel.profilePic);
                  break;
                case "Save":
                  break;
              }
            },
            itemBuilder: (BuildContext context) {
              return choices.map((Choice choice) {
                return PopupMenuItem<Choice>(
                  value: choice,
                  child: Text(choice.title),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Center(
        child: InteractiveViewer(
          child: Container(
            alignment: Alignment.center,
            width: fullWidth(context),
            // height: fullWidth(context),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: customAdvanceNetworkImage(
                    authstate.profileUserModel.profilePic),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
