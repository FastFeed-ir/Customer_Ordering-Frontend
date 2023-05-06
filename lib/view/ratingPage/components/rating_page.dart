import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/constants.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingScreen extends StatefulWidget {
  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  late double stars = 1;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(412, 914));
    return Scaffold(
      backgroundColor: BaseColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(ScreenUtil().setHeight(180)),
        child: AppBar(
          backgroundColor: YellowColor,
          automaticallyImplyLeading: false,
          flexibleSpace: Stack(
            // changed
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        BlackLogo,
                        width: ScreenUtil().setWidth(92.4),
                        height: ScreenUtil().setHeight(100),
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: ScreenUtil().setHeight(10)),
                      Text(
                        'ثبت امتیاز',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: BlackColor,
                          fontFamily: IranSansWeb,
                          fontSize: ScreenUtil().setSp(24),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                  right: ScreenUtil().setWidth(30),
                  top: ScreenUtil().setHeight(130),
                  child: InkWell(
                    // added InkWell to make it clickable
                    onTap: () {
                      //TODO
                    },
                    child: const Icon(Icons.arrow_back_ios),
                  )),
            ],
          ),
          elevation: 0.0,
        ),
      ),
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
                  width: ScreenUtil().setWidth(144),
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
                            textTheme: const TextTheme(
                              headlineSmall: TextStyle(
                                color: BlackColor,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            colorScheme: ColorScheme.fromSwatch()
                                .copyWith(secondary: YellowColor)
                                .copyWith(background: WhiteColor),
                          ),
                          child: RatingBar.builder(
                            onRatingUpdate: (newValue) =>
                                setState(() => stars = newValue),
                            itemBuilder: (context, index) => const Icon(
                              Icons.star_sharp,
                              color: YellowColor,
                            ),
                            direction: Axis.horizontal,
                            initialRating: stars ??= 1,
                            unratedColor: Colors.grey,
                            itemCount: 5,
                            itemSize: 45,
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
                  //TODO
                  print(stars);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: YellowColor,
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  minimumSize: const Size(145, 55),
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
                    fontSize: ScreenUtil().setSp(24),
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
