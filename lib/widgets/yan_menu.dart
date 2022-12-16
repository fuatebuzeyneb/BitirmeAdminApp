import 'package:bitirmeweb/hizmetler/araclar.dart';
import 'package:bitirmeweb/iceri_ekranlar/tum_siparisler.dart';
import 'package:bitirmeweb/iceri_ekranlar/tum_urunlar.dart';
import 'package:bitirmeweb/widgets/test_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../ekranlar/main_ekran.dart';
import '../saglayici/siyah_tema_saglayici.dart';
import 'package:iconly/iconly.dart';


class SideMenu extends StatefulWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    final theme = Araclar(context).getTheme;
    final themeState = Provider.of<DarkThemeProvider>(context);

    final color = Araclar(context).color;
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset(
              "assets/images/mainfoto.png",
            ),
            //Icon(Icons.food_bank,size: 150,color: Colors.greenAccent,),
          ),
          //Image.asset('assets/images/groceries.png'),
          DrawerListTile(
            title: "Anasayfa",
            press: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const MainScreen(),
                ),
              );
            },
            icon: Icons.home_filled,
          ),
          DrawerListTile(
            title: "Tüm Ürünler Göster",
            press: () {
             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> TumUrunlar()));
            },
            icon: Icons.store,
          ),
          DrawerListTile(
            title: "Tüm Siparişler Göster",
            press: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Tumsiparisler()));
            },
            icon: IconlyBold.bag_2,
          ),
          SwitchListTile(
              title: const Text('Gözmodu'),
              secondary: Icon(themeState.getDarkTheme
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined),
              value: theme,
              onChanged: (value) {
                setState(() {
                  themeState.setDarkTheme = value;
                });
              })
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.press,
    required this.icon,
  }) : super(key: key);

  final String title;
  final VoidCallback press;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    final theme = Araclar(context).getTheme;
    final color = theme == true ? Colors.white : Colors.black;

    return ListTile(
        onTap: press,
        horizontalTitleGap: 0.0,
        leading: Icon(
          icon,
          size: 18,
        ),
        title: TextWidget(
          text: title,
          color: color, textSize: 20,
        ));
  }
}