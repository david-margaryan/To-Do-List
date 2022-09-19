import 'package:shared_preferences/shared_preferences.dart';

/// Created by David
/// Date: 19.09.22

/// Create SharedPreferences
///
/// [_sharedPrefs] SharedPreferences instance
///
///  [sharedPreferences] getter for [_sharedPrefs]
///
/// [setSharedPreferencesInstance] creates SharedPreferences instance, need to call this function once in [main]
SharedPreferences? _sharedPrefs;

Future<void> setSharedPreferencesInstance() async {
  _sharedPrefs ??= await SharedPreferences.getInstance();
}

SharedPreferences? get sharedPreferences => _sharedPrefs;