import 'package:get_storage/get_storage.dart';

class MegartLocalStorage {
  // Save data to local storage
  static final MegartLocalStorage _instance = MegartLocalStorage._internal();
  factory MegartLocalStorage() {
    return _instance;

  }
  // private constructor
  MegartLocalStorage._internal();
  final _storage = GetStorage();

  // Save data to local storage
  static Future<void> saveData<M>(String key, M value) async {
    await _storage.write(key, value);
  }

  // Retrieve data from local storage]
  static M? getData<M>(String key) {
    return _storage.read<M>(key);
  }

  // Remove data from local storage
  static Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  // Clear all data from local storage
  static Future<void> clearAllData() async {  
    await _storage.erase();
  }

  

}
