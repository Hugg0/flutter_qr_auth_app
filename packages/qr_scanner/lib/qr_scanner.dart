

import 'qr_scanner_platform_interface.dart';

// Re-exporta las clases que necesites
export 'src/presentation/bloc/qr_scanner_bloc.dart';
export 'src/presentation/bloc/qr_scanner_event.dart';
export 'src/presentation/bloc/qr_scanner_state.dart';
export 'src/data/repositories/qr_scanner_repository_impl.dart';

// Ahora sí, tu clase
class QrScanner {
  Future<String?> getPlatformVersion() {
    return QrScannerPlatform.instance.getPlatformVersion();
  }
}
