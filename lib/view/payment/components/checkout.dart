import 'package:customer_ordering_frontend/utils/constants.dart';
import 'package:flutter/material.dart';
class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  late int totalCost = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("جمع کل :", style: TextStyle(fontFamily: IranSansWeb,fontWeight: FontWeight.bold,fontSize: 30),),
        Text("${totalCost} تومان ")
      ],
    );
  }
}
