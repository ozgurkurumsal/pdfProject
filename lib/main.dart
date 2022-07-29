import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdfproject/preview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;

  final pdf = pw.Document();
  // final file = File("example.pdf");
  // File path = File("example.pdf");
  //final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  // void _incrementCounter() {
  //   setState(() {
  //     // This call to setState tells the Flutter framework that something has
  //     // changed in this State, which causes it to rerun the build method below
  //     // so that the display can reflect the updated values. If we changed
  //     // _counter without calling setState(), then the build method would not be
  //     // called again, and so nothing would appear to happen.
  //     _counter++;
  //   });
  // }

  Future<void> pdfCreate() async {
    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text("Hello World !!!!!!!!!! 3"),
          ); // Center
        })); // Page

    final output = await getTemporaryDirectory();
    debugPrint(output.path);
    final file = File("${output.path}/example.pdf");
    await file.writeAsBytes(await pdf.save());

    debugPrint('pdf');
    // setState(() {
    //   path = file;
    // });
  }

  Future<String> _createFileFromString() async {
    final encodedStr = "put base64 encoded string here";
    Uint8List bytes = base64.decode(encodedStr);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = File(
        "$dir/" + DateTime.now().millisecondsSinceEpoch.toString() + ".pdf");
    await file.writeAsBytes(bytes);
    return file.path;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      //extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   // Here we take the v
      //   //alue from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   // title: Text(widget.title),
      //   flexibleSpace: Stack(
      //     clipBehavior: Clip.none,
      //     children: [
      //       ClipRRect(
      //         borderRadius: const BorderRadius.only(
      //             bottomLeft: Radius.circular(30),
      //             bottomRight: Radius.circular(30)),
      //         child: Container(
      //           height: 400,
      //           color: Colors.red,
      //         ),
      //       ),
      //       const Positioned(
      //           top: 200,
      //           left: 130,
      //           child: Text(
      //             'Deneme',
      //             style: TextStyle(fontSize: 30),
      //           ))
      //     ],
      //   ),

      //   toolbarHeight: 200,
      // ),
      body: const Center(child: Text('test')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Preview(),
              ));
          // prepareTestPdf().then((path) {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //       builder: (context) => FullPdfViewerScreen(path)),
          // );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Anasayfa'),
        BottomNavigationBarItem(icon: Icon(Icons.picture_as_pdf), label: 'Pdf'),
      ]),
    );
  }
}
