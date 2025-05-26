// import 'package:flutter/material.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'dart:io';
// import 'dart:typed_data';

// class PDFPreviewScreen extends StatefulWidget {
//   final String pdfPath;
//   final String fileName;
//   final Uint8List? pdfBytes;

//   const PDFPreviewScreen({
//     super.key,
//     required this.pdfPath,
//     required this.fileName,
//     this.pdfBytes,
//   });

//   @override
//   State<PDFPreviewScreen> createState() => _PDFPreviewScreenState();
// }

// class _PDFPreviewScreenState extends State<PDFPreviewScreen> {
//   PDFViewController? controller;
//   int currentPage = 0;
//   int totalPages = 0;
//   bool isReady = false;
//   String errorMessage = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       appBar: AppBar(
//         title: Text(
//           widget.fileName,
//           style: const TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black87,
//         elevation: 1,
//         centerTitle: false,
//         actions: [
//           if (isReady)
//             Container(
//               margin: const EdgeInsets.only(right: 16),
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//               decoration: BoxDecoration(
//                 color: Colors.grey[200],
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               child: Text(
//                 '${currentPage + 1} / $totalPages',
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: Colors.grey[700],
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ),
//         ],
//       ),
//       body: Column(
//         children: [
//           // PDF Viewer
//           Expanded(
//             child: Container(
//               margin: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(12),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withValues(alpha: 0.1),
//                     blurRadius: 10,
//                     offset: const Offset(0, 4),
//                   ),
//                 ],
//               ),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(12),
//                 child: _buildPDFView(),
//               ),
//             ),
//           ),

//           // Action Buttons
//           Container(
//             padding: const EdgeInsets.all(20),
//             decoration: const BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(24),
//                 topRight: Radius.circular(24),
//               ),
//             ),
//             child: SafeArea(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   _buildActionButton(
//                     icon: Icons.download_outlined,
//                     label: 'Download',
//                     onTap: _downloadPDF,
//                     color: Colors.blue,
//                   ),
//                   _buildActionButton(
//                     icon: Icons.share_outlined,
//                     label: 'Share',
//                     onTap: _sharePDF,
//                     color: Colors.green,
//                   ),
//                   _buildActionButton(
//                     icon: Icons.print_outlined,
//                     label: 'Print',
//                     onTap: () {},
//                     color: Colors.orange,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildPDFView() {
//     if (errorMessage.isNotEmpty) {
//       return Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.error_outline,
//               size: 64,
//               color: Colors.red[300],
//             ),
//             const SizedBox(height: 16),
//             Text(
//               'Error loading PDF',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.grey[700],
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               errorMessage,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 14,
//                 color: Colors.grey[600],
//               ),
//             ),
//           ],
//         ),
//       );
//     }

//     if (!isReady) {
//       return const Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             CircularProgressIndicator(),
//             SizedBox(height: 16),
//             Text(
//               'Loading PDF...',
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.grey,
//               ),
//             ),
//           ],
//         ),
//       );
//     }

//     return PDFView(
//       filePath: widget.pdfPath,
//       enableSwipe: true,
//       swipeHorizontal: false,
//       autoSpacing: true,
//       pageFling: true,
//       pageSnap: true,
//       defaultPage: currentPage,
//       fitPolicy: FitPolicy.BOTH,
//       preventLinkNavigation: false,
//       onRender: (pages) {
//         setState(() {
//           totalPages = pages!;
//           isReady = true;
//         });
//       },
//       onError: (error) {
//         setState(() {
//           errorMessage = error.toString();
//         });
//       },
//       onPageError: (page, error) {
//         setState(() {
//           errorMessage = '$error';
//         });
//       },
//       onViewCreated: (PDFViewController pdfViewController) {
//         controller = pdfViewController;
//       },
//       onLinkHandler: (String? uri) {
//         // Handle link taps if needed
//       },
//       onPageChanged: (int? page, int? total) {
//         setState(() {
//           currentPage = page ?? 0;
//           totalPages = total ?? 0;
//         });
//       },
//     );
//   }

