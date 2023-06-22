import 'package:customer_ordering_frontend/utils/constants.dart';
import 'package:customer_ordering_frontend/view/store_profile/components/information_detail.dart';
import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

Widget informationSection(
  String title,
  String city,
  String address,
  String telephoneNumber,
  String instagramPageLink,
) {
  return ListView(
    children: [
      Container(
        color: Colors.white,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.fromLTRB(0, 16, 24, 0),
        child: Text(
          title,
          style: const TextStyle(
              fontFamily: IranSansWeb,
              color: Colors.black,
              fontSize: 32.0,
              fontWeight: FontWeight.bold),
        ),
      ),
      Visibility(
        visible: (city.length != 0),
        child: Container(
          color: Colors.white,
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.fromLTRB(0, 0, 24, 16),
          child: Text(
            city,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: IranSansWeb,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
      SizedBox(height: 16,),
      Visibility(
        visible: (address.length != 0),
        child: informationDetail(Icons.location_on_outlined, 'آدرس', address),
      ),
      Visibility(
        visible: (address.length != 0),
        child: const Divider(
          thickness: 2,
          height: 2,
          color: Colors.black,
        ),
      ),
      informationDetail(
          Icons.phone_outlined, 'تلفن', telephoneNumber.toPersianDigit()),
      const Divider(
        thickness: 2,
        height: 2,
        color: Colors.black,
      ),
      Visibility(
        visible: (instagramPageLink.length != 0),
        child:
            informationDetail(Icons.telegram, 'فضای مجازی', instagramPageLink),
      ),
      Visibility(
        visible: (instagramPageLink.length != 0),
        child: const Divider(
          thickness: 2,
          height: 2,
          color: Colors.black,
        ),
      ),
    ],
  );
}
