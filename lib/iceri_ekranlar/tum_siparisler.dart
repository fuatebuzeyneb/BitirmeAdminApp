import 'package:bitirmeweb/widgets/siparis_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bitirmeweb/widgets/grid_urun.dart';
import '../d_m.dart';
import '../hizmetler/araclar.dart';
import '../kontrolorler/mainkontrol.dart';
import '../widgets/ustkisim.dart';
import '../widgets/yan_menu.dart';

class Tumsiparisler extends StatefulWidget {
  const Tumsiparisler({Key? key}) : super(key: key);

  @override
  State<Tumsiparisler> createState() => _TumsiparislerState();
}

class _TumsiparislerState extends State<Tumsiparisler> {

  @override
  Widget build(BuildContext context) {
    Size size=Araclar(context).getScreenSize;
    return Scaffold(
      key: context.read<MenuController>().getOrderScaffoldKey,
      drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              const Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: SingleChildScrollView(
                controller: ScrollController(),
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Header(
                        fct: () {
                          context.read<MenuController>().controlAllOrder();
                        }, title: 'Tüm siparişler',
                      ),
                     SizedBox(height: 50,),
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: SiparisList(),
                     )
                    ],
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}