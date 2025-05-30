import 'package:easy_vat_v2/app/core/utils/internet_connectivity_checker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final connectionProvider =
    StateNotifierProvider<NetworkConnectionCheckerNotifier, ConnectivityState>(
  (ref) {
    final connection = ref.watch(internetConnectivityCheckerProvider);
    return NetworkConnectionCheckerNotifier(
      connection,
    );
  },
);

//

final internetConnectivityCheckerProvider =
    Provider<InternetConnectivityChecker>((ref) {
  return InternetConnectivityChecker();
});

class NetworkConnectionCheckerNotifier
    extends StateNotifier<ConnectivityState> {
  final InternetConnectivityChecker _connectivityService;

  NetworkConnectionCheckerNotifier(this._connectivityService)
      : super(ConnectivityState.connected) {
    _connectivityService.connectionChange.listen((isConnected) {
      state = isConnected
          ? ConnectivityState.connected
          : ConnectivityState.disconnected;
    });
  }
}

enum ConnectivityState {
  disconnected,
  connected,
}
