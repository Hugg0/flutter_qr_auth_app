import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'qr_scanner_platform_interface.dart';

/// An implementation of [QrScannerPlatform] that uses method channels.
class MethodChannelQrScanner extends QrScannerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('qr_scanner');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
