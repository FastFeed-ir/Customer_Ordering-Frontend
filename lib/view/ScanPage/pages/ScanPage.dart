import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/constants.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  String _qrCodeData = 'Scan a QR code';

  @override
  void initState() {
    super.initState();
    requestCameraPermission();
  }

  Future<void> requestCameraPermission() async {
    final status = await Permission.camera.request();
    if (status.isGranted) {
      print('Camera permission granted');
    } else if (status.isDenied) {
      print('Camera permission denied');
    } else if (status.isPermanentlyDenied) {
      print('Camera permission permanently denied');
    }
  }

  String extractLastValue(String text) {
    // Check if the text is in the correct format
    if (text.startsWith("http://fastfeed.ir/") && text.endsWith("/")) {
      // Extract the last value after the last forward slash
      final parts = text.split("/");
      if (parts.length >= 2) {
        return parts[parts.length - 2];
      }
    }

    // Return an empty string if the format is not correct or the value cannot be extracted
    return "";
  }

  Future<void> _scanQRCode() async {
    try {
      final qrCodeData = await scanner.scan();
      final lastSegment = extractLastValue(qrCodeData!);
      if (lastSegment.isNotEmpty) {
        setState(() async {
          _qrCodeData = lastSegment;
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString("StorId", _qrCodeData);
        });
      } else {
        showSnackbar('لطفا کد QR درست را اسکن کنید!');
      }
    } catch (e) {
      setState(() {
        _qrCodeData = 'خطا در اسکن $e';
      });
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
              //const SizedBox(height: 16),
              //Text(_qrCodeData),
            ],
          ),
        ),
      ),
    );
  }
}
