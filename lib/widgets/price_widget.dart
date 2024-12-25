import 'package:flutter/material.dart';
import 'package:grocery_app_web_admin_panel/service/ultis.dart';
import 'package:grocery_app_web_admin_panel/widgets/text_widgets.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color color = Ultis(context).color;
    return FittedBox(
      child: Row(
        children: [
          TextWidget(
            title: "1.59\$",
            color: Colors.green,
            textSize: 22,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            "2.59\$",
            style: TextStyle(
              fontSize: 15,
              color: color,
              decoration: TextDecoration.lineThrough,
            ),
          )
        ],
      ),
    );
  }
}
