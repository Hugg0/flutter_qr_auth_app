import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'biometric_auth_platform_interface.dart';

/// An implementation of [BiometricAuthPlatform] that uses method channels.
class MethodChannelBiometricAuth extends BiometricAuthPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('biometric_auth');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
