import '../entities/biometric_auth_result.dart';

abstract class BiometricAuthRepository {
  /// Inicia el proceso de autenticación biométrica (Face ID / Huella)
  /// y retorna un [BiometricAuthResult].
  Future<BiometricAuthResult> authenticate();

  /// Verifica si el dispositivo es compatible con autenticación biométrica.
  Future<bool> isDeviceSupported();
}
