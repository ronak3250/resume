import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:permission_handler/permission_handler.dart';


import 'package:printing/printing.dart';
import 'package:path_provider/path_provider.dart';

import '../globalvariable.dart';


class PdfPreviewPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Preview'),
      ),
      body: PdfPreview(
        build: (context) => makePdf(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () async {
          saveFile('fileName');
        },
      ),
    );
  }


  var file = File('');

  Future<void> saveFile(String fileName) async {
    // Platform.isIOS comes from dart:io
    if (Platform.isAndroid) {
      // final dir = await getApplicationDocumentsDirectory();
      if (Platform.isAndroid) {
        var status = await Permission.storage.status;
        if (status != PermissionStatus.granted) {
          status = await Permission.storage.request();
        }
        if (status.isGranted) {
          const downloadsFolderPath = '/storage/emulated/0/Download/';
          Directory dir = Directory(downloadsFolderPath);
          file = File('${dir.path}/$fileName');
        }
        // file = File('${dir.path}/$fileName');
      }
    }
  }


}
