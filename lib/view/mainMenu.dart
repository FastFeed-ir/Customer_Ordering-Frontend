import 'dart:async';
import 'package:customer_ordering_frontend/model/entity/product.dart';
import 'package:customer_ordering_frontend/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/entity/collection.dart';
import '../model/entity/productRating.dart';
import '../model/entity/storeRating.dart';
import '../view_model/collection_view_model.dart';
import '../view_model/productRating_view_model.dart';
import '../view_model/storeRating_view_model.dart';
import 'categoriesList.dart';
import 'storeDetails.dart';

class MainMenuScreen extends StatefulWidget {
  final int storeId = 4;//= Get.arguments;

  MainMenuScreen();

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  late int storeId;

  late bool gotFromServer = false;

  late List<Collection> collections = [];
  late List<Product> products = [];
  late StoreRatingData storeRatingData = StoreRatingData();
  late ProductRatingData productRatingData = ProductRatingData();
  final _storeRatingViewModel = StoreRatingViewModel();
  final _productRatingViewModel = ProductRatingViewModel();
  final _collectionViewModel = CollectionViewModel();
  @override
  void initState() {
    storeId = widget.storeId;
    loadStoreRating();
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
        return Center(child: Text("در حال اتصال", style: TextStyle(fontFamily: IranSansWeb, fontSize: 24,color: BlackColor, fontWeight: FontWeight.w400,)),);
      } else {
        return loading(14);
      }
    } else {
      return buildMenu();
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: menuAppBar(),
        body: Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.only(top: 5, left: 10, right: 10),
          child: showMenu(),
        ),
      ),
    );
  }
  Widget buildMenu(){
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          StoreDetails(
            storeId: storeId,
            name: storeRatingData.name ?? "فست فید",
            commentCount: storeRatingData.commentCount ?? 0,
            ratingCount: storeRatingData.ratingCount ?? 0,
            averageRating: storeRatingData.averageRating ?? 0,
          ),
          SizedBox(
            height: 10,
          ),
          CategoriesList(
            storeId: storeId,
            collections: collections,
            products: products,
          ),
        ],
      ),
    );
  }

  void loadStoreRating() {
    _storeRatingViewModel.getRatings(storeId);
    storeRatingData = _storeRatingViewModel.storeRatingData;
  }

  void loadProductRating(int productId) {
    _productRatingViewModel.getRatings(productId);
    productRatingData = _productRatingViewModel.productRatingData;
  }

  Future<void> loadFood() async {
    _collectionViewModel.getCollections(storeId);
    _collectionViewModel.getProducts(storeId);
    _collectionViewModel.collections.stream.listen((listCollections) {
      _collectionViewModel.products.stream.listen((listProducts) {
        setState(() {
          collections.addAll(listCollections);
          for (var collection in collections) {
            collection.products = [];
            for (var product in listProducts) {
              if (product.collectionId == collection.id) {
                loadProductRating(product.id!);
                product.rate = productRatingData.averageRating ?? 0;
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
