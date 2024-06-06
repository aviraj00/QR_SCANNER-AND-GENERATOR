import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class scanqr extends StatefulWidget {
  const scanqr({Key? key}) : super(key: key);

  @override
  State<scanqr> createState() => _State();
}

class _State extends State<scanqr> {
  String qrresult = 'Scanned data will appear here';

  Future<void> scanQR() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'cancel', true, ScanMode.QR);
      if (!mounted) return;
      setState(() {
        qrresult = qrCode.toString();
      });
    } on PlatformException {
      qrresult = 'Fail to read data';
    }
  }

  Future<void> copyToClipboard() async {
    await Clipboard.setData(ClipboardData(text: qrresult));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Copied to clipboard'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan QR code'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

      ),
      body: Container(
        color: Colors.orange.shade50,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Text(
                qrresult,
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: scanQR,
                child: Text(
                  'Scan Code',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all(Colors.orange),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => copyToClipboard(),
                child: Text(
                  'Copy Result',
                  style: TextStyle(color: Colors.white,),
                ),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.orange)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


