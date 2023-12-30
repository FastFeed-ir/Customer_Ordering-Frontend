import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../utils/constants.dart';
class StoreDetails extends StatefulWidget {
  final int storeId;
  final String? name;
  final int? commentCount;
  final int? ratingCount;
  final double? averageRating;
  StoreDetails({required this.storeId, required this.name, required this.commentCount, required this.ratingCount, required this.averageRating,});

  @override
  State<StoreDetails> createState() => _StoreDetailsState();
}

class _StoreDetailsState extends State<StoreDetails> {

  @override
  Widget build(BuildContext context) {
    return Column(
      //textDirection: TextDirection.rtl,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // TODO sotre name API
        titleStyle(widget.name??"فست فید",),
        storeInfo(),
        const SizedBox(height: 10,),
        storeComments(),
      ],
    );
  }

  Widget storeInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // TODO scores from API
        totalScores(),
        Container(
          width: 2,
          height: ScreenUtil().setHeight(50),
          color: BlackColor,
        ),
        // TODO more Information
        GestureDetector(onTap: (){},child: moreInfo()),
      ],
    );
  }

  Widget totalScores() {
    String scoreAvgStr = (widget.averageRating!).toString().toPersianDigit();
    String totalScoreStr = widget.ratingCount.toString().toPersianDigit();
    String totalAvg = 5.toString().toPersianDigit();
    IconData icon = Icons.star_border_outlined;
    return Column(
      children: [
        Text(
          ("$scoreAvgStr از $totalAvg"),
          style:  TextStyle(
            fontFamily: IranSansWeb,
            fontSize: ScreenUtil().setSp(16),
            color: BlackColor,
          ),
        ),
        const SizedBox(height: 8,),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              WidgetSpan(
                child: Icon(icon, color: BlackColor, size: 15),
              ),
              const WidgetSpan(
                child: SizedBox(width: 3,),
              ),
              TextSpan(
                text: ("$totalScoreStr امتیاز "),
                style:  TextStyle(
                  fontSize: ScreenUtil().setSp(12),
                  fontWeight: FontWeight.w500,
                  fontFamily: IranSansWeb,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget moreInfo() {
    return InkWell(
      onTap: (){
        Get.toNamed(StoreProfilePage, arguments: widget.storeId);
      },
      child:  Column(
        children: [
          Icon(Icons.info_outline, size: ScreenUtil().setSp(22),),
          SizedBox(height: ScreenUtil().setHeight(12),),
          Text('اطلاعات بیشتر', style: TextStyle(fontSize: ScreenUtil().setSp(12), fontFamily: IranSansWeb),
          ),
        ],
      ),
    );
  }


  Widget storeComments() {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: ScreenUtil().setHeight(32), vertical: ScreenUtil().setWidth(16),),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          commentsCount(),
          showComments(),
        ],
      ),
    );
  }

  Widget commentsCount() {
    String totalCommentsStr = widget.commentCount.toString().toPersianDigit();
    IconData icon = Icons.message_outlined;
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          WidgetSpan(
            child: Icon(icon, color: BlackColor, size: 15),
          ),
          TextSpan(
            text: (" $totalCommentsStr  نظر  "),
            style:  TextStyle(
              fontSize: ScreenUtil().setSp(12),
              fontWeight: FontWeight.w500,
              fontFamily: IranSansWeb,
              color: BlackColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget showComments() {
    String text = "مشاهده نظرات ";
    IconData icon = Icons.arrow_forward_ios_outlined;
    return GestureDetector(
      onTap: (){
        Get.toNamed(StoreProfilePage, arguments: widget.storeId);
      },
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: text,
              style:  TextStyle(
                fontSize: ScreenUtil().setSp(12),
                fontWeight: FontWeight.w500,
                fontFamily: IranSansWeb,
                color: BlackColor,
              ),
            ),
            WidgetSpan(
              child: Icon(icon, color: BlackColor, size: 15, weight: 50),
            ),
          ],
        ),
      ),
    );
  }
}
