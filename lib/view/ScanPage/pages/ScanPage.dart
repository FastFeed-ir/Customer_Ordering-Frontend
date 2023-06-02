
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../utils/constants.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../view_model/store_viewmodel.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  String _qrCodeData = 'Scan a QR code';
  final _storeViewModel = StoreViewModel();

  @override
  void initState() {
    super.initState();
    requestCameraPermission();
  }

  Future<void> requestCameraPermission() async {
    final status = await Permission.camera.request();
    if (status.isGranted) {
    } else if (status.isDenied) {
      showSnackbar(
          'لطفا برنامه را clear data کنید و دوباره باز کنید تا اجازه دسترسی داده شود.');
    }
  }

  String extractLastValue(String text) {
    if (text.startsWith("http://fastfeed.ir/") && text.endsWith("/")) {
      final parts = text.split("/");
      if (parts.length >= 2) {
        return parts[parts.length - 2];
      }
    }

    return "";
  }

  void _scanQRCode() async {
      final qrCodeData = await scanner.scan();
      final lastSegment = extractLastValue(qrCodeData!);
      if (lastSegment.isNotEmpty) {
        _qrCodeData = lastSegment;
        print(_qrCodeData);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        int? storeId = int.tryParse(_qrCodeData);
        _storeViewModel.getStore(storeId!);
        _storeViewModel.getRatings(storeId);
        if (_storeViewModel.store.title != null) {
          prefs.setInt("StorId", storeId);
          print("set Store Id: $storeId");
          var tableCount = _storeViewModel.store.tables_count!;
          prefs.setInt("tableCount", tableCount);
          print("set Table Count: $tableCount");
          var storeName= _storeViewModel.store.title!;
          prefs.setString("storeTitle",storeName);
          print("set Store Title: $storeName");
          var averageRating = _storeViewModel.storeRatingData.averageRating!;
          prefs.setDouble("averageRating", averageRating);
          var ratingCount = _storeViewModel.storeRatingData.ratingCount!;
          prefs.setInt("ratingCount", ratingCount);
          var commentCount = _storeViewModel.storeRatingData.commentCount!;
          prefs.setInt("commentCount", commentCount);
          Get.toNamed(LandingPage);
        } else {
          showSnackbar('لطفا اشتراک رستوران را چک کنید!');
          return; // Exit the method early if store is not found
        }
      } else {
        showSnackbar('لطفا کد QR درست را اسکن کنید!');
      }
  }


  void showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 800));
    return GestureDetector(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ScaningPage),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 86, 0, 0),
                  child: Text(
                    'خوش آمدید',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: RedColor,
                      fontFamily: IranSansWeb,
                      fontSize: ScreenUtil().setSp(46),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 58, 0, 0),
                  child: Image.asset(
                    FastfeedLogo,
                    height: ScreenUtil().setHeight(240),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 75, 0, 0),
                child: ElevatedButton(
                  onPressed: _scanQRCode,
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(
                      ScreenUtil().setHeight(145),
                      ScreenUtil().setWidth(45),
                    ),
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: RedColor,
                  ),
                  child: Text(
                    'اسکن کنید',
                    style: TextStyle(
                      color: WhiteColor,
                      fontFamily: IranSansWeb,
                      fontSize: ScreenUtil().setSp(20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
