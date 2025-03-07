import 'package:qr_scanner/src/domain/entities/qr_code_entity.dart';

abstract class QrScannerState {}

class QrScannerInitial extends QrScannerState {}

class QrScannerLoading extends QrScannerState {}

class QrScannerLoaded extends QrScannerState {
  final List<QrCodeEntity> history;

  QrScannerLoaded(this.history);
}

class QrScannerError extends QrScannerState {
  final String message;

  QrScannerError(this.message);
}
