import 'dart:html' as html;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/services.dart';


Future<void> downloadPdfFromAsset(String assetPath) async {
  final data = await rootBundle.load(assetPath);
  final Uint8List bytes = data.buffer.asUint8List();

  if (kIsWeb) {
    final blob = html.Blob([bytes], 'application/pdf');
    final blobUrl = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.document.createElement('a') as html.AnchorElement;
    anchor.href = blobUrl;
    anchor.download = 'IvanMoslavacCV.pdf';
    anchor.click();
    html.Url.revokeObjectUrl(blobUrl);
  }
}