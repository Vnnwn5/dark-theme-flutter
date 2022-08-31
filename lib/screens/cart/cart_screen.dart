import 'package:flutter/material.dart';
import 'package:store/screens/cart/cart_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (ctx, index){
            return const CartWidget();
          }),
    );
  }
}