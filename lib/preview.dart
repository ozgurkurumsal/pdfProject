import 'dart:io';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:share_plus/share_plus.dart';

class Preview extends StatelessWidget {
  final String path;
  const Preview({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('REÇETE DETAYI'),
      ),
      // body: Center(child: Text(path)),
      body: SfPdfViewer.file(File(path)),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.share),
        onPressed: () async => await Share.shareFiles([path]),
        // 'check out my website https://example.com',
        // subject: 'Look what I made!'),
      ),
      //     'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf'),
    );
  }
}
