import 'package:customer_ordering_frontend/view/store_profile/components/information_detail.dart';
import 'package:flutter/material.dart';

Widget informationSection() {
  var storeName = "نام فروشگاه";
  var storeCity = "استان/شهر";

  return ListView(
    children: [
      Container(
        color: Colors.white,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.fromLTRB(0, 16, 24, 0),
        child: Text(
          storeName,
          style: const TextStyle(
              color: Colors.black, fontSize: 32.0, fontWeight: FontWeight.bold),
        ),
      ),
      Container(
        color: Colors.white,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.fromLTRB(0, 0, 24, 16),
        child: Text(
          storeCity,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16.0,
          ),
        ),
      ),
      informationDetail(Icons.location_on_outlined, 'آدرس',
          'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک'),
      const Divider(
        thickness: 2,
        height: 2,
        color: Colors.black,
      ),
      informationDetail(Icons.phone_outlined, 'تلفن', '03333333333'),
      const Divider(
        thickness: 2,
        height: 2,
        color: Colors.black,
      ),
      informationDetail(
          Icons.facebook_outlined, 'فضای مجازی', '@abcdefghijklmnopqrstuvwxyz'),
    ],
  );
}
