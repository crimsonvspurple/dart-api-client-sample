import 'dart:async';
import 'dart:developer' as dev;

import 'package:hive/hive.dart';
import 'package:http/http.dart';

import 'helpers/hive_item.dart';

class HiveClient {
  // ensure singleton
  static final HiveClient _singleton = HiveClient._internal();

  static Box<HiveItem>? responseBox;

  factory HiveClient() {
    return _singleton;
  }

  HiveClient._internal() {
    // initBox(); (resulting in double call; let's remove)
  }

  Future<Box<HiveItem>> initBox() async {
    // return Future.error("HiveClient.initBox() issued error");
    dev.log("Opening box", name: runtimeType.toString());
    responseBox = await Hive.openBox<HiveItem>('responses');
    dev.log("Box OPENED", name: runtimeType.toString());
    return responseBox!;
  }

  Future<void> setResponse(String key, Response response, int cacheDuration) async {
    // if `key` is very long and/or contains ?&{}"" etc symbols (not sure about exact conditions), this `put` will silently fail. wtf
    if (responseBox == null) {
      dev.log("HiveClient.setResponse() responseBox is null (SET)", name: runtimeType.toString());
      return;
    }
    await responseBox!.put(
        key, HiveItem(response.body, DateTime.now().add(Duration(seconds: cacheDuration)))); // TODO: customize the duration; filter which requests to cache
  }

  String? getResponse(String key) {
    if (responseBox == null) {
      dev.log("HiveClient.setResponse() responseBox is null (GET)", name: runtimeType.toString());
      return null;
    }
    var hiveItem = responseBox!.get(key);
    if (hiveItem == null) {
      return null;
    }
    if (DateTime.now().isAfter(hiveItem.expiry)) {
      // if now is after expiry time
      bustResponse(key);
      return null;
    }
    return hiveItem.item;
  }

  Future<void> bustResponse(String key) async {
    if (responseBox == null) {
      dev.log("HiveClient.setResponse() responseBox is null (BUST)", name: runtimeType.toString());
      return;
    }
    await responseBox!.delete(key);
  }
}
