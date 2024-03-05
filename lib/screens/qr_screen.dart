import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:tic_tac_toe_mp/utils/colors.dart';

class QrScanner extends StatefulWidget {
  static String routeName = '/qr-scan';
  const QrScanner({super.key});

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        body: Center(
          child: SizedBox(
            height: 400, // Set the desired height
            child: MobileScanner(
              onDetect: (capture) {
                final List<Barcode> barcodes = capture.barcodes;
                final Uint8List? image = capture.image;
                for (final barcode in barcodes) {
                  debugPrint('Barcode found! ${barcode.rawValue}');
                  if (barcode.rawValue != null) {
                    Navigator.pop(context, barcode.rawValue);
                  }
                }
              },
            ),
          ),
        ));
  }
}
