import 'package:shared_preferences/shared_preferences.dart';

class SharePrefs {
  static final list_Items = "list_items";
  static SharedPreferences _sharedPreferences;

  static Future setInstance() async {
    if (null != _sharedPreferences) return;

    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setListItems(List<String> value) =>
      _sharedPreferences.setStringList(list_Items, value);
  static List<String> getListItems() =>
      _sharedPreferences.getStringList(list_Items) ?? [];
}

class SharePrefs1 {
  static final list_Items1 = "list_items1";
  static SharedPreferences _sharedPreferences;

  static Future setInstance() async {
    if (null != _sharedPreferences) return;

    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setListItems(List<String> value) =>
      _sharedPreferences.setStringList(list_Items1, value);
  static List<String> getListItems() =>
      _sharedPreferences.getStringList(list_Items1) ?? [];
}

class SharePrefs2 {
  static final list_Items2 = "list_items2";
  static SharedPreferences _sharedPreferences;

  static Future setInstance() async {
    if (null != _sharedPreferences) return;

    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setListItems(List<String> value) =>
      _sharedPreferences.setStringList(list_Items2, value);
  static List<String> getListItems() =>
      _sharedPreferences.getStringList(list_Items2) ?? [];
}


class SharePrefs3 {
  static final list_Items3 = "list_items3";
  static SharedPreferences _sharedPreferences;

  static Future setInstance() async {
    if (null != _sharedPreferences) return;

    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setListItems(List<String> value) =>
      _sharedPreferences.setStringList(list_Items3, value);
  static List<String> getListItems() =>
      _sharedPreferences.getStringList(list_Items3) ?? [];
}
