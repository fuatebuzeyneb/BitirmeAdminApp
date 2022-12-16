import 'package:bitirmeweb/hizmetler/araclar.dart';
import 'package:bitirmeweb/widgets/test_widget.dart';
import 'package:flutter/material.dart';


class SiparisWidget extends StatefulWidget {
  const SiparisWidget({Key? key}) : super(key: key);

  @override
  _SiparisWidgetState createState() => _SiparisWidgetState();
}

class _SiparisWidgetState extends State<SiparisWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Araclar(context).getTheme;
    Color color = theme == true ? Colors.white : Colors.black;
    Size size = Araclar(context).getScreenSize;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(8.0),
        color: Theme.of(context).cardColor.withOpacity(0.4),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                flex: size.width < 650 ? 3 : 1,
                child: Image.network(
                  'https://www.lifepng.com/wp-content/uploads/2020/11/Mango-png-hd-300x300.png',

                  fit: BoxFit.fill,
                  // height: screenWidth * 0.15,
                  // width: screenWidth * 0.15,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                flex: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: '12x => \₺250.99',
                      color: color,
                      textSize: 16,
                      isTitle: true,
                    ),
                    FittedBox(
                      child: Row(
                        children: [
                          TextWidget(
                            text: 'Alan',
                            color: Colors.blue,
                            textSize: 16,
                            isTitle: true,
                          ),
                          TextWidget(
                            text: '  Fuat E***',
                            color: color,
                            textSize: 14,
                            isTitle: true,
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      '08/12/2022',
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}