class BiometricAuthResult {
  final bool isAuthenticated;
  final DateTime timestamp;
  final String? errorMessage;

  BiometricAuthResult({
    required this.isAuthenticated,
    required this.timestamp,
    this.errorMessage,
  });
}