//   void _showSnackBar(String message, Color backgroundColor) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         backgroundColor: backgroundColor,
//         behavior: SnackBarBehavior.floating,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ),
//     );
//   }
// }

// // Usage example:
// class PDFPreviewExample extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'PDF Preview Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         useMaterial3: true,
//       ),
//       home: Scaffold(
//         appBar: AppBar(title: const Text('PDF Preview Demo')),
//         body: Center(
//           child: ElevatedButton(
//             onPressed: () {
//               // Navigate to PDF preview
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const PDFPreviewScreen(
//                     pdfPath: '/path/to/your/pdf/file.pdf',
//                     fileName: 'sample_document.pdf',
//                   ),
//                 ),
//               );
//             },
//             child: const Text('Open PDF Preview'),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/localization/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdfx/pdfx.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

@RoutePage()
class PdfViewerScreen extends StatefulWidget {
  final String pathUrl;
  const PdfViewerScreen({
    super.key,
    required this.pathUrl,
  });

  @override
  State<PdfViewerScreen> createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {
  static const int _initialPage = 1;
  late PdfControllerPinch _pdfControllerPinch;

  @override
  void initState() {
    super.initState();
    _pdfControllerPinch = PdfControllerPinch(
      document: PdfDocument.openFile(widget.pathUrl),
      initialPage: _initialPage,
    );
  }

  @override
  void dispose() {
    _pdfControllerPinch.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(context.translate(AppStrings.salesInvoice)),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: PdfPageNumber(
                controller: _pdfControllerPinch,
                builder: (_, loadingState, page, pagesCount) => Container(
                  alignment: Alignment.center,
                  child: Text(
                    '$page/${pagesCount ?? 0}',
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: PdfViewPinch(
            builders: PdfViewPinchBuilders<DefaultBuilderOptions>(
              options: const DefaultBuilderOptions(),
              documentLoaderBuilder: (_) =>
                  const Center(child: CircularProgressIndicator.adaptive()),
              pageLoaderBuilder: (_) =>
                  const Center(child: CircularProgressIndicator.adaptive()),
              errorBuilder: (_, error) => Center(child: Text(error.toString())),
            ),
            controller: _pdfControllerPinch,
          ),
        ),
        bottomNavigationBar: Container(
          height: 55.h,
          color: context.colorScheme.tertiaryContainer,
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: _downloadPDF,
                  borderRadius: BorderRadius.circular(8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.download_rounded,
                        color: Colors.blue,
                        size: 24,
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Download',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: _sharePDF,
                  borderRadius: BorderRadius.circular(8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.share_rounded,
                        color: Colors.green,
                        size: 24,
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Share',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.print_rounded,
                        color: Colors.orange,
                        size: 24,
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Print',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Future<void> _downloadPDF() async {
    try {
      // Request storage permission
      var status = await Permission.storage.request();
      if (status.isDenied) {
        // _showSnackBar('Storage permission denied', Colors.red);
        return;
      }

      // Get downloads directory

      final downloadsDir = await getApplicationDocumentsDirectory();

      final file = File(widget.pathUrl);
      final newPath =
          '${downloadsDir.path}/SalesInvoice${DateTime.now().millisecondsSinceEpoch}';

      await file.copy(newPath);

      // _showSnackBar('PDF downloaded to Downloads folder', Colors.green);
    } catch (e) {
      // _showSnackBar('Failed to download PDF: $e', Colors.red);
    }
  }

  Future<void> _sharePDF() async {
    try {
      final file = File(widget.pathUrl);
      await Share.shareXFiles(
        [XFile(file.path)],
        text: 'Sharing SalesInvoice',
      );
    } catch (e) {
      // _showSnackBar('Failed to share PDF: $e', Colors.red);
    }
  }

  // Future<void> _printPDF() async {
  //   try {
  //     final file = File(widget.pdfPath);
  //     final bytes = await file.readAsBytes();

  //     await Printing.layoutPdf(
  //       onLayout: (format) async => bytes,
  //       name: widget.fileName,
  //     );
  //   } catch (e) {
  //     _showSnackBar('Failed to print PDF: $e', Colors.red);
  //   }
  // }
}
