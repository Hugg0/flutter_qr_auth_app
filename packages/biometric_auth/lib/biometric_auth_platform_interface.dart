import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'biometric_auth_method_channel.dart';

abstract class BiometricAuthPlatform extends PlatformInterface {
  /// Constructs a BiometricAuthPlatform.
  BiometricAuthPlatform() : super(token: _token);

  static final Object _token = Object();

  static BiometricAuthPlatform _instance = MethodChannelBiometricAuth();

  /// The default instance of [BiometricAuthPlatform] to use.
  ///
  /// Defaults to [MethodChannelBiometricAuth].
  static BiometricAuthPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BiometricAuthPlatform] when
  /// they register themselves.
  static set instance(BiometricAuthPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
