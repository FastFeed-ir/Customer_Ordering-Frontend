import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../model/entity/storeRating.dart';
import '../utils/constants.dart';
class StoreDetails extends StatefulWidget {
  final int storeId;
  final StoreRatingData storeRatingData;
  StoreDetails({required this.storeId, required this.storeRatingData});

  @override
  State<StoreDetails> createState() => _StoreDetailsState();
}

class _StoreDetailsState extends State<StoreDetails> {
  late int storeId;
  late StoreRatingData storeRatingData = StoreRatingData();

  @override
  void initState() {
    storeId = widget.storeId;
    storeRatingData = widget.storeRatingData;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      //textDirection: TextDirection.rtl,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // TODO sotre name API
        titleStyle(storeRatingData.name ?? "فست فید"),
        storeInfo(),
        SizedBox(height: 10,),
        storeComments(),
      ],
    );
  }

  Widget storeInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // TODO scores from API
        totalScores(4.5, 5555, Icons.star_border_outlined),
        Container(
          width: 2,
          height: 50,
          color: BlackColor,
        ),
        // TODO more Information
        GestureDetector(onTap: (){},child: moreInfo()),
      ],
    );
  }

  Widget totalScores(double scoreAvg, int totalScore, IconData icon) {
    String scoreAvgStr = (storeRatingData.averageRating??0).toString().toPersianDigit();
    String totalScoreStr = (storeRatingData.ratingCount??0).toString().toPersianDigit();
    String totalAvg = 5.toString().toPersianDigit();
    return Column(
      children: [
        Text(
          ("$scoreAvgStrاز$totalAvg"),
          style: TextStyle(
            fontFamily: IranSansWeb,
            fontSize: 19,
            color: BlackColor,
          ),
        ),
        SizedBox(height: 8,),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              WidgetSpan(
                child: Icon(icon, color: BlackColor, size: 15),
              ),
              TextSpan(
                text: ("$totalScoreStr امتیاز "),
                style: TextStyle(
                  fontSize: 15.0,
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
    return Column(
      children: [
        Icon(Icons.info_outline, size: 22),
        SizedBox(height: 15,),
        Text('اطلاعات بیشتر', style: TextStyle(fontSize: 15, fontFamily: IranSansWeb),
        ),
      ],
    );
  }

  Widget storeComments() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          commentsCount(565 ,Icons.message_outlined),
          showComments("مشاهده نظرات", Icons.arrow_forward_ios_outlined),
        ],
      ),
    );
  }

  Widget commentsCount(int totalComments ,IconData icon) {
    String totalCommentsStr = (storeRatingData.commentCount??0).toString().toPersianDigit();
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          WidgetSpan(
            child: Icon(icon, color: BlackColor, size: 15),
          ),
          TextSpan(
            text: ("$totalCommentsStr نظر "),
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w500,
              fontFamily: IranSansWeb,
              color: BlackColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget showComments(String text, IconData icon) {
    return GestureDetector(
      onTap: (){},
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: text,
              style: TextStyle(
                fontSize: 15.0,
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
