import 'package:flutter/material.dart';
import '../../../utils/constants.dart';
import 'orderList.dart';
class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // TODO delete products List
          leading: BackButton(),
          title: Center(child: Text("سبد خرید", style: TextStyle(fontFamily: IranSansWeb, fontWeight: FontWeight.bold, fontSize: 28,),)),
          actions: [ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.delete), label: Text(''),),],
        ),
        body: OrderList(),
      ),
    );
  }
}
