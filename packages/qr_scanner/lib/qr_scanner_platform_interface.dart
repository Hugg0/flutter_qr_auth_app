import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'qr_scanner_method_channel.dart';

abstract class QrScannerPlatform extends PlatformInterface {
  /// Constructs a QrScannerPlatform.
  QrScannerPlatform() : super(token: _token);

  static final Object _token = Object();

  static QrScannerPlatform _instance = MethodChannelQrScanner();

  /// The default instance of [QrScannerPlatform] to use.
  ///
  /// Defaults to [MethodChannelQrScanner].
  static QrScannerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [QrScannerPlatform] when
  /// they register themselves.
  static set instance(QrScannerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
