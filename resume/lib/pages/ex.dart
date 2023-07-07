// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_full_pdf_viewer_null_safe/full_pdf_viewer_scaffold.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
//
// class PdfPage extends StatelessWidget {
//   final pdf = pw.Document();
//
//   writeOnPdf() {
//     pdf.addPage(
//       pw.Page(
//         build: (pw.Context context) => pw.Center(
//           child: pw.Text("Hello World!"),
//         ),
//       ),
//     );
//   }
//  late var output;
//   Future savePdf() async {
//    await writeOnPdf();
//      output = await getExternalStorageDirectory();
//     final file = File("${output!.path}/example.pdf");
//     print(file.path);
//     file.writeAsBytes(pdf.save() as List<int>);
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("PDF Example"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: savePdf,
//               child: Text("Save PDF"),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => PDFViewerScaffold(
//                       appBar: AppBar(
//                         title: Text("Generated PDF Document"),
//                       ),
//                       path: "${output!.path}/example.pdf",
//                     ),
//                   ),
//                 );
//               },
//               child: Text("Open PDF"),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
