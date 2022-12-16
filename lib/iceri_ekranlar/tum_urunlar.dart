import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bitirmeweb/widgets/grid_urun.dart';
import '../d_m.dart';
import '../hizmetler/araclar.dart';
import '../kontrolorler/mainkontrol.dart';
import '../widgets/ustkisim.dart';
import '../widgets/yan_menu.dart';

class TumUrunlar extends StatefulWidget {
  const TumUrunlar({Key? key}) : super(key: key);

  @override
  State<TumUrunlar> createState() => _TumUrunlarState();
}

class _TumUrunlarState extends State<TumUrunlar> {

  @override
  Widget build(BuildContext context) {
    Size size=Araclar(context).getScreenSize;
    return Scaffold(
      key: context.read<MenuController>().getgridscaffoldKey,
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
                  child: Column(
                    children: [
                      SizedBox(height: 30,),
                      Header(
                        fct: () {
                          context.read<MenuController>().controlProductsMenu();
                        }, title: 'Tüm ürünler',
                      ),
                      SizedBox(height: 40,),
                      Responsive(
                        mobile: urunGrid(
                          isInMain: false,
                          crossAxisCount: size.width <650 ? 2 : 4,
                          childAspectRatio:size.width <650 && size.width >350 ? 1.1 : 0.8,
                        ),

                        desktop: urunGrid(
                          isInMain: false,
                          crossAxisCount: size.width <650 ? 2 : 4,
                          childAspectRatio:size.width <1400 ? 0.8 : 1.05,
                        ),
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

 
