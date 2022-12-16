import 'package:bitirmeweb/widgets/urunlar_widget.dart';
import 'package:flutter/material.dart';

import '../sabitler/sabit.dart';

class urunGrid extends StatelessWidget {
  const urunGrid({Key? key, this.crossAxisCount=4, this.childAspectRatio=1, this.isInMain=true}) : super(key: key);
  final int crossAxisCount;
  final double childAspectRatio;
  final bool isInMain;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount:isInMain ? 4 : 20,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: crossAxisCount,childAspectRatio:childAspectRatio,crossAxisSpacing: defaultPadding ,mainAxisSpacing: defaultPadding),
        itemBuilder:(context,index){
          return ProductWidget();
        });
  }
}

