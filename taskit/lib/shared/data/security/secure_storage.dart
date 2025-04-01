import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:taskit/core/data/local/security/isecure_storage.dart';



class SecureStorage implements ISecureStorage{
  final FlutterSecureStorage _secureStorage;
  SecureStorage(this._secureStorage);
  @override
  Future<void> delete(String key) async {
    try{
      await _secureStorage.delete(key: key);
    }catch(e){
      rethrow;
    }
  }

  @override
  Future<String?> read(String key) async{
    try{
      return await _secureStorage.read(key: key);
    }catch(e){
      rethrow;
    }
  }

  @override
  Future<void> write(String key, String value) async{
    try{
      await _secureStorage.write(key: key, value: value);
    }catch(e){
      rethrow;
    }
  }
  
}