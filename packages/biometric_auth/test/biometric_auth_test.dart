import 'package:flutter_test/flutter_test.dart';
import 'package:biometric_auth/biometric_auth.dart';
import 'package:biometric_auth/biometric_auth_platform_interface.dart';
import 'package:biometric_auth/biometric_auth_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBiometricAuthPlatform
    with MockPlatformInterfaceMixin
    implements BiometricAuthPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final BiometricAuthPlatform initialPlatform = BiometricAuthPlatform.instance;

  test('$MethodChannelBiometricAuth is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBiometricAuth>());
  });

  test('getPlatformVersion', () async {
    BiometricAuth biometricAuthPlugin = BiometricAuth();
    MockBiometricAuthPlatform fakePlatform = MockBiometricAuthPlatform();
    BiometricAuthPlatform.instance = fakePlatform;

    expect(await biometricAuthPlugin.getPlatformVersion(), '42');
  });
}
