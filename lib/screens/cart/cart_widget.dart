import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/widgets/text_widget.dart';

import '../../services/utils.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({Key? key}) : super(key: key);

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return GestureDetector(
      onTap: (){},
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Container(
                    height: size.width*0.25,
                    width: size.width*0.25 ,
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                     ),
                    child: FancyShimmerImage(
                      imageUrl: 'https://i.ibb.co/F0s3FHQ/Apricots.png',
                      boxFit: BoxFit.fill,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: 'Title',
                        color: color,
                        textSize: 20,
                        isTitle: true,
                      ),
                      const SizedBox(height: 16.0,
                      ),
                      SizedBox(
                        width: size.width*0.3,
                        child: Row(
                          children: [
                            _quantityController(
                              fct: (){},
                              color: Colors.red,
                              icon: CupertinoIcons.minus,
                            ),
                            _quantityController(
                              fct: (){},
                              color: Colors.green,
                              icon: CupertinoIcons.plus,
                            ),
                        ],),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _quantityController ({
    required Function fct,
    required IconData icon,
    required  Color color,
  }){
    return Flexible(
      flex:2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Material(
          color: color,
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: (){
              fct();
            },
            child:   Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                  icon,
                  color: Colors.white
              ),
            ),
          ),
        ),
      ),
    );
  }
}
