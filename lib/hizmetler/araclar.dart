import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../saglayici/siyah_tema_saglayici.dart';

class Araclar {
  BuildContext context;
  Araclar(this.context);

  bool get getTheme => Provider.of<DarkThemeProvider>(context).getDarkTheme;
  Color get color => getTheme ? Colors.white : Colors.black;
  Size get getScreenSize => MediaQuery.of(context).size;

}