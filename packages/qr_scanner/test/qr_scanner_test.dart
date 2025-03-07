import 'package:flutter_test/flutter_test.dart';
import 'package:qr_scanner/qr_scanner.dart';
import 'package:qr_scanner/qr_scanner_platform_interface.dart';
import 'package:qr_scanner/qr_scanner_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockQrScannerPlatform
    with MockPlatformInterfaceMixin
    implements QrScannerPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final QrScannerPlatform initialPlatform = QrScannerPlatform.instance;

  test('$MethodChannelQrScanner is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelQrScanner>());
  });

  test('getPlatformVersion', () async {
    QrScanner qrScannerPlugin = QrScanner();
    MockQrScannerPlatform fakePlatform = MockQrScannerPlatform();
    QrScannerPlatform.instance = fakePlatform;

    expect(await qrScannerPlugin.getPlatformVersion(), '42');
  });
}
