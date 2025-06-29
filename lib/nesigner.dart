import 'dart:typed_data';

import 'package:nostr_sdk/signer/nostr_signer.dart';
import 'package:nostr_sdk/utils/string_util.dart';

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

  static String getPinCodeFromKey(String key) {
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

  static String genKey(String pinCode, {String? pubkey}) {
    if (StringUtil.isNotBlank(pubkey)) {
      return "${Nesigner.URI_PRE}:$pinCode?pubkey=$pubkey";
    }

    return "${Nesigner.URI_PRE}:$pinCode";
  }

  factory Nesigner(String pinCode, {String? pubkey}) =>
      getNesignerInstance(pinCode, pubkey: pubkey);

  // start the nesigner service.
  Future<bool> start();

  // update the private key.
  Future<int?> updateKey(String pinCode, String key);
}
