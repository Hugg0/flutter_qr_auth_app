import 'package:biometric_auth/src/domain/entities/biometric_auth_result.dart';
import 'package:biometric_auth/src/domain/repositories/biometric_auth_repository.dart';

class BiometricAuthRepositoryImpl implements BiometricAuthRepository {
  BiometricAuthRepositoryImpl();

  @override
  Future<BiometricAuthResult> authenticate() async {
    // Implementar la lógica nativa de autenticación biométrica
    // usando Pigeon o MethodChannel.
    // Por ahora, simulamos un resultado exitoso:
    return BiometricAuthResult(
      isAuthenticated: true,
      timestamp: DateTime.now(),
    );
  }

  @override
  Future<bool> isDeviceSupported() async {
    // Verificar compatibilidad biométrica en el dispositivo
    // Llamar código nativo con Pigeon / MethodChannel.
    // Por ahora, devolvemos true simulando que es compatible.
    return true;
  }
}
