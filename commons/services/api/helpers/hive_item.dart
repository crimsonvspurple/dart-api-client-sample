import 'package:hive/hive.dart';

part 'hive_item.g.dart';

@HiveType(typeId: 0)
class HiveItem {
  @HiveField(0)
  String item;
  @HiveField(1)
  DateTime expiry;

  HiveItem(this.item, this.expiry);
}
