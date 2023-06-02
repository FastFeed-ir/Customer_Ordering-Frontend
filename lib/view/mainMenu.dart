import 'dart:async';
import 'package:customer_ordering_frontend/model/entity/product.dart';
import 'package:customer_ordering_frontend/utils/constants.dart';
import 'package:flutter/material.dart';
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
        const Duration(milliseconds: 500),
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
        return const Center(child: Text("در حال اتصال", style: TextStyle(fontFamily: IranSansWeb, fontSize: 24,color: BlackColor, fontWeight: FontWeight.w400,)),);
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
        appBar: AppBarMenu(),
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
        const SizedBox(
          height: 10,
        ),
        CategoriesList(
          storeId: storeId,
          collections: collections,
          products: products,
        ),        SizedBox(
          height: 50,
          width: 360,
          child: ElevatedButton(
            onPressed: () {
              for (var product in products) {
                orderProducts.add(product);
              }
              orderProducts.removeWhere((element) => element.quantity == 0);
              totalProducts = orderProducts;
              //totalProducts.forEach((element) {print("${element.title}\t${element.quantity}");});
              print(orderProducts.length);
              orderProducts.clear();
              //Get.toNamed(PaymentPage, arguments: totalProducts);
              // print
            },
            child: Text(
              "تکمیل خرید",
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: IranSansWeb,
                  fontWeight: FontWeight.bold),
            ),
            style: buttonStyle_build(5, 5, 10, RedColor),
          ),
        ),
      ],
    );
  }

  void loadProductRating(int productId) {
    _productRatingViewModel.getRatings(productId);
    var productRatingData = _productRatingViewModel.productRatingData;
  }

  Future<void> loadFood() async {
    _collectionViewModel.getCollections(storeId);
    _collectionViewModel.getProducts(storeId);
    _collectionViewModel.collections.stream.listen((listCollections) {
      _collectionViewModel.products.stream.listen((listProducts) {
        setState(() {
          x();
          collections.addAll(listCollections);
          for (var collection in collections) {
            collection.products = [];
            for (var product in listProducts) {
              if (product.collectionId == collection.id) {
                print(product.id!);
                _productRatingViewModel.getRatings(product.id!);
                // var avrageRate =_productRatingViewModel.productRatingData.averageRating;
                // print(avrageRate)
                product.rate =
                    // avrageRate??
                        0;
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
