// ignore_for_file: deprecated_member_use

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
    final savedPath = await savePdfToDownloads(sourcePath: widget.pathUrl);
    if (savedPath != null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("PDF saved to: $savedPath")),
        );
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to save PDF")),
        );
      }
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

  Future<String?> savePdfToDownloads({
    required String sourcePath,
    String? fileName,
  }) async {
    try {
      final sourceFile = File(sourcePath);
      final name = fileName ??
          'SalesInvoice_${DateTime.now().millisecondsSinceEpoch}.pdf';

      late Directory downloadsDir;

      if (Platform.isAndroid) {
        if (await _requiresStoragePermission()) {
          final permission = await Permission.storage.status;
          if (!permission.isGranted) {
            final result = await Permission.storage.request();
            if (!result.isGranted) return null;
          }
        }

        downloadsDir = await getExternalStorageDirectory() ??
            await getTemporaryDirectory();
        final downloadPath = "/storage/emulated/0/Download";
        final altDownloadDir = Directory(downloadPath);
        if (await altDownloadDir.exists()) {
          downloadsDir = altDownloadDir;
        }
      } else if (Platform.isIOS) {
        downloadsDir = await getApplicationDocumentsDirectory();
      } else {
        throw UnsupportedError('Unsupported platform');
      }

      final newFilePath = "${downloadsDir.path}/$name";
      await sourceFile.copy(newFilePath);
      return newFilePath;
    } catch (e) {
      debugPrint("Error saving PDF: $e");
      return null;
    }
  }

  Future<bool> _requiresStoragePermission() async {
    if (!Platform.isAndroid) return false;
    final androidVersion =
        int.tryParse(Platform.version.split(" ").first) ?? 30;
    return androidVersion < 29;
  }
}
