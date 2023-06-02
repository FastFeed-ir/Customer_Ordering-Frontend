import 'dart:async';
import 'package:customer_ordering_frontend/model/entity/socketData.dart';
import 'package:customer_ordering_frontend/model/repository/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/constants.dart';
import 'package:customer_ordering_frontend/model/entity/order.dart';
import 'package:get/get.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../../../model/entity/orderItem.dart';
import '../../../model/entity/product.dart';
import '../../../view_model/orderItem_view_model.dart';
import '../../../view_model/order_view_model.dart';

class PaymentScreen extends StatefulWidget {
  PaymentScreen({Key? key}) : super(key: key);
  List<Product> products = Get.arguments;
  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late List<OrderItem> orderItems = [];

  late double sum;
  late double totalCost = 0;
  late String explainText = "";
  late int orderId;
  final _orderViewModel = OrderViewModel();
  final _orderItemViewModel = OrderItemViewModel();
  late Order orderServer = Order(tableNumber: 0, store: 0);
  late List<OrderItem> orderItemSever = [];
  @override
  void initState() {

    sum = 0;
    for (var product in widget.products) {
      product.priceCount = (product.quantity ?? 0) * product.unitPrice;
      sum += product.priceCount ?? 0;
    }
    totalCost = sum;
    // TODO put storeID in socket
    super.initState();
  }
  void navigateBackWithData(List<Product> totalProducts) {
    Get.back(result: totalProducts);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:PreferredSize(
          preferredSize: Size.fromHeight(ScreenUtil().setHeight(137)),
          child: AppBar(
            backgroundColor:  RedColor,
            automaticallyImplyLeading: false,
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final double availableWidth = constraints.maxWidth;
                final double availableHeight = constraints.maxHeight;

                final double logoHeight = availableHeight * 0.5;
                final double titleFontSize = availableHeight * 0.12;
                final double backIconSize = availableHeight * 0.10;

                return Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                               WhiteLogo,
                              height: logoHeight,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: availableHeight * 0.05),
                            Text(
                              'سبد خرید',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color:
                                WhiteColor,
                                fontFamily: IranSansWeb,
                                fontSize: titleFontSize,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Positioned(
                      right: availableWidth * 0.10,
                      top: availableHeight * 0.72,
                      child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(Icons.arrow_back_ios,
                            size: backIconSize,
                            color:  WhiteColor),
                      ),
                    ),
                  ],
                );
              },
            ),
            elevation: 0.0,
          ),
        ),
        body: ordering(),
      ),
    );
  }

  Widget ordering() {
    return ListView(
      children: [
        orderItemShow(),
        explain(),
        checkOut(),
        sendOrder(),
      ],
    );
  }

  Widget orderItemShow() {
    return Column(
      children: List.generate(
        widget.products.length,
        (index) {
          final product = widget.products[index];
          return Directionality(
            textDirection: TextDirection.ltr,
            child: Container(
              padding: const EdgeInsets.only(top: 10, right: 30),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: BlackColor,
                  ),
                ),
              ),
              height: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 200,
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        foodCounter(product, index),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              product.title,
                              style: const TextStyle(
                                  fontFamily: IranSansWeb,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Text(
                                "تومان",
                                style: TextStyle(
                                  fontFamily: IranSansWeb,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "${product.unitPrice.round() ?? 0}"
                                    .toPersianDigit()
                                    .seRagham(),
                                style: const TextStyle(
                                  fontFamily: IranSansWeb,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget foodCounter(Product product, int index) {
    return SizedBox(
      height: 100,
      width: 170,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 36,
                height: 36,
                child: ElevatedButton(
                  onPressed: () {
                    setState(
                      () {
                        if (product.quantity > 0) {
                          product.quantity--;
                        }
                        product.priceCount =
                            product.quantity * product.unitPrice;
                        sum = 0;
                        for (var item in widget.products) {
                          sum += item.priceCount ?? 0;
                        }
                        totalCost = sum;
                        widget.products[index].Quantity = product.quantity;
                      },
                    );
                  },
                  style: buttonStyle(5, 5, 10, WhiteColor),
                  child: const Icon(
                    Icons.remove,
                    color: BlackColor,
                  ),
                ),
              ),
              Text(
                '${product.quantity}'.toPersianDigit().seRagham(),
                style: const TextStyle(fontFamily: IranSansWeb, fontSize: 24),
              ),
              SizedBox(
                width: 36,
                height: 36,
                child: ElevatedButton(
                  onPressed: () {
                    setState(
                      () {
                        product.quantity++;
                      },
                    );
                    product.priceCount = product.quantity * product.unitPrice;
                    sum = 0;
                    for (var item in widget.products) {
                      sum += item.priceCount ?? 0;
                    }
                    totalCost = sum;
                    widget.products[index].Quantity = product.quantity;
                  },
                  style: buttonStyle(5, 5, 10, RedColor),
                  child: const Icon(
                    Icons.add,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "تومان",
                style: TextStyle(
                  fontFamily: IranSansWeb,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                '${(product.priceCount?.round() ?? 0)}'
                    .toPersianDigit()
                    .seRagham(),
                style: const TextStyle(fontFamily: IranSansWeb, fontSize: 22),
              ),
            ],
          ),
        ],
      ),
    );
  }

  ButtonStyle buttonStyle(
      double width, double height, double radius, Color color) {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(color),
      elevation: MaterialStateProperty.all<double>(0.0),
      padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
      fixedSize: MaterialStateProperty.all<Size>(
        Size(width, height),
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
          side: const BorderSide(color: BlackColor),
        ),
      ),
    );
  }

  Widget explain() {
    return Container(
      padding: const EdgeInsets.only(top: 20, right: 20),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: BlackColor,
          ),
        ),
      ),
      height: 360,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "توضیحات",
                style: TextStyle(
                    fontFamily: IranSansWeb,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 300,
            height: 200,
            child: TextFormField(
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(20.0),
                labelStyle: TextStyle(color: BlackColor),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: RedColor),
                ),
                hintText: 'توضیحات سفارش خود را اینجا بنویسید',
              ),
              keyboardType: TextInputType.multiline,
              maxLines: 10,
              style: const TextStyle(
                color: BlackColor,
                fontFamily: IranSansWeb,
              ),
              onChanged: (value) {
                setState(() {
                  explainText = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget checkOut() {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      height: 100,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: BlackColor,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "جمع کل :",
            style: TextStyle(
                fontFamily: IranSansWeb,
                fontWeight: FontWeight.bold,
                fontSize: 30),
          ),
          Row(
            children: [
              Text(
                "${totalCost.round()}".toPersianDigit().seRagham(),
                style: const TextStyle(fontFamily: IranSansWeb, fontSize: 26),
              ),
              const SizedBox(
                width: 5,
              ),
              const Text(
                "تومان",
                style: TextStyle(
                  fontFamily: IranSansWeb,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget sendOrder() {
    return Container(
      padding: const EdgeInsets.only(
        top: 10,
        right: 100,
        left: 100,
        bottom: 10,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(
            ScreenUtil().setWidth(360),
            ScreenUtil().setHeight(50),
          ),
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: RedColor,
        ),
        onPressed: () async{
          SharedPreferences prefs=await SharedPreferences.getInstance();
           var storeId=prefs.getInt("StorId");
           var tableNumber=prefs.getInt("table");
          widget.products.removeWhere((element) => element.quantity == 0);
          Order order = Order(store: storeId, tableNumber: tableNumber, description: explainText);
          _orderViewModel.addOrder(order).asStream().listen((event) async {
            orderServer = event;
            orderId = event.id ?? 0;
            await _addOrderItem(orderId);
          });
          await Future.delayed(const Duration(milliseconds: 1000,),);
          SocketData socketData = SocketData(order: orderServer, orderItem: orderItemSever);
          print("order.id: ${socketData.order.id}");
          print("orderItem.id: ${socketData.orderItem[0].id}");
          SocketService.sendOrder(socketData);
          Get.toNamed(SuccessfulPage,arguments: [storeId,socketData.order.authCode]);
        },
        child: const Text(
          "ثبت سفارش",
          style: TextStyle(
            fontFamily: IranSansWeb,
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: WhiteColor,
          ),
        ),
      ),
    );
  }
  Future<void> _addOrderItem(int orderId) async{
    int? product;
    String productTitle;
    double? productUnitPrice;
    int quantity;
    for (var item in widget.products) {
      product = item.id;
      productTitle = item.title;
      productUnitPrice = item.unitPrice;
      quantity = item.quantity;
      OrderItem orderItem = OrderItem(
        product: product,
        quantity: quantity,
        order: orderId,
        productTitle: productTitle,
        productUnitPrice: productUnitPrice,
      );
      orderItems.add(orderItem);
      await _orderItemViewModel.addOrderItem(orderItem).asStream().listen((event) async {
        orderItemSever.add(event);
      });
    }
    await Future.delayed(const Duration(milliseconds: 1000,),);

    widget.products.clear();
  }
}
