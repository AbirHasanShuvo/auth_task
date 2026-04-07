import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../../../core/network/api_client.dart';
import '../../../core/storage/secure_storage_service.dart';
import '../data/user_model.dart';
import '../services/auth_service.dart';


final apiClientProvider = Provider((ref) => ApiClient());
final storageProvider = Provider((ref) => SecureStorageService());

final authServiceProvider = Provider(
      (ref) => AuthService(ref.read(apiClientProvider)),
);

final authProvider =
StateNotifierProvider<AuthNotifier, AsyncValue<UserModel?>>(
      (ref) => AuthNotifier(
    ref.read(authServiceProvider),
    ref.read(storageProvider),
  ),
);

class AuthNotifier extends StateNotifier<AsyncValue<UserModel?>> {
  final AuthService _authService;
  final SecureStorageService _storage;

  AuthNotifier(this._authService, this._storage)
      : super(const AsyncValue.data(null));

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();

    try {
      final (token, user) = await _authService.login(
        email: email,
        password: password,
      );


      await _storage.saveToken(token);

      state = AsyncValue.data(user);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}