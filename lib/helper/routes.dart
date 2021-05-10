import 'package:flutter/material.dart';
import 'package:peersnest/helper/customRoute.dart';
import 'package:peersnest/ui_code/pages/Auth/forgetPasswordPage.dart';
import 'package:peersnest/ui_code/pages/Auth/selectAuthMethod.dart';
import 'package:peersnest/ui_code/pages/Auth/signIn.dart';
import 'package:peersnest/ui_code/pages/Auth/signup.dart';
import 'package:peersnest/ui_code/pages/Auth/verifyEmail.dart';
import 'package:peersnest/ui_code/pages/common/splash.dart';
import 'package:peersnest/ui_code/pages/feed/composePosts/composepost.dart';
import 'package:peersnest/ui_code/pages/feed/composePosts/state/composepoststate.dart';
import 'package:peersnest/ui_code/pages/feed/feedPostDetail.dart';
import 'package:peersnest/ui_code/pages/feed/imageViewPage.dart';
import 'package:peersnest/ui_code/pages/messages/chatScreenPage.dart';
import 'package:peersnest/ui_code/pages/messages/conversationinformation/conversationinformation.dart';
import 'package:peersnest/ui_code/pages/messages/newMessagePage.dart';
import 'package:peersnest/ui_code/pages/profile/editProfilePage.dart';
import 'package:peersnest/ui_code/pages/profile/follow/followerlistPage.dart';
import 'package:peersnest/ui_code/pages/profile/follow/followinglistpage.dart';
import 'package:peersnest/ui_code/pages/profile/profileImageView.dart';
import 'package:peersnest/ui_code/pages/profile/profilePage.dart';
import 'package:peersnest/ui_code/pages/search/searchpage.dart';
import 'package:peersnest/ui_code/pages/settings/accountSettings/Accessbility/accessibility.dart';
import 'package:peersnest/ui_code/pages/settings/accountSettings/ContentPreference/contentPreference.dart';
import 'package:peersnest/ui_code/pages/settings/accountSettings/ContentPreference/trends/trendsPage.dart';
import 'package:peersnest/ui_code/pages/settings/accountSettings/about/aboutPeersnest.dart';
import 'package:peersnest/ui_code/pages/settings/accountSettings/accountSettingPage.dart';
import 'package:peersnest/ui_code/pages/settings/accountSettings/dataUsage/dataUsagepage.dart';
import 'package:peersnest/ui_code/pages/settings/accountSettings/displaySettings/displayAndSoundPage.dart';
import 'package:peersnest/ui_code/pages/settings/accountSettings/notifications/notificationpage.dart';
import 'package:peersnest/ui_code/pages/settings/accountSettings/privacyAndsafety/directMessage/directmessage.dart';
import 'package:peersnest/ui_code/pages/settings/accountSettings/privacyAndsafety/privacyAndSafetypage.dart';
import 'package:peersnest/ui_code/pages/settings/accountSettings/proxy/proxyPage.dart';
import 'package:peersnest/ui_code/pages/settings/settingsAndPrivacyPage.dart';
import 'package:peersnest/widgets/customWidgets.dart';
import 'package:provider/provider.dart';

class Routes {
  static dynamic route() {
    return {
      'SplashPage': (BuildContext context) => SplashPage(),
    };
  }

  static void sendNavigationEventToFirebase(String path) {
    if (path != null && path.isNotEmpty) {
      // analytics.setCurrentScreen(screenName: path);
    }
  }

