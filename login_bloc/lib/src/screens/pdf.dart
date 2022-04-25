import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class PDF extends StatefulWidget {
  @override
  _PDFState createState() => _PDFState();
}

class _PDFState extends State<PDF> {
  String url = "http://www.pdf995.com/samples/pdf.pdf";
  String pdfasset = "assets/tao.pdf";
  late PDFDocument _doc;
  late bool _loading;

  @override
  void initState() {
    super.initState();
    _initPdf();
  }

  _initPdf() async {
    setState(() {
      _loading = true;
    });
    final doc = await PDFDocument.fromURL(url);
    setState(() {
      _doc = doc;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter PDF Demo"),
      ),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : PDFViewer(
              document: _doc,
              indicatorBackground: Colors.red,
              // showIndicator: false,
              // showPicker: false,
            ),
    );
  }
}
