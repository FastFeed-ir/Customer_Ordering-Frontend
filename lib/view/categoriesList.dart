import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../model/entity/Rating.dart';
import '../model/entity/collection.dart';
import '../model/entity/product.dart';
import '../utils/constants.dart';
import '../view_model/collection_view_model.dart';
import '../view_model/rating_view_model.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({Key? key}) : super(key: key);

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  int _selectedCategoryId = 0;

  // TODO initial storeId
  late int storeId;
  final List<Collection> collections = [];
  final List<Product> products = [];
  final List<Rating> _rates = [];
  final _collectionViewModel = CollectionViewModel();
  final _ratingViewModel = RatingViewModel();
  var _gotFromServer = false;

  @override
  void initState() {
    loadFood();
    //getRate();
  }

  @override
  Widget build(BuildContext context) {
    print("products: ${products.length}");
    return !_gotFromServer
        ? loading()
        : Column(
            children: [
              Row(
                children: [
                  Icon(Icons.search, color: BlackColor, size: 30),
                  SizedBox(width: 5),
                  SizedBox(
                      height: 35,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: categoryBuild()),
                ],
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: productsList()),
            ],
          );
  }

  Widget categoryBuild() {
    return ListView.builder(
      itemCount: collections.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedCategoryId = collections[index].id!;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(8.0),
            width: 100,
            decoration: BoxDecoration(
              color: _selectedCategoryId == collections[index].id
                  ? RedColor
                  : WhiteColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Text(
                collections[index].title,
                style: TextStyle(
                  color: _selectedCategoryId == collections[index].id
                      ? WhiteColor
                      : RedColor,
                  height: 1.0,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget productsList() {
    return ListView.builder(
      itemCount: collections[_selectedCategoryId].products!.length,
      itemBuilder: (context, index) {
        final product = collections[_selectedCategoryId].products![index];
        return Directionality(
          textDirection: TextDirection.ltr,
          child: Container(
            color: Colors.yellow,
            height: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200,
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: CachedNetworkImage(
                          imageUrl: "",
                          width: 100,
                          height: 100,
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Image.asset(
                            EmptyImg,
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ),
                      FoodCounter(),
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
                            product.title,
                            style: TextStyle(
                                fontFamily: IranSansWeb,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          RichText(
                            text: TextSpan(children: [
                              WidgetSpan(
                                  child: Icon(
                                Icons.star,
                                color: YellowColor,
                                size: 10,
                              )),
                              TextSpan(text: "${_rates[index].score}"),
                            ]),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          product.description!,
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
      },
    );
  }

  void loadFood() {
    var storeId = 1;
    _collectionViewModel.getCollections(storeId);
    _collectionViewModel.getProducts(storeId);
    _collectionViewModel.collections.stream.listen((listCollections) {
      _collectionViewModel.products.stream.listen((listProducts) {
        setState(() {
          _gotFromServer = true;
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

  void getRate() {
    for(var product in products) {
      _ratingViewModel.getRatings(product.id!);
      _ratingViewModel.ratings.stream.listen((list) async {
        setState(() {
          _gotFromServer = true;
          for (var rating in list) {
            _rates.add(rating as Rating);
          }
        });
      },
      );
    }
  }
}
