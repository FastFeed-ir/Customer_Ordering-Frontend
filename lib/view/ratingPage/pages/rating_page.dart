import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../model/entity/rating.dart';
import '../../../utils/constants.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../view_model/order_view_model.dart';
import '../../../view_model/rating_view_model.dart';

class ScoringScreen extends StatefulWidget {
  ScoringScreen({Key? key, required this.orderId}) : super(key: key);
  var orderId;
  @override
  _ScoringScreenState createState() => _ScoringScreenState();
}

class _ScoringScreenState extends State<ScoringScreen> {
  double _stars = 1;
  late final List<int> _Ids = [];
  var _orderId;
  final _ratingViewModel = RatingViewModel();
  final _orderViewModel = OrderViewModel();
  @override
  void initState() {
    _orderId = widget.orderId;
    _orderViewModel.getProductsIds(_orderId);
    _orderViewModel.Ids.stream.listen((ids) {
      setState(() {
        _Ids.addAll(ids);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 800));
    return Scaffold(
      backgroundColor: BaseColor,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(ScreenUtil().setHeight(180)),
          child: AppBar(
            backgroundColor: YellowColor,
            automaticallyImplyLeading: false,
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final double availableHeight = constraints.maxHeight;

                final double logoHeight = availableHeight * 0.6;
                final double titleFontSize = availableHeight * 0.12;

                return Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              BlackLogo,
                              height: logoHeight,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: availableHeight * 0.05),
                            Text(
                              'ثبت امتیاز',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: BlackColor,
                                fontFamily: IranSansWeb,
                                fontSize: titleFontSize,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
            elevation: 0.0,
          )),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: const AlignmentDirectional(0, 0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 45, 0, 0),
                child: Image.asset(
                  RatingLogo,
                  height: ScreenUtil().setHeight(80),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              'امتیاز به سفارش',
              style: TextStyle(
                  color: BlackColor,
                  fontFamily: IranSansWeb,
                  fontSize: ScreenUtil().setSp(20),
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 70, 0, 0),
              child: Container(
                  width: ScreenUtil().setWidth(310),
                  height: ScreenUtil().setHeight(170),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEBEBEB),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0, 0),
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Text(
                            'به سفارشتان چه امتیازی می دهید؟',
                            style: TextStyle(
                                color: BlackColor,
                                fontFamily: IranSansWeb,
                                fontSize: ScreenUtil().setSp(18),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                        child: Theme(
                          data: ThemeData(
                            textTheme: TextTheme(
                              headlineSmall: TextStyle(
                                color: BlackColor,
                                fontSize: ScreenUtil().setSp(24),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            colorScheme: ColorScheme.fromSwatch()
                                .copyWith(secondary: YellowColor)
                                .copyWith(background: WhiteColor),
                          ),
                          child: RatingBar.builder(
                            onRatingUpdate: (newValue) =>
                                setState(() => _stars = newValue),
                            itemBuilder: (context, index) => const Icon(
                              Icons.star_sharp,
                              color: YellowColor,
                            ),
                            direction: Axis.horizontal,
                            initialRating: _stars,
                            unratedColor: Colors.grey,
                            itemCount: 5,
                            itemSize: ScreenUtil().setSp(45),
                            glowColor: YellowColor,
                            textDirection: TextDirection.ltr,
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
              child: ElevatedButton(
                onPressed: () {
                  for (var id in _Ids) {
                    Rating rating = Rating(productId: id, score: _stars as int);
                    _ratingViewModel
                        .addRating(rating)
                        .asStream()
                        .listen((ratingId) {
                      rating.id = ratingId;
                    });
                  }
                  Get.toNamed(CommentsPage,arguments: _orderId);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: YellowColor,
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  minimumSize: Size(
                      ScreenUtil().setWidth(145), ScreenUtil().setHeight(55)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  side: const BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                ),
                child: Text(
                  'ادامه',
                  style: TextStyle(
                    color: BlackColor,
                    fontFamily: IranSansWeb,
                    fontSize: ScreenUtil().setSp(20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
