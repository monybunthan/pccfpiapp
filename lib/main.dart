// ignore_for_file: unused_import, duplicate_ignore, depend_on_referenced_packages, prefer_const_declarations, use_key_in_widget_constructors, prefer_const_constructors, deprecated_member_use, duplicate_import, avoid_print
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:pccfpi/provider/provider_page.dart';
import 'package:pccfpi/model/google_sign_in.dart';
import 'package:pccfpi/provider/locale_provider.dart';
import 'package:pccfpi/screen/widget/google_sheet/googlesheets.dart';
import 'package:pccfpi/screen/widget/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_test/flutter_test.dart';
import 'l10n/l10n.dart';
import 'screen/signup_page.dart';
//translate
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'screen/widget/page_view/page_two.dart';
import 'screen/widget/theme/drawerz.dart';

import 'package:flutter/material.dart';
import 'package:native_notify/native_notify.dart';

AppOpenAd? openAd;

Future<void> loadAd() async {
  await AppOpenAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/3419835294',
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(onAdLoaded: (ad) {
        print('ad is loaded');
        openAd = ad;
        // openAd!.show();
      }, onAdFailedToLoad: (error) {
        print('ad failed to load $error');
      }),
      orientation: AppOpenAd.orientationPortrait);
}

void showAd() {
  if (openAd == null) {
    print('trying tto show before loading');
    loadAd();
    return;
  }

  openAd!.fullScreenContentCallback =
      FullScreenContentCallback(onAdShowedFullScreenContent: (ad) {
    print('onAdShowedFullScreenContent');
  }, onAdFailedToShowFullScreenContent: (ad, error) {
    ad.dispose();
    print('failed to load $error');
    openAd = null;
    loadAd();
  }, onAdDismissedFullScreenContent: (ad) {
    ad.dispose();
    print('dismissed');
    openAd = null;
    loadAd();
  });

  openAd!.show();
}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await MobileAds.instance.initialize();

  await loadAd();

  NativeNotify.initialize(
      1930,
      '3dTBs9Ub84KgrPtGBR7sWV',
      'AAAAeJQWxgM:APA91bEuNV7Df9MKz0VXJh13rGyxuquQ6YbF1fnmUQh0PVqLXr2uxUvTnKzHvZpairqzh8pERI6p2PmA_QmgIyZaa-7NmEBKdqCNgzYhv3QyTyR-sXGRAV8TD1TDF4-A8x6nLzmcM8Hw',
      null);
  await Firebase.initializeApp();
  await SheetsFlutter.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'MainPage';

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,

          // themeMode: ThemeMode.system,
          // theme: MyThemes.lightTheme,
          // darkTheme: MyThemes.darkTheme,

          // supportedLocales: L10n.all,
          // ignore: prefer_const_literals_to_create_immutables
          // localizationsDelegates: [
          //   AppLocalizations.delegate,
          //   GlobalMaterialLocalizations.delegate,
          //   GlobalCupertinoLocalizations.delegate,
          //   GlobalWidgetsLocalizations.delegate,
          // ],
          color: Colors.white,

          home: Homepage(),
        ),
      );
}
