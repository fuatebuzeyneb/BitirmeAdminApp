import 'package:bitirmeweb/d_m.dart';
import 'package:bitirmeweb/hizmetler/araclar.dart';
import 'package:bitirmeweb/iceri_ekranlar/urun_ekle.dart';
import 'package:bitirmeweb/widgets/btnlar.dart';
import 'package:bitirmeweb/widgets/grid_urun.dart';
import 'package:bitirmeweb/widgets/siparis_list.dart';
import 'package:bitirmeweb/widgets/test_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../hizmetler/dis_fonk.dart';
import '../kontrolorler/mainkontrol.dart';
import '../sabitler/sabit.dart';
import '../widgets/ustkisim.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=Araclar(context).getScreenSize;
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(
              fct: () {
                context.read<MenuController>().controlDashboarkMenu();
              }, title: 'Anasyfa',
            ),
            //TextWidget(text: 'En Son Ürünler', color: Colors.blueGrey, textSize: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ButtonsWidget(onPressed: (){}, text: 'Tüm Göster', icon: Icons.store, backgroundColor: Colors.blue),
                  Spacer(),
                  ButtonsWidget(onPressed: (){
                    DisFonk.navigateTo(ctx: context, routeName: UrunEklemeForm.routeName);
                  }, text: 'Ürün Ekle', icon: Icons.add, backgroundColor: Colors.blue)
                ],
              ),
            ),
            const SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                 // flex: 5,
                  child: Column(
                    children:  [
                      Responsive(
                          mobile: urunGrid(
                              crossAxisCount: size.width <650 ? 2 : 4,
                              childAspectRatio:size.width <650 && size.width >350 ? 1.1 : 0.8,
                          ),

                          desktop: urunGrid(
                            crossAxisCount: size.width <650 ? 2 : 4,
                            childAspectRatio:size.width <1400 ? 0.8 : 1.05,
                          ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 15,),
            Row(
              children: [
                TextWidget(text: 'Siparişler', color: Colors.blue, textSize: 20,isTitle: true,),
              ],
            ),
            SizedBox(height: 15,),
            SiparisList(),
          ],
        ),
      ),
    );
  }
}
