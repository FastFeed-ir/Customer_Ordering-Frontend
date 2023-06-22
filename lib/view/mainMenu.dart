import 'dart:async';
import 'package:customer_ordering_frontend/model/entity/product.dart';
import 'package:customer_ordering_frontend/model/repository/socket_service.dart';
import 'package:customer_ordering_frontend/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/entity/collection.dart';
import '../model/entity/productRating.dart';
import '../view_model/collection_view_model.dart';
import '../view_model/productRating_view_model.dart';
import 'categoriesList.dart';
import 'storeDetails.dart';

class MainMenuScreen extends StatefulWidget {
  final int storeId;

  MainMenuScreen({super.key, required this.storeId});

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  late int storeId;

  late bool gotFromServer = false;
  late List<Product> orderProducts = [];
  late List<Product> totalProducts = [];

  late List<Collection> collections = [];
  late List<Product> products = [];
  late SharedPreferences prefs;
  String storeTitle = "";
  double averageRating = 0;
  int commentCount = 0;
  int ratingCount = 0;
  late ProductRatingData productRatingData = ProductRatingData();
  final _productRatingViewModel = ProductRatingViewModel();
  final _collectionViewModel = CollectionViewModel();
  Future<void> x() async {
    prefs = await SharedPreferences.getInstance();
    averageRating = prefs.getDouble("averageRating")!;
    storeTitle = prefs.getString("storeTitle")!;
    commentCount = prefs.getInt("commentCount")!;
    ratingCount = prefs.getInt("ratingCount")!;
  }

  @override
  void initState() {
    super.initState();
    storeId = widget.storeId;

    loadFood().then(
      (_) => Timer(
        const Duration(milliseconds: 2000),
        () {
          setState(
            () {
              gotFromServer = collections.isEmpty && products.isEmpty;
            },
          );
        },
      ),
    );
  }

  Widget showMenu() {
    if (collections.isEmpty && products.isEmpty) {
      if (gotFromServer) {
        return const Center(child: Text("...در حال اتصال", style: TextStyle(fontFamily: IranSansWeb, fontSize: 24,color: BlackColor, fontWeight: FontWeight.w400,)),);
      } else {
        return loading(60);
      }
    } else {
    return buildMenu();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(ScreenUtil().setHeight(70)),
          child: AppBar(
            backgroundColor: RedColor,
            automaticallyImplyLeading: false,
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final double availableWidth = constraints.maxWidth;
                final double availableHeight = constraints.maxHeight;

                final double logoHeight = availableHeight * 0.7;
                final double titleFontSize = availableHeight * 0.12;
                final double backIconSize = availableHeight * 0.25;

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
                          ],
                        ),
                      ],
                    ),
                    Positioned(
                      right: availableWidth * 0.10,
                      top: availableHeight * 0.1,
                      bottom: availableHeight *0.1,
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
        body: Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
            child: showMenu(),
          ),

      ),
    );
  }

  Widget buildMenu() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        StoreDetails(
          storeId: storeId,
          name: storeTitle ,
          commentCount: commentCount,
          ratingCount: ratingCount ,
          averageRating: averageRating,
        ),
         SizedBox(
          height: ScreenUtil().setHeight(5),
        ),
        CategoriesList(
          storeId: storeId,
          collections: collections,
          products: products,
        ),
        SizedBox(
          height: ScreenUtil().setWidth(50),
          width: ScreenUtil().setHeight(360),
          child: ElevatedButton(
            onPressed: () async{
              for (var product in products) {
                if (!orderProducts.contains(product)){
                  orderProducts.add(product);
                }else {
                  int index = orderProducts.indexOf(product);
                  if(orderProducts[index].quantity != product.quantity) {
                    orderProducts[index].quantity += product.quantity;
                  }
                }
              }
              orderProducts.removeWhere((element) => element.quantity == 0);
              if(orderProducts.isEmpty){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('برای تکمیل خرید لطفا یک محصول انتخاب کنید'),
                  ),
                );
                return;
              }
              SocketService.setCode("$storeId");
              SocketService.connectAndListen();
              totalProducts = await Get.toNamed(PaymentPage, arguments: orderProducts);
              if (totalProducts != null) {
                setState(() {
                  if(totalProducts.isEmpty){
                    products.forEach((element) {element.quantity = 0;});
                  }
                  for (var product in totalProducts) {
                    int index = orderProducts.indexOf(product);
                    if (index != -1) {
                      orderProducts[index].quantity = product.quantity;
                    }
                  }
                });
              }
              orderProducts.clear();
            },
            style: buttonStyle_build(5, 5, 10, RedColor),
            child: const Text(
              "تکمیل خرید",
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: IranSansWeb,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> loadFood() async {
    _collectionViewModel.getCollections(storeId);
    _collectionViewModel.getProducts(storeId);
    _collectionViewModel.collections.stream.listen((listCollections) {
      _collectionViewModel.products.stream.listen((listProducts) {
        setState(() async {
          x();
          collections.addAll(listCollections);
          for (var collection in collections) {
            collection.products = [];
            for (var product in listProducts) {
              if (product.collectionId == collection.id) {
                await _productRatingViewModel.getRatings(product.id!);
                var averageRating = _productRatingViewModel.productRatingData.averageRating ?? 0;
                product.rate = averageRating;
                collection.products!.add(product);
                products.add(product);
              }
            }
          }
        });
      });
    });
  }
}
