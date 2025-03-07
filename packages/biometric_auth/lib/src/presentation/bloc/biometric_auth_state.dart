import 'package:biometric_auth/src/domain/entities/biometric_auth_result.dart';

abstract class BiometricAuthState {}

class BiometricAuthInitial extends BiometricAuthState {}

class BiometricAuthLoading extends BiometricAuthState {}

class BiometricAuthLoaded extends BiometricAuthState {
  final BiometricAuthResult result;

  BiometricAuthLoaded(this.result);
}

class BiometricAuthError extends BiometricAuthState {
  final String message;

  BiometricAuthError(this.message);
}

class DeviceSupportState extends BiometricAuthState {
  final bool isSupported;

  DeviceSupportState(this.isSupported);
}