  static Route onGenerateRoute(RouteSettings settings) {
    final List<String> pathElements = settings.name.split('/');
    if (pathElements[0] != '' || pathElements.length == 1) {
      return null;
    }
    switch (pathElements[1]) {
      case "ComposePostPage":
        bool isRetweet = false;
        bool isTweet = false;
        if (pathElements.length == 3 && pathElements[2].contains('rePost')) {
          isRetweet = true;
        } else if (pathElements.length == 3 &&
            pathElements[2].contains('Post')) {
          isTweet = true;
        }
        return CustomRoute<bool>(
            builder: (BuildContext context) =>
                ChangeNotifierProvider<ComposeTweetState>(
                  create: (_) => ComposeTweetState(),
                  child:
                      ComposeTweetPage(isRetweet: isRetweet, isTweet: isTweet),
                ));
      case "FeedPostDetail":
        var postId = pathElements[2];
        return SlideLeftRoute<bool>(
            builder: (BuildContext context) => FeedPostDetail(
                  postId: postId,
                ),
            settings: RouteSettings(name: 'FeedPostDetail'));
      case "ProfilePage":
        String profileId;
        if (pathElements.length > 2) {
          profileId = pathElements[2];
        }
        return CustomRoute<bool>(
            builder: (BuildContext context) => ProfilePage(
                  profileId: profileId,
                ));
      case "CreateFeedPage":
        return CustomRoute<bool>(
            builder: (BuildContext context) =>
                ChangeNotifierProvider<ComposeTweetState>(
                  create: (_) => ComposeTweetState(),
                  child: ComposeTweetPage(isRetweet: false, isTweet: true),
                ));
      case "WelcomePage":
        return CustomRoute<bool>(
            builder: (BuildContext context) => WelcomePage());
      case "SignIn":
        return CustomRoute<bool>(builder: (BuildContext context) => SignIn());
      case "SignUp":
        return CustomRoute<bool>(builder: (BuildContext context) => Signup());
      case "ForgetPasswordPage":
        return CustomRoute<bool>(
            builder: (BuildContext context) => ForgetPasswordPage());
      case "SearchPage":
        return CustomRoute<bool>(
            builder: (BuildContext context) => SearchPage());
      case "ImageViewPge":
        return CustomRoute<bool>(
            builder: (BuildContext context) => ImageViewPge());
      case "EditProfile":
        return CustomRoute<bool>(
            builder: (BuildContext context) => EditProfilePage());
      case "ProfileImageView":
        return SlideLeftRoute<bool>(
            builder: (BuildContext context) => ProfileImageView());
      case "ChatScreenPage":
        return CustomRoute<bool>(
            builder: (BuildContext context) => ChatScreenPage());
      case "NewMessagePage":
        return CustomRoute<bool>(
          builder: (BuildContext context) => NewMessagePage(),
        );
      case "SettingsAndPrivacyPage":
        return CustomRoute<bool>(
          builder: (BuildContext context) => SettingsAndPrivacyPage(),
        );
      case "AccountSettingsPage":
        return CustomRoute<bool>(
          builder: (BuildContext context) => AccountSettingsPage(),
        );
      case "AccountSettingsPage":
        return CustomRoute<bool>(
          builder: (BuildContext context) => AccountSettingsPage(),
        );
      case "PrivacyAndSaftyPage":
        return CustomRoute<bool>(
          builder: (BuildContext context) => PrivacyAndSaftyPage(),
        );
      case "NotificationPage":
        return CustomRoute<bool>(
          builder: (BuildContext context) => NotificationPage(),
        );
      case "ContentPrefrencePage":
        return CustomRoute<bool>(
          builder: (BuildContext context) => ContentPrefrencePage(),
        );
      case "DisplayAndSoundPage":
        return CustomRoute<bool>(
          builder: (BuildContext context) => DisplayAndSoundPage(),
        );
      case "DirectMessagesPage":
        return CustomRoute<bool>(
          builder: (BuildContext context) => DirectMessagesPage(),
        );
      case "TrendsPage":
        return CustomRoute<bool>(
          builder: (BuildContext context) => TrendsPage(),
        );
      case "DataUsagePage":
        return CustomRoute<bool>(
          builder: (BuildContext context) => DataUsagePage(),
        );
      case "AccessibilityPage":
        return CustomRoute<bool>(
          builder: (BuildContext context) => AccessibilityPage(),
        );
      case "ProxyPage":
        return CustomRoute<bool>(
          builder: (BuildContext context) => ProxyPage(),
        );
      case "AboutPage":
        return CustomRoute<bool>(
          builder: (BuildContext context) => AboutPage(),
        );
      case "ConversationInformation":
        return CustomRoute<bool>(
          builder: (BuildContext context) => ConversationInformation(),
        );
      case "FollowingListPage":
        return CustomRoute<bool>(
          builder: (BuildContext context) => FollowingListPage(),
        );
      case "FollowerListPage":
        return CustomRoute<bool>(
          builder: (BuildContext context) => FollowerListPage(),
        );
      case "VerifyEmailPage":
        return CustomRoute<bool>(
          builder: (BuildContext context) => VerifyEmailPage(),
        );
      default:
        return onUnknownRoute(RouteSettings(name: '/Feature'));
    }
  }

  static Route onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: customTitleText(settings.name.split('/')[1]),
          centerTitle: true,
        ),
        body: Center(
          child: Text('${settings.name.split('/')[1]} Comming soon..'),
        ),
      ),
    );
  }
}
