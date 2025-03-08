import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_scanner/qr_scanner.dart';

class QrScannerScreen extends StatelessWidget {
  const QrScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Escanear Código QR')),
      body: BlocProvider(
        create: (context) => QrScannerBloc(QrScannerRepositoryImpl()),
        child: BlocBuilder<QrScannerBloc, QrScannerState>(
          builder: (context, state) {
            if (state is QrScannerLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is QrScannerLoaded) {
              return ListView.builder(
                itemCount: state.history.length,
                itemBuilder: (context, index) {
                  final qr = state.history[index];
                  return ListTile(
                    title: Text(qr.data),
                    subtitle: Text(qr.scannedAt.toString()),
                  );
                },
              );
            } else if (state is QrScannerError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            // Estado inicial o sin acción: mostrar botón para escanear
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  context.read<QrScannerBloc>().add(ScanQrCodeEvent());
                },
                child: const Text('Escanear Código QR'),
              ),
            );
          },
        ),
      ),
    );
  }
}
