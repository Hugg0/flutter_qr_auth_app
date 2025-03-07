import '../entities/qr_code_entity.dart';

abstract class QrScannerRepository {
  /// Escanea un código QR y devuelve un [QrCodeEntity]
  /// con la información escaneada.
  Future<QrCodeEntity> scanQrCode();

  /// Retorna una lista de todos los QR previamente escaneados.
  Future<List<QrCodeEntity>> getScannedHistory();

  /// Guarda un [QrCodeEntity] en el historial.
  Future<void> saveScannedCode(QrCodeEntity code);
}
