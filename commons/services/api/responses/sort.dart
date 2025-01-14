import 'package:json_annotation/json_annotation.dart';

part 'sort.g.dart';

@JsonSerializable()
class Sort {
  final bool empty;
  final bool sorted;
  final bool unsorted;

  Sort(this.empty, this.sorted, this.unsorted);

  factory Sort.fromJson(Map<String, dynamic> json) => _$SortFromJson(json);

  Map<String, dynamic> toJson() => _$SortToJson(this);
}
