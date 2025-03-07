import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_scanner/src/domain/entities/qr_code_entity.dart';
import 'package:qr_scanner/src/domain/repositories/qr_scanner_repository.dart';

import 'qr_scanner_event.dart';
import 'qr_scanner_state.dart';

class QrScannerBloc extends Bloc<QrScannerEvent, QrScannerState> {
  final QrScannerRepository repository;

  QrScannerBloc(this.repository) : super(QrScannerInitial()) {
    on<ScanQrCodeEvent>(_onScanQrCodeEvent);
    on<LoadHistoryEvent>(_onLoadHistoryEvent);
    on<SaveScannedCodeEvent>(_onSaveScannedCodeEvent);
  }

  Future<void> _onScanQrCodeEvent(
    ScanQrCodeEvent event,
    Emitter<QrScannerState> emit,
  ) async {
    try {
      emit(QrScannerLoading());
      final qrCode = await repository.scanQrCode();
      // Después de escanear, podrías guardar el código y recargar la lista
      await repository.saveScannedCode(qrCode);
      final updatedHistory = await repository.getScannedHistory();
      emit(QrScannerLoaded(updatedHistory));
    } catch (e) {
      emit(QrScannerError(e.toString()));
    }
  }

  Future<void> _onLoadHistoryEvent(
    LoadHistoryEvent event,
    Emitter<QrScannerState> emit,
  ) async {
    try {
      emit(QrScannerLoading());
      final history = await repository.getScannedHistory();
      emit(QrScannerLoaded(history));
    } catch (e) {
      emit(QrScannerError(e.toString()));
    }
  }

  Future<void> _onSaveScannedCodeEvent(
    SaveScannedCodeEvent event,
    Emitter<QrScannerState> emit,
  ) async {
    try {
      emit(QrScannerLoading());
      final qrCode = QrCodeEntity(
        data: event.data,
        scannedAt: DateTime.now(),
      );
      await repository.saveScannedCode(qrCode);
      final updatedHistory = await repository.getScannedHistory();
      emit(QrScannerLoaded(updatedHistory));
    } catch (e) {
      emit(QrScannerError(e.toString()));
    }
  }
}
