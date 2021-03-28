import 'dart:io';
import 'package:elice_mini_test/business_logic/cubit/app_navigation_cubit.dart';
import 'package:elice_mini_test/business_logic/cubit/bottom_navigation_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainQRScanner extends StatefulWidget {
  @override
  _MainQRScannerState createState() => _MainQRScannerState();
}

class _MainQRScannerState extends State<MainQRScanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: QRView(
              key: qrKey,
              onQRViewCreated: (QRViewController controller) {
                this.controller = controller;
                controller.scannedDataStream.listen((scanData) {
                  context
                      .read<AppNavigationCubit>()
                      .goToWebViewScreen(scanData.code);
                  //qr 카메라 계속 켜있어서 메인 화면으로 되돌리기
                  context.read<BottomNavigationCubit>().changePage(0);
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
