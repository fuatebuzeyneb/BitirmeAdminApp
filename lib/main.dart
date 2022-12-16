import 'package:bitirmeweb/sabitler/tema_verileri.dart';
import 'package:bitirmeweb/saglayici/siyah_tema_saglayici.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'ekranlar/main_ekran.dart';
import 'iceri_ekranlar/urun_ekle.dart';
import 'kontrolorler/mainkontrol.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
    await themeChangeProvider.darkThemePrefs.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MenuController(),
        ),
        ChangeNotifierProvider(
          create: (_) {
            return themeChangeProvider;
          },
        ),
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Yönetici',
            theme: Styles.themeData(themeProvider.getDarkTheme, context),
            home: const MainScreen(),
            routes: {
              UrunEklemeForm.routeName:(context)=> UrunEklemeForm(),
            },
          );
        },
      ),
    );
  }
}
