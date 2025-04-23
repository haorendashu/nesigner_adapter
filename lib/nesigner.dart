import 'dart:typed_data';

import 'package:nostr_sdk/signer/nostr_signer.dart';

import 'nesigner_helper.dart'
    if (dart.library.io) 'nesigner_io.dart'
    if (dart.library.js) 'nesigner_web.dart';

abstract class Nesigner extends NostrSigner {
  static String URI_PRE = "nesigner";

  static bool isNesignerKey(String key) {
    if (key.startsWith(URI_PRE)) {
      return true;
    }
    return false;
  }

  static String getAesKeyFromKey(String key) {
    var strs = key.split(":");
    if (strs.length >= 2) {
      return strs[1].split("?")[0];
    }

    return key;
  }

  static String? getPubkeyFromKey(String key) {
    var strs = key.split("pubkey=");
    if (strs.length >= 2) {
      return strs[1];
    }

    return key;
  }

  factory Nesigner(String aesKey, {String? pubkey}) =>
      getNesignerInstance(aesKey, pubkey: pubkey);

  // start the nesigner service.
  Future<bool> start();

  // update the private key.
  Future<int?> updateKey(Uint8List aesKey, String key);
}
