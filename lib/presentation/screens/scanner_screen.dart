import 'dart:io';
import 'package:document_scanner_flutter/configs/configs.dart';
import 'package:document_scanner_flutter/document_scanner_flutter.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ScannerScreen extends StatefulWidget {

  static const String name = 'scanner_screen';

  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  File? _scannedPdf;

  openImageScanner(BuildContext context) async {
    var pdf = await DocumentScannerFlutter.launchForPdf(context,
        //source: ScannerFileSource.CAMERA,
        labelsConfig: {
          ScannerLabelsConfig.ANDROID_NEXT_BUTTON_LABEL: "Siguiente",
          ScannerLabelsConfig.ANDROID_OK_LABEL: "OK",
        });
    if (pdf != null) {
      _scannedPdf = pdf;
      //TODO: Copiar pdf generado en ubicacion conocida
      //pdf.copySync('Documents');
      // setState(() {});
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Escanear Documento'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (_scannedPdf != null) ...[
            Text(_scannedPdf!.path)
          ],
          Center(
            child: Builder(builder: (context) {
              return ElevatedButton(
                  onPressed: () => openImageScanner(context),
                  child: const Text("Escanear Imagen"));
            }),
          )
        ],
      ),
    );
  }
}
