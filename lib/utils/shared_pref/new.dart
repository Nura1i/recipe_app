import 'package:recipe_app/utils/shared_pref/preferences.dart';
import 'package:uuid/uuid.dart';
abstract class LoginRepository {
  Future<String?> signIn({required String? login, required String? password});
  Future<String?> signUp(
      {required String? login,
      required String? password,
      required String? confirmPassword});
  Future<bool?> logout();
}
class LoginRepo extends LoginRepository {
  LoginRepo.instance();
  static final _instance = LoginRepo.instance();
  factory LoginRepo() {
    return _instance;
  }

  ///logout
  @override
  Future<bool?> logout() {
    return Prefs.deleteData(key: 'token');
  }

  ///login
  @override
  Future<String?> signIn(
      {required String? login, required String? password}) async {
    if (login!.isEmpty) return null;
    if (password!.isEmpty) return null;

    bool? checkPassword =
        password == await Prefs.loadData<String>(key: 'password');
    bool? checkLogin = login == await Prefs.loadData<String>(key: 'login');

    if (checkLogin && checkPassword) {
      final token = const Uuid().v1();
      final succes = await Prefs.saveData(key: 'token', data: token);
      if (succes!) return token;
    }
    return null;
  }

  ///sign up
  @override
  Future<String?> signUp(
      {required String? login,
      required String? password,
      required String? confirmPassword}) async {
    if (login!.isEmpty) {
      return null;
    }

    if (password!.isEmpty) {
      return null;
    }

    if (confirmPassword!.isEmpty) {
      return null;
    }

    if (password != confirmPassword) {
      return null;
    }
    final token = const Uuid().v1();
    await Prefs.updateData<String>(key: 'login', data: login);
    await Prefs.updateData<String>(key: 'password', data: password);
    final isSaved = await Prefs.updateData<String>(key: 'token', data: token);
    if (isSaved!) {
      return token;
    }
    return null;
  }
}
