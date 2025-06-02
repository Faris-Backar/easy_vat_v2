// lib/app/presentation/screens/pdf_viewer_screen.dart

// ignore_for_file: deprecated_member_use, depend_on_referenced_packages

import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/localization/app_strings.dart';
import 'package:easy_vat_v2/app/core/resources/url_resources.dart';
import 'package:easy_vat_v2/app/core/utils/dio_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart' as pdf;

import './functions/pdf_downloader_stub.dart'
    if (dart.library.html) './functions/pdf_downloader_web.dart';

@RoutePage()
class PdfViewerScreen extends StatefulWidget {
  final String pdfUrl;
  final String? pdfName;
  final Map<String, dynamic> queryParameters;
  const PdfViewerScreen(
      {super.key,
      required this.pdfUrl,
      this.pdfName,
      required this.queryParameters});

  @override
  State<PdfViewerScreen> createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.translate(AppStrings.salesInvoice)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PdfPreview(
          build: (format) => _loadPdfFromNetwork(),
          allowPrinting: true,
          actions: [],
          useActions: false,
          allowSharing: !kIsWeb,
          canChangePageFormat: false,
          canDebug: false,
          maxPageWidth: 700,
          onPrinted: _showPrintedToast,
          onShared: kIsWeb ? null : _showSharedToast,
          loadingWidget:
              const Center(child: CircularProgressIndicator.adaptive()),
          onError: (context, error) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 64, color: Colors.red),
                const SizedBox(height: 16),
                Text('Failed to load PDF => $error',
                    style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 8),
                Text(error.toString(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ),
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
                  children: const [
                    Icon(Icons.download_rounded, color: Colors.blue, size: 24),
                    SizedBox(height: 4),
                    Text('Download', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
              if (!kIsWeb)
                InkWell(
                  onTap: _sharePDF,
                  borderRadius: BorderRadius.circular(8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.share_rounded, color: Colors.green, size: 24),
                      SizedBox(height: 4),
                      Text('Share', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
              InkWell(
                onTap: _printPDF,
                borderRadius: BorderRadius.circular(8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.print_rounded, color: Colors.orange, size: 24),
                    SizedBox(height: 4),
                    Text('Print', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Uint8List> _loadPdfFromNetwork() async {
    try {
      final response = await DioService().dio.get<List<int>>(
            UrlResources.downloadSalesInvoice,
            queryParameters: widget.queryParameters,
            options: Options(
              responseType: ResponseType.bytes,
            ),
          );

      if (response.statusCode == 200) {
        return Uint8List.fromList(response.data!);
      } else {
        throw Exception('Failed to load PDF: HTTP ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load PDF: $e');
    }
  }

  void _showPrintedToast(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Document printed successfully')),
    );
  }

  void _showSharedToast(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Document shared successfully')),
    );
  }

  Future<void> _downloadPDF() async {
    try {
      final response = await DioService().dio.get<List<int>>(
            widget.pdfUrl,
            queryParameters: widget.queryParameters,
            options: Options(
              responseType: ResponseType.bytes,
            ),
          );
      if (response.statusCode != 200) {
        throw Exception('Failed to download PDF: HTTP ${response.statusCode}');
      }
      final bytes = Uint8List.fromList(response.data!);
      final fileName = '${widget.pdfName} - SalesInvoice.pdf';

      if (kIsWeb) {
        downloadPdfForWeb(bytes, fileName);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("PDF download started")),
          );
        }
      } else {
        final savedPath =
            await _savePdfBytesToDownloads(bytes, fileName: fileName);
        if (savedPath != null && mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("PDF saved to: $savedPath")));
          OpenFilex.open(savedPath);
        } else if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Failed to save PDF")));
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Download failed: $e')));
      }
    }
  }

  Future<void> _sharePDF() async {
    if (kIsWeb) return;
    try {
      final response = await DioService().dio.get<List<int>>(
            widget.pdfUrl,
            queryParameters: widget.queryParameters,
            options: Options(
              responseType: ResponseType.bytes,
            ),
          );
      if (response.statusCode == 200) {
        final tempDir = await getTemporaryDirectory();
        // final fileName =
        //     'temp_share_${DateTime.now().millisecondsSinceEpoch}.pdf';
        final bytes = Uint8List.fromList(response.data!);
        final fileName = '${widget.pdfName} - SalesInvoice.pdf';
        final file = File('${tempDir.path}/$fileName');
        await file.writeAsBytes(bytes);

        await Share.shareXFiles([XFile(file.path)],
            text: 'Sharing SalesInvoice');
      } else {
        throw Exception(
            'Failed to load PDF for sharing: HTTP ${response.statusCode}');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Failed to share PDF: $e')));
      }
    }
  }

  Future<void> _printPDF() async {
    try {
      final response = await DioService().dio.get<List<int>>(
            widget.pdfUrl,
            queryParameters: widget.queryParameters,
            options: Options(
              responseType: ResponseType.bytes,
            ),
          );
      if (response.statusCode == 200) {
        final bytes = Uint8List.fromList(response.data!);
        final fileName = '${widget.pdfName} - SalesInvoice.pdf';
        await Printing.layoutPdf(
          onLayout: (pdf.PdfPageFormat format) async => bytes,
          name: fileName,
        );
        if (mounted) _showPrintedToast(context);
      } else {
        throw Exception(
            'Failed to load PDF for printing: HTTP ${response.statusCode}');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Failed to print PDF: $e')));
      }
    }
  }

  Future<String?> _savePdfBytesToDownloads(Uint8List pdfBytes,
      {String? fileName}) async {
    try {
      final name = fileName ??
          'SalesInvoice_${DateTime.now().millisecondsSinceEpoch}.pdf';
      late Directory downloadsDir;

      if (Platform.isAndroid) {
        if (await _requiresStoragePermission()) {
          final result = await Permission.storage.request();
          if (!result.isGranted) return null;
        }

        downloadsDir = Directory("/storage/emulated/0/Download");
        if (!await downloadsDir.exists()) {
          downloadsDir = await getExternalStorageDirectory() ??
              await getTemporaryDirectory();
        }
      } else if (Platform.isIOS) {
        downloadsDir = await getApplicationDocumentsDirectory();
      } else {
        throw UnsupportedError('Unsupported platform');
      }

      final newFilePath = "${downloadsDir.path}/$name";
      final file = File(newFilePath);
      await file.writeAsBytes(pdfBytes);
      return newFilePath;
    } catch (e) {
      debugPrint("Error saving PDF bytes: $e");
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
