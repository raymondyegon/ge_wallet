import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ge_wallet/features/app/app_tabs.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light, //Android
          statusBarBrightness: Brightness.light, //iOS
        ),
        child: MaterialApp(
          title: 'Waves Wallet',
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaleFactor: 1.0,
            ),
            child: child!,
          ),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const AppTabs(),
        ),
      );
}
