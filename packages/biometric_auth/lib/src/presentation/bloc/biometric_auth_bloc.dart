import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:biometric_auth/src/domain/repositories/biometric_auth_repository.dart';
import 'package:biometric_auth/src/domain/entities/biometric_auth_result.dart';

import 'biometric_auth_event.dart';
import 'biometric_auth_state.dart';

class BiometricAuthBloc extends Bloc<BiometricAuthEvent, BiometricAuthState> {
  final BiometricAuthRepository repository;

  BiometricAuthBloc(this.repository) : super(BiometricAuthInitial()) {
    on<CheckDeviceSupportEvent>(_onCheckDeviceSupportEvent);
    on<AuthenticateEvent>(_onAuthenticateEvent);
  }

  Future<void> _onCheckDeviceSupportEvent(
    CheckDeviceSupportEvent event,
    Emitter<BiometricAuthState> emit,
  ) async {
    try {
      emit(BiometricAuthLoading());
      final supported = await repository.isDeviceSupported();
      emit(DeviceSupportState(supported));
    } catch (e) {
      emit(BiometricAuthError(e.toString()));
    }
  }

  Future<void> _onAuthenticateEvent(
    AuthenticateEvent event,
    Emitter<BiometricAuthState> emit,
  ) async {
    try {
      emit(BiometricAuthLoading());
      final result = await repository.authenticate();
      emit(BiometricAuthLoaded(result));
    } catch (e) {
      emit(BiometricAuthError(e.toString()));
    }
  }
}
