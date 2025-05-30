import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/localization/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

@RoutePage()
class BarcodeScannerScreen extends StatefulWidget {
  const BarcodeScannerScreen({super.key});

  @override
  State<BarcodeScannerScreen> createState() => _BarcodeScannerScreenState();
}

class _BarcodeScannerScreenState extends State<BarcodeScannerScreen>
    with SingleTickerProviderStateMixin {
  late MobileScannerController cameraController;
  bool _isScanning = true;
  bool _isTorchOn = false;

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    cameraController = MobileScannerController(
      facing: CameraFacing.back,
      torchEnabled: false,
      formats: const [BarcodeFormat.all],
    );

    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
      ),
    );

    _animationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.translate(AppStrings.scanBarCode)),
        actions: [
          IconButton(
            icon: Icon(_isTorchOn ? Icons.flash_on : Icons.flash_off),
            onPressed: () async {
              await cameraController.toggleTorch();
              setState(() {
                _isTorchOn = !_isTorchOn;
              });
            },
          ),
          // IconButton(
          //   icon: const Icon(Icons.flip_camera_ios),
          //   onPressed: () async {
          //     await cameraController.switchCamera();
          //   },
          // ),
        ],
      ),
      body: Stack(
        children: [
          MobileScanner(
            controller: cameraController,
            onDetect: (capture) {
              final List<Barcode> barcodes = capture.barcodes;
              if (barcodes.isNotEmpty && _isScanning) {
                _isScanning = false;
                final String code = barcodes.first.rawValue ?? 'Unknown code';
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${AppStrings.barcodeFound} $code'),
                    duration: const Duration(seconds: 3),
                  ),
                );
                Future.delayed(const Duration(seconds: 3), () {
                  if (mounted) {
                    setState(() {
                      _isScanning = true;
                    });
                  }
                });
              }
            },
          ),

          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return CustomPaint(
                painter:
                    ScannerOverlayPainter(animationValue: _animation.value),
                child: Container(),
              );
            },
          ),

          // Bottom info text
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 40),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                context.translate(AppStrings.barcodePositionMessage),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    cameraController.dispose();
    _animationController.dispose();
    super.dispose();
  }
}

class ScannerOverlayPainter extends CustomPainter {
  final double animationValue;

  ScannerOverlayPainter({required this.animationValue});

  @override
  void paint(Canvas canvas, Size size) {
    final double scanAreaSize = size.width * 0.7;
    final double scanAreaLeft = (size.width - scanAreaSize) / 2;
    final double scanAreaTop = (size.height - scanAreaSize) / 2;
    final double scanAreaRight = scanAreaLeft + scanAreaSize;
    final double scanAreaBottom = scanAreaTop + scanAreaSize;

    final Paint backgroundPaint = Paint()
      ..color = Colors.black.withValues(alpha: 0.5);

    canvas.drawRect(
      Rect.fromLTRB(0, 0, size.width, scanAreaTop),
      backgroundPaint,
    );

    canvas.drawRect(
      Rect.fromLTRB(0, scanAreaBottom, size.width, size.height),
      backgroundPaint,
    );

    canvas.drawRect(
      Rect.fromLTRB(0, scanAreaTop, scanAreaLeft, scanAreaBottom),
      backgroundPaint,
    );

    canvas.drawRect(
      Rect.fromLTRB(scanAreaRight, scanAreaTop, size.width, scanAreaBottom),
      backgroundPaint,
    );

    final Paint borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final Rect scanRect =
        Rect.fromLTRB(scanAreaLeft, scanAreaTop, scanAreaRight, scanAreaBottom);
    canvas.drawRect(scanRect, borderPaint);

    final double cornerSize = 20.0;
    final Paint cornerPaint = Paint()
      ..color = Colors.greenAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    canvas.drawLine(
      Offset(scanAreaLeft, scanAreaTop + cornerSize),
      Offset(scanAreaLeft, scanAreaTop),
      cornerPaint,
    );
    canvas.drawLine(
      Offset(scanAreaLeft, scanAreaTop),
      Offset(scanAreaLeft + cornerSize, scanAreaTop),
      cornerPaint,
    );

    canvas.drawLine(
      Offset(scanAreaRight - cornerSize, scanAreaTop),
      Offset(scanAreaRight, scanAreaTop),
      cornerPaint,
    );
    canvas.drawLine(
      Offset(scanAreaRight, scanAreaTop),
      Offset(scanAreaRight, scanAreaTop + cornerSize),
      cornerPaint,
    );

    canvas.drawLine(
      Offset(scanAreaLeft, scanAreaBottom - cornerSize),
      Offset(scanAreaLeft, scanAreaBottom),
      cornerPaint,
    );
    canvas.drawLine(
      Offset(scanAreaLeft, scanAreaBottom),
      Offset(scanAreaLeft + cornerSize, scanAreaBottom),
      cornerPaint,
    );

    canvas.drawLine(
      Offset(scanAreaRight - cornerSize, scanAreaBottom),
      Offset(scanAreaRight, scanAreaBottom),
      cornerPaint,
    );
    canvas.drawLine(
      Offset(scanAreaRight, scanAreaBottom),
      Offset(scanAreaRight, scanAreaBottom - cornerSize),
      cornerPaint,
    );

    // Animated scan line
    final Paint linePaint = Paint()
      ..color = Colors.greenAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final double scanLineY = scanAreaTop + (scanAreaSize * animationValue);

    canvas.drawLine(
      Offset(scanAreaLeft + 5, scanLineY),
      Offset(scanAreaRight - 5, scanLineY),
      linePaint,
    );
  }

  @override
  bool shouldRepaint(covariant ScannerOverlayPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}
