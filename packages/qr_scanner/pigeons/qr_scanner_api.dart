import 'package:pigeon/pigeon.dart';

// Mensaje o clase de datos para enviar/recibir entre Flutter y nativo
class QrScanRequest {
  String? instruction;
}

class QrScanResult {
  String? scannedData;
}

// Define la interfaz que Flutter llamará en el código nativo
@HostApi()
abstract class QrScannerApi {
  QrScanResult scanQrCode(QrScanRequest request);
}
