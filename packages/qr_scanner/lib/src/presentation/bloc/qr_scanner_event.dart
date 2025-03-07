abstract class QrScannerEvent {}

class ScanQrCodeEvent extends QrScannerEvent {}

class LoadHistoryEvent extends QrScannerEvent {}

class SaveScannedCodeEvent extends QrScannerEvent {
  final String data;

  SaveScannedCodeEvent(this.data);
}
