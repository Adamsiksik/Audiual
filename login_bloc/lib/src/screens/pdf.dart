import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:flutter_tts/flutter_tts.dart';

/// Represents Homepage for Navigation
class HomePage extends StatefulWidget {
  String something;
  HomePage(this.something);
  @override
  _HomePageState createState() => _HomePageState(this.something);
}

class _HomePageState extends State<HomePage> {
  final FlutterTts tts = FlutterTts();
  late String something;
  _HomePageState(this.something);

  late PdfViewerController _pdfViewerController;
  OverlayEntry? _overlayEntry;
  @override
  void initState() {
    tts.setLanguage("en-US");
    tts.setSpeechRate(0.5);
    tts.setVolume(1.0);
    tts.setPitch(1.0);
    _pdfViewerController = PdfViewerController();
    super.initState();
  }

  void _showContextMenu(
      BuildContext context, PdfTextSelectionChangedDetails details) {
    final OverlayState _overlayState = Overlay.of(context)!;
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: details.globalSelectedRegion!.center.dy - 55,
        left: details.globalSelectedRegion!.bottomLeft.dx,
        child: RaisedButton(
          onPressed: () {
            Clipboard.setData(ClipboardData(text: details.selectedText));
            tts.speak(details.selectedText.toString());
            _pdfViewerController.clearSelection();
          },
          color: Colors.white,
          elevation: 10,
          child: Text('Listen', style: TextStyle(fontSize: 17)),
        ),
      ),
    );
    _overlayState.insert(_overlayEntry!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Books"),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                tts.stop();
                Navigator.pop(context);
              },
            )),
        body: Container(
            child: SfPdfViewer.network(
          'http://192.168.1.19:3000/books/someroute?isbn=$something',
          scrollDirection: PdfScrollDirection.horizontal,
          onTextSelectionChanged: (PdfTextSelectionChangedDetails details) {
            if (details.selectedText == null && _overlayEntry != null) {
              _overlayEntry!.remove();
              _overlayEntry = null;
            } else if (details.selectedText != null && _overlayEntry == null) {
              _showContextMenu(context, details);
            }
          },
          controller: _pdfViewerController,
        )));
  }
}
