import 'package:bitirmeweb/widgets/siparis_widget.dart';
import 'package:flutter/material.dart';
import '../sabitler/sabit.dart';


class SiparisList extends StatelessWidget {
  const SiparisList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (ctx, index) {
            return Column(
              children: const [
                SiparisWidget(),
                Divider(thickness: 3,),
              ],
            );
          }),
    );
  }
}