import 'package:flutter/material.dart';
import 'package:peersnest/helper/utility.dart';
import 'package:peersnest/ui_code/pages/common/splash.dart';
import 'package:peersnest/ui_code/theme/theme.dart';
import 'package:peersnest/widgets/NewWidget/title_text.dart';
import 'package:peersnest/widgets/customWidgets.dart';

class UpdateApp extends StatefulWidget {
  const UpdateApp({Key key}) : super(key: key);

  @override
  _UpdateAppState createState() => _UpdateAppState();
}

class _UpdateAppState extends State<UpdateApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SplashPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TwitterColor.mystic,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/images/icon-480.png"),
            TitleText(
              "New Update is available",
              fontSize: 25,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TitleText(
              "The current version of app is no longer supported. We aploigize for any inconveiience we may have caused you",
              fontSize: 14,
              color: AppColor.darkGrey,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            Container(
              width: fullWidth(context),
              margin: EdgeInsets.symmetric(vertical: 35),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                color: TwitterColor.dodgetBlue,
                onPressed: () {
                  Utility.launchURL(
                      "https://play.google.com/store/apps/details?id=com.thealphamerc.flutter_twitter_clone");
                },
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: TitleText('Update now', color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
