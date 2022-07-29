import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Preview extends StatelessWidget {
  const Preview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SfPdfViewer.network(
          'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf'),
    );
  }
}
