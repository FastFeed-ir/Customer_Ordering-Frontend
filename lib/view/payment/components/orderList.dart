import 'package:customer_ordering_frontend/model/entity/order.dart';
import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../../../model/entity/orderItem.dart';
import '../../../utils/constants.dart';
import 'checkout.dart';
import 'explain.dart';
class OrderList extends StatefulWidget {

  const OrderList({super.key});

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  final List<Order> orderList = [
    Order(id: 1,table_number: 5, store: 1,description: "aa"),
  ];
  final List<OrderItem> orderItemList = [
    OrderItem(order: 1,quantity: 2, product: 2, product_title: "کباب", product_unit_price: 20000),
    OrderItem(order: 1,quantity: 3, product: 3, product_title: "پیتزا", product_unit_price: 30000),
    OrderItem(order: 1,quantity: 4, product: 5, product_title: "اسنک", product_unit_price: 40000),
  ];
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: List.generate(orderItemList.length, (index) => Directionality(
            textDirection: TextDirection.ltr,
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: BlackColor,
                  ),
                ),
                color: Colors.yellow,
              ),
              height: 160,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 200,
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FoodCounter(),
                        Text(" ${FoodCounter().counter} تومان ".toPersianDigit(), style: TextStyle(fontFamily: IranSansWeb, fontSize: 16),)
                      ],
                    ),
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              orderItemList[index].product_title!,
                              style: TextStyle(
                                  fontFamily: IranSansWeb,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            // TODO price
                            "${orderItemList[index].product_unit_price}",
                            style: TextStyle(
                              fontFamily: IranSansWeb,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),),
        ),
        Explain(),
        Checkout(),
      ],
    );
  }
}
/*
Directionality(
            textDirection: TextDirection.ltr,
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: BlackColor,
                  ),
                ),
                color: Colors.yellow,
              ),
              height: 160,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 200,
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FoodCounter(),
                        Text(" ${FoodCounter().counter} تومان ".toPersianDigit(), style: TextStyle(fontFamily: IranSansWeb, fontSize: 16),)
                      ],
                    ),
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              orderItemList[index].product_title!,
                              style: TextStyle(
                                  fontFamily: IranSansWeb,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            // TODO price
                            "${orderItemList[index].product_unit_price}",
                            style: TextStyle(
                              fontFamily: IranSansWeb,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
 */
