import 'dart:async';

import 'package:customer_ordering_frontend/utils/constants.dart';
import 'package:flutter/material.dart';
import '../model/entity/collection.dart';
import '../model/entity/productRating.dart';
import '../model/entity/storeRating.dart';
import '../view_model/collection_view_model.dart';
import '../view_model/productRating_view_model.dart';
import '../view_model/storeRating_view_model.dart';
import 'categoriesList.dart';
import 'storeDetails.dart';

class MainMenuScreen extends StatefulWidget {
  late int storeId ;

  MainMenuScreen({required this.storeId});

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {

  late int storeId ;
  late bool gotFromServer = false;
  
  late List<Collection> collections = [];
  
  late StoreRatingData storeRatingData = StoreRatingData();
  late ProductRatingData productRatingData = ProductRatingData();
  final _storeRatingViewModel = StoreRatingViewModel();
  final _productRatingViewModel = ProductRatingViewModel();
  final _collectionViewModel = CollectionViewModel();

  // TODO false
  
  @override
  void initState() {
    storeId = widget.storeId;
    loadStoreRating();
    loadFood().then((_) => Timer(Duration(seconds: 1), (){
        setState((){
          gotFromServer = collections.isNotEmpty;
        });
      }));
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarMenu(),
        body: Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.only(top: 5,left: 10, right: 10),
          child: !gotFromServer
          ? loading()
          : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              StoreDetails(storeId: storeId, storeRatingData: storeRatingData,),
              SizedBox(height: 10,),
              CategoriesList(storeId: storeId, collections: collections, productRatingData: productRatingData,),
            ],
          ),
        ),
      ),
    );
  }
  void loadStoreRating(){
    _storeRatingViewModel.getRatings(storeId);
    storeRatingData = _storeRatingViewModel.storeRatingData;
  }
  void loadProductRating(int productId){
    _productRatingViewModel.getRatings(productId);
    productRatingData = _productRatingViewModel.productRatingData;
  }
  Future<void> loadFood() async{
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
                collection.products!.add(product);
              }
            }
          }
        });
      });
    });
  }
}
