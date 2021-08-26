
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:learn/models/common/token.dart';
import 'package:learn/models/user/user_login.dart';

class SecureStorageService{
  static final storage = FlutterSecureStorage();

  static TokenObj? tokenObj;

  static Future setTokenObj(TokenObj token) async{
    await storage.write(key: 'token', value: jsonEncode(token));
    tokenObj = token;
  }

  static Future<TokenObj?> getTokenObj() async{
    try{
      if(tokenObj?.accessToken == null){
        String? token = await storage.read(key: 'token');
        if(token == null || token.isEmpty) return null;
        Map<String, dynamic> json = jsonDecode(token);
        tokenObj = TokenObj.fromJson(json);
        return tokenObj;
      }
      return tokenObj;
    }catch(_) {
      return null;
    }
  }

  static Future removeToke() async{
    tokenObj = null;
    await storage.delete(key: 'token');
  }

  static Future saveAccount(UserLoginForm account)async{
    await storage.write(key: 'account', value: jsonEncode(account));
  }

  static Future removeAccount() async{
    await storage.delete(key: 'account');
  }

  static Future<UserLoginForm?> getStoreAccount() async{
    try{
      String? account = await storage.read(key: 'account');
      if(account == null || account.isEmpty) return null;
      Map<String, dynamic> json = jsonDecode(account);
      return UserLoginForm.fromJson(json);
    }catch(_){
      return null;
    }
  }
}