import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:http/http.dart' as http;

class Encrypt extends GetxController {
  final _key = encrypt.Key.fromUtf8('kodeenkripsiinibersifatrahasia!!');
  final _iv = encrypt.IV.fromLength(16);

  Map<String, String> encryptData(String data) {
    final encrypter = encrypt.Encrypter(encrypt.AES(_key));
    final encrypted = encrypter.encrypt(data, iv: _iv);

    //output dalam bentuk base64
    return {'encryptedPassword': encrypted.base64, 'iv': _iv.base64};
  }

  Future<String?> loginEncryptData(String email, String password) async {
    String uri = "http://10.0.2.2/project_ahir_mobile_teori_2/fetch_record.php";
    var response = await http.post(Uri.parse(uri), body: {"loginEmail": email});
    final res = jsonDecode(response.body);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data.containsKey('iv')) {
        final encrypter = encrypt.Encrypter(encrypt.AES(_key));
        final ivFromDatabase = encrypt.IV.fromBase64(data['iv']);
        final encrypted = encrypter.encrypt(password, iv: ivFromDatabase);
        return encrypted.base64;
      } else {
        Get.snackbar('Error', res['error'],
            backgroundColor: Colors.red,
            snackPosition: SnackPosition.BOTTOM,
            margin: const EdgeInsets.all(16),
            colorText: Colors.white);
      }
    } else {
      throw Exception("Failed to fetch IV: ${response.statusCode}");
    }
    return null;
  }
}
