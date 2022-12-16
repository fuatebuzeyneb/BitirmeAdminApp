import 'package:flutter/material.dart';

import '../widgets/test_widget.dart';



class DisFonk{
  static navigateTo({required BuildContext ctx , required String routeName}){
    Navigator.pushNamed(ctx, routeName);
  }
  static Future<void> bildirimDialog(
      {
        required String title,required String subtitle,required Function fct,required BuildContext context
      }
      ) async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(children: [
              Image.asset(
                'assets/images/exit.png',
                height: 20,
                width: 20,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                width: 8,
              ),

              Text(title),
            ]),
            content:  Text(subtitle),
            actions: [
              TextButton(
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                child: TextWidget(
                  color: Colors.cyan,
                  text: 'iptal',
                  textSize: 18,
                ),
              ),
              TextButton(
                onPressed: () {
                  fct();
                },
                child: TextWidget(
                  color: Colors.red,
                  text: 'Evet',
                  textSize: 18,
                ),
              ),
            ],
          );
        });
  }
}